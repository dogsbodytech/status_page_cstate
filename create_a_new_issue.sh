#!/usr/bin/env bash
#
# Description:  A script to create a new cstate issue
#
# Usage:  $0
#
# Notes: This script fails if there are more than 9 systems to select from
#

set -e
set -u

# Basic check that we have the tools that all systems should have (uses set -e)
# echo, cd, pwd are all bash built-in's
hash apg
hash date

# Set some variables
SCRIPTDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
DESTDIR="$SCRIPTDIR/content/issues"
SYSTEMS=("WordPress Hosting" "cPanel Hosting" "DNS & Domain Names" "Support via Email" "Support via Phone" "Support via Slack") # See note above when changing
SEVERITY=("notice" "disrupted" "down")

# Some colour settings
NC='\033[0m'             # Text Reset

#Black='\033[0;30m'   # Black
Red='\033[0;31m'     # Red
Green='\033[0;32m'   # Green
Yellow='\033[0;93m'  # Yellow
#Blue='\033[0;34m'    # Blue
Purple='\033[0;35m'  # Purple
#Cyan='\033[0;36m'    # Cyan
#White='\033[0;37m'   # White

# Bold
#BBlack='\033[1;30m'  # Black
#BRed='\033[1;31m'     # Red
#BGreen='\033[1;32m'  # Green
#BYellow='\033[1;33m' # Yellow
#BBlue='\033[1;34m'   # Blue
#BPurple='\033[1;35m' # Purple
#BCyan='\033[1;36m'   # Cyan
#BWhite='\033[1;37m'  # White

# Underline
#UBlack='\033[4;30m'  # Black
#URed='\033[4;31m'    # Red
#UGreen='\033[4;32m'  # Green
#UYellow='\033[4;33m' # Yellow
#UBlue='\033[4;34m'   # Blue
#UPurple='\033[4;35m' # Purple
#UCyan='\033[4;36m'   # Cyan
#UWhite='\033[4;37m'  # White

echo
echo -e "                     ${Red}Create a status page issue${NC}"
echo
echo -e "Hey, I'm clippy, let me help you create a status page..."

NEWSLUG=$(apg -a 1 -n 1 -m 16 -x 16 -MLN)

