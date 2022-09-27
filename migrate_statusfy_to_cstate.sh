#!/usr/bin/env bash
#
# Description:  A script to migrate Statusfy incidents into cstate format
#
# Usage:  $0
#
# Notes:  Requires `yq` from mikefarah. Install with `sudo snap install yq` on Ubuntu 22.04
#         Yeah, I hard coded the source and destination directories in this script when I 
#           should have used $1 & $2, I'm writing this for a one off migration. Sue me ;-)
#         Files in the destination directory will be knowingly overwritten.
#

set -e
set -u

# Basic check that we have the tools that all systems should have (uses set -e)
# echo, cd, pwd are all bash built-in's
hash cp
hash sed
hash yq

# Set some variables
SCRIPTDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
SOURCEDIR="$SCRIPTDIR/old_incidents/issues"
DESTDIR="$SCRIPTDIR/content/issues"

for SOURCEFILE in $SOURCEDIR/*.md; do
  [ -e "$SOURCEFILE" ] || continue
  FILENAME=${SOURCEFILE##*/}
  DESTFILE="$DESTDIR/$FILENAME"
  echo "Processing $FILENAME file..."; 
  cp "$SOURCEFILE" "$DESTFILE"
  yq -i -e -f=process '.section = "issue"' "$DESTFILE"
  yq -i -e -f=process '(.severity | select(. == "major-outage")) = "down"' "$DESTFILE"
  yq -i -e -f=process '(.severity | select(. == "partial-outage")) = "disrupted"' "$DESTFILE"
  yq -i -e -f=process '(.severity | select(. == "degraded-performance")) = "disrupted"' "$DESTFILE"
  yq -i -e -f=process '(.severity | select(. == "under-maintenance")) = "notice"' "$DESTFILE"
  yq -i -e -f=process '.affected = .affectedsystems | del(.affectedsystems)' "$DESTFILE"
  yq -i -e -f=process '(.affected[] | select(. == "wordpress_hosting")) = "WordPress Hosting"' "$DESTFILE"
  yq -i -e -f=process '(.affected[] | select(. == "cpanel_hosting")) = "cPanel Hosting"' "$DESTFILE"
  yq -i -e -f=process '(.affected[] | select(. == "dns_domain_names")) = "DNS & Domain Names"' "$DESTFILE"
  yq -i -e -f=process '(.affected[] | select(. == "lamp_hosting")) = "LAMP Hosting"' "$DESTFILE"
  yq -i -e -f=process '(.affected[] | select(. == "orange")) = "Orange"' "$DESTFILE"
  yq -i -e -f=process '(.affected[] | select(. == "yellow")) = "Yellow"' "$DESTFILE"
  yq -i -e -f=process '(.affected[] | select(. == "support_via_email")) = "Support via Email"' "$DESTFILE"
  yq -i -e -f=process '(.affected[] | select(. == "support_via_phone")) = "Support via Phone"' "$DESTFILE"
  yq -i -e -f=process '(.affected[] | select(. == "support_via_slack")) = "Support via Slack"' "$DESTFILE"
  yq -i -e -f=process '.aliases += [ "/incidents/" + .id ]' "$DESTFILE"
  yq -i -e -f=process '.slug = .id | del(.id)' "$DESTFILE"
  #yq -i -e -f=process '.date |= tz("UTC")' "$DESTFILE" # convert to UTC??

  yq -i -e -f=process '.ResolvedWhen = .date' "$DESTFILE"
  # .ResolvedWhen should be set to `scheduled` + `duration` if scheduled & duration are set

  sed -i 's|<br /><br />|\n\n|g' $DESTFILE
  sed -i 's/^::: update \(.*\) | \(.*\)$/***\1*** {{< track "\2" >}}/g' $DESTFILE
  sed -i 's/^:::$//g' $DESTFILE
done

