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
  sed -i 's/^  - wordpress_hosting$/  - WordPress Hosting/' $DESTFILE || echo ERROR
  sed -i 's/^  - cpanel_hosting$/  - cPanel Hosting/' $DESTFILE || echo ERROR
  sed -i 's/^  - dns_domain_names$/  - DNS & Domain Names/' $DESTFILE || echo ERROR
  sed -i 's/^  - lamp_hosting$/  - LAMP Hosting/' $DESTFILE || echo ERROR
  sed -i 's/^  - orange$/  - Orange/' $DESTFILE || echo ERROR
  sed -i 's/^  - yellow$/  - Yellow/' $DESTFILE || echo ERROR
  sed -i 's/^  - support_via_email$/  - Support via Email/' $DESTFILE || echo ERROR
  sed -i 's/^  - support_via_phone$/  - Support via Phone/' $DESTFILE || echo ERROR
  sed -i 's/^  - support_via_slack$/  - Support via Slack/' $DESTFILE  || echo ERROR

  yq -i -e -f=process '.section = "issue"' "$DESTFILE"
  yq -i -e -f=process '.ResolvedWhen = "2014-07-11T11:26:00"' "$DESTFILE"

done