NEWSYSTEMS=""
while :; do
  echo 
  echo -e "${Yellow}Enter the numbers(s) of the system(s) that are/will be affected:${NC}"
  for (( I=0; I<${#SYSTEMS[@]}; I++ )); do
    echo "      $I - ${SYSTEMS[$I]}"
  done
  echo -e -n "${Purple}Systems: ${NC}"
  read -r NEWSYSTEMS
  [[ $NEWSYSTEMS =~ ^[0-9]+$ ]] || { echo "Enter valid numbers"; continue; }
  for ((I=0; I < ${#NEWSYSTEMS}; I++)); do
    CHAR=${NEWSYSTEMS:I:1}
    set +u
    [[ -z ${SYSTEMS[$CHAR]} ]] && { echo "Error: ${CHAR} is not a valid number"; continue 2; }
    set -u
  done
  break
done

NEWTITLE=""
while [[ $NEWTITLE == "" ]]; do
  echo
  echo -e "${Yellow}Enter a title for your page:${NC}"
  echo -e " e.g. Scheduled Maintenance: Reboot of WordPress Hosting servers"
  echo -e "      Scheduled Maintenance: Security Patching of cPanel Hosting servers"
  echo -e "      Scheduled Maintenance: cPanel Hosting - Network Maintenance"
  echo -e "      Connectivity Issues - cPanel Hosting"
  echo -e "      Outage of Support via E-mail"
  echo -e -n "${Purple}Title: ${NC}"
  read -r NEWTITLE
done

NEWSEVERITY=""
while :; do
  echo
  echo -e "${Yellow}Enter the number that relates to the severity:${NC}"
  for (( I=0; I<${#SEVERITY[@]}; I++ )); do
    echo "      $I - ${SEVERITY[$I]}"
  done
  echo -e -n "${Purple}Severity: ${NC}"
  read -r -n 1 NEWSEVERITY
  echo
  [[ $NEWSEVERITY =~ ^[0-9]+$ ]] || { echo "Enter a valid number"; continue; }
  if [ "$NEWSEVERITY" -ge 0 ] && [ "$NEWSEVERITY" -lt ${#SEVERITY[@]} ]; then
    break
  else
    echo "Enter a number between 0 and ${#SEVERITY[@]}"
  fi
done

NEWDATE=""
while :; do
  echo
  echo -e "${Yellow}Enter the date the issue starts/started:${NC}"
  echo -e " N.B. ${Red}This must be entered in the UTC timezone${NC}"
  echo -e "      The current time is: ${Green}$(date --utc --iso-8601=seconds)${NC}"
  echo -e -n "${Purple}Date: ${NC}"
  read -r DATEIN
  [[ $DATEIN == "" ]] && { echo "Enter a date"; continue; }
  set +e
  NEWDATE=$(date --utc --iso-8601=seconds -d "$DATEIN" 2> /dev/null)
  set -e
  if [[ $NEWDATE == "" ]]; then
    echo "Enter a valid date"
  else
    echo "Using $NEWDATE"
    break
  fi
done

#Is this scheduled maintenance?
#Yes - set informational to true
#Ask for a finished date
# greate timedate URL?
#set resolved true



echo 
echo
echo
echo "---"
echo "title: \"$NEWTITLE\""
echo "date: $NEWDATE"
echo "affected:"
for ((I=0; I < ${#NEWSYSTEMS}; I++)); do
  CHAR=${NEWSYSTEMS:I:1}
  echo "  - ${SYSTEMS[$CHAR]}"
done
echo "severity: ${SEVERITY[$NEWSEVERITY]}"
echo "resolved: false"
echo "slug: $NEWSLUG"
echo "section: issue"
echo "---"
echo SOME TEXT 
echo
echo "<-- remove this comment as required"
echo "***Starting*** {{< track "2022-10-15T21:09:57+00:00" >}} We've identified the issue"
echo "-->"
echo 
echo "<-- remove this comment as required"
echo "***Complete*** {{< track "2022-10-15T21:09:57+00:00" >}} We've identified the issue"
echo "-->"
echo 
echo "<-- remove this comment as required"
echo "***Resolved*** {{< track "2022-10-15T21:09:57+00:00" >}} We've identified the issue"
echo "-->"
echo 
echo "<-- remove this comment as required"
echo "***Investigating*** {{< track "2022-10-15T21:09:57+00:00" >}} We've identified the issue"
echo "-->"
echo
echo "<-- remove this comment as required"
echo "***Update*** {{< track "2022-10-15T21:09:57+00:00" >}} We've identified the issue"
echo "-->"
echo
echo "<-- remove this comment as required"
echo "***Monitoring*** {{< track "2022-10-15T21:09:57+00:00" >}} We've identified the issue"
echo "-->"
echo 
echo 


echo
echo
echo
echo "I've created FILE"
echo "don't forget to change resolved to true"



#resolved: true
#informational: "true"
#resolvedWhen: 2022-08-18T00:00:00Z



#---
#title: "Reboot of WordPress Hosting server - Scheduled Maintenance"
#date: 2022-08-17T21:00:00+00:00
#resolvedWhen: 2022-08-18T00:00:00Z
#resolved: true
#affected:
#  - WordPress Hosting
#severity: notice
#slug: LIRjEImeE7u9I8SN
#section: issue
#informational: "true"
#---



#for SOURCEFILE in "$SOURCEDIR"/*.md; do
#  [ -e "$SOURCEFILE" ] || continue
#  FILENAME=${SOURCEFILE##*/}
#  DESTFILE="$DESTDIR/$FILENAME"
#  echo "Processing $FILENAME file..."; 
#  cp "$SOURCEFILE" "$DESTFILE"
#  yq -i -e -f=process '.section = "issue"' "$DESTFILE"
#  yq -i -e -f=process '.informational = "true"' "$DESTFILE"
#  yq -i -e -f=process '(.severity | select(. == "major-outage")) = "down"' "$DESTFILE"
#  yq -i -e -f=process '(.severity | select(. == "partial-outage")) = "disrupted"' "$DESTFILE"
#  yq -i -e -f=process '(.severity | select(. == "degraded-performance")) = "disrupted"' "$DESTFILE"
#  yq -i -e -f=process '(.severity | select(. == "under-maintenance")) = "notice"' "$DESTFILE"
#  yq -i -e -f=process '.affected = .affectedsystems | del(.affectedsystems)' "$DESTFILE"
#  yq -i -e -f=process '(.affected[] | select(. == "wordpress_hosting")) = "WordPress Hosting"' "$DESTFILE"
#  yq -i -e -f=process '(.affected[] | select(. == "cpanel_hosting")) = "cPanel Hosting"' "$DESTFILE"
#  yq -i -e -f=process '(.affected[] | select(. == "dns_domain_names")) = "DNS & Domain Names"' "$DESTFILE"
#  yq -i -e -f=process '(.affected[] | select(. == "lamp_hosting")) = "LAMP Hosting"' "$DESTFILE"
#  yq -i -e -f=process '(.affected[] | select(. == "orange")) = "Orange"' "$DESTFILE"
#  yq -i -e -f=process '(.affected[] | select(. == "yellow")) = "Yellow"' "$DESTFILE"
#  yq -i -e -f=process '(.affected[] | select(. == "support_via_email")) = "Support via Email"' "$DESTFILE"
#  yq -i -e -f=process '(.affected[] | select(. == "support_via_phone")) = "Support via Phone"' "$DESTFILE"
#  yq -i -e -f=process '(.affected[] | select(. == "support_via_slack")) = "Support via Slack"' "$DESTFILE"
#  yq -i -e -f=process '.aliases += [ "/incidents/" + .id ]' "$DESTFILE"
#  yq -i -e -f=process '.aliases += [ "/incidents/" + .id | downcase ]' "$DESTFILE"
#  yq -i -e -f=process '.slug = .id | del(.id)' "$DESTFILE"
#  yq -i -e -f=process '.resolvedWhen = ((.scheduled + (.duration + "m")) // .date), del(.scheduled, .duration)' "$DESTFILE"
#  sed -i 's|<br /><br />|\n\n|g' "$DESTFILE"
#  sed -i 's/^::: update \(.*\) | \(.*\)$/***\1*** {{< track "\2" >}}/g' "$DESTFILE"
#  sed -i 's/^:::$//g' "$DESTFILE"
#done

