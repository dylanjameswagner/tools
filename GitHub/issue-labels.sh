#!/bin/bash

# Git User/Pass
# Setup GitHub Access Token with full access https://github.com/settings/tokens
USER=$GIT_AUTH_USER
PASS=$GIT_AUTH_TOKEN

if git rev-parse --git-dir > /dev/null 2>&1; then :
	# This is a valid git repository (but the current working
	# directory may not be the top level.
	# Check the output of the git rev-parse command if you care)

	# OWNER=`git remote show origin | grep "Fetch URL:" | cut -d "@" -f2 | cut -d ":" -f2 | cut -d "/" -f1`
	OWNER=`git remote show github | grep "Fetch URL:" | cut -d "@" -f2 | cut -d ":" -f2 | cut -d "/" -f1`

	echo $OWNER

	# REPO=`git remote show origin | grep "Fetch URL:" | sed "s#^.*/\(.*\).git#\1#"`
	REPO=`git remote show github | grep "Fetch URL:" | sed "s#^.*/\(.*\).git#\1#"`

	echo $REPO

	# Delete default labels
	curl --user "$USER:$PASS" --include --request DELETE "https://api.github.com/repos/$OWNER/$REPO/labels/bug"
	curl --user "$USER:$PASS" --include --request DELETE "https://api.github.com/repos/$OWNER/$REPO/labels/duplicate"
	curl --user "$USER:$PASS" --include --request DELETE "https://api.github.com/repos/$OWNER/$REPO/labels/enhancement"
	curl --user "$USER:$PASS" --include --request DELETE "https://api.github.com/repos/$OWNER/$REPO/labels/help%20wanted"
	curl --user "$USER:$PASS" --include --request DELETE "https://api.github.com/repos/$OWNER/$REPO/labels/invalid"
	curl --user "$USER:$PASS" --include --request DELETE "https://api.github.com/repos/$OWNER/$REPO/labels/question"
	curl --user "$USER:$PASS" --include --request DELETE "https://api.github.com/repos/$OWNER/$REPO/labels/wontfix"

	# Create labels
	curl --user "$USER:$PASS" --include --request POST --data '{"name":"Accessibility","color":"185194"}' "https://api.github.com/repos/$OWNER/$REPO/labels"
	curl --user "$USER:$PASS" --include --request POST --data '{"name":"Usability","color":"bfd4f2"}' "https://api.github.com/repos/$OWNER/$REPO/labels"
	curl --user "$USER:$PASS" --include --request POST --data '{"name":"Can’t Replicate","color":"f49600"}' "https://api.github.com/repos/$OWNER/$REPO/labels"
	curl --user "$USER:$PASS" --include --request POST --data '{"name":"Out of Scope","color":"f4ac00"}' "https://api.github.com/repos/$OWNER/$REPO/labels"
	curl --user "$USER:$PASS" --include --request POST --data '{"name":"Low Priority","color":"f4eab2"}' "https://api.github.com/repos/$OWNER/$REPO/labels"
	curl --user "$USER:$PASS" --include --request POST --data '{"name":"High Priority","color":"f46400"}' "https://api.github.com/repos/$OWNER/$REPO/labels"
	curl --user "$USER:$PASS" --include --request POST --data '{"name":"Not to Spec","color":"5c0072"}' "https://api.github.com/repos/$OWNER/$REPO/labels"
	curl --user "$USER:$PASS" --include --request POST --data '{"name":"Suggestion","color":"9900bf"}' "https://api.github.com/repos/$OWNER/$REPO/labels"
	curl --user "$USER:$PASS" --include --request POST --data '{"name":"Question","color":"b700bf"}' "https://api.github.com/repos/$OWNER/$REPO/labels"
	curl --user "$USER:$PASS" --include --request POST --data '{"name":"Function","color":"056346"}' "https://api.github.com/repos/$OWNER/$REPO/labels"
	curl --user "$USER:$PASS" --include --request POST --data '{"name":"Performance","color":"004c4a"}' "https://api.github.com/repos/$OWNER/$REPO/labels"
	curl --user "$USER:$PASS" --include --request POST --data '{"name":"Content","color":"B2E0B2"}' "https://api.github.com/repos/$OWNER/$REPO/labels"
	curl --user "$USER:$PASS" --include --request POST --data '{"name":"Style","color":"009800"}' "https://api.github.com/repos/$OWNER/$REPO/labels"
	curl --user "$USER:$PASS" --include --request POST --data '{"name":"Phone","color":"E6E6E6"}' "https://api.github.com/repos/$OWNER/$REPO/labels"
	curl --user "$USER:$PASS" --include --request POST --data '{"name":"Tablet","color":"CFCFCF"}' "https://api.github.com/repos/$OWNER/$REPO/labels"

	curl --user "$USER:$PASS" --include --request POST --data '{"name":"Mac","color":"53067a"}' "https://api.github.com/repos/$OWNER/$REPO/labels"
	curl --user "$USER:$PASS" --include --request POST --data '{"name":"Windows","color":"690670"}' "https://api.github.com/repos/$OWNER/$REPO/labels"
	curl --user "$USER:$PASS" --include --request POST --data '{"name":"iOS 10","color":"db690b"}' "https://api.github.com/repos/$OWNER/$REPO/labels"
	curl --user "$USER:$PASS" --include --request POST --data '{"name":"iOS 9","color":"db690b"}' "https://api.github.com/repos/$OWNER/$REPO/labels"
	curl --user "$USER:$PASS" --include --request POST --data '{"name":"iOS 8","color":"f29000"}' "https://api.github.com/repos/$OWNER/$REPO/labels"
	curl --user "$USER:$PASS" --include --request POST --data '{"name":"Android 6","color":"8adb2c"}' "https://api.github.com/repos/$OWNER/$REPO/labels"
	curl --user "$USER:$PASS" --include --request POST --data '{"name":"Android 5","color":"8adb2c"}' "https://api.github.com/repos/$OWNER/$REPO/labels"
	curl --user "$USER:$PASS" --include --request POST --data '{"name":"Android 4.4.4","color":"5ef23c"}' "https://api.github.com/repos/$OWNER/$REPO/labels"
	curl --user "$USER:$PASS" --include --request POST --data '{"name":"Android 4.4.2","color":"2cdb43"}' "https://api.github.com/repos/$OWNER/$REPO/labels"

	curl --user "$USER:$PASS" --include --request POST --data '{"name":"Chrome","color":"fbd131"}' "https://api.github.com/repos/$OWNER/$REPO/labels"
	curl --user "$USER:$PASS" --include --request POST --data '{"name":"Firefox","color":"cd3e27"}' "https://api.github.com/repos/$OWNER/$REPO/labels"
	curl --user "$USER:$PASS" --include --request POST --data '{"name":"Safari","color":"2994d2"}' "https://api.github.com/repos/$OWNER/$REPO/labels"
	curl --user "$USER:$PASS" --include --request POST --data '{"name":"Edge","color":"004ff2"}' "https://api.github.com/repos/$OWNER/$REPO/labels"
	curl --user "$USER:$PASS" --include --request POST --data '{"name":"IE 11","color":"004ff2"}' "https://api.github.com/repos/$OWNER/$REPO/labels"
	curl --user "$USER:$PASS" --include --request POST --data '{"name":"IE 10","color":"0b18db"}' "https://api.github.com/repos/$OWNER/$REPO/labels"
	curl --user "$USER:$PASS" --include --request POST --data '{"name":"IE 9","color":"3d0cf9"}' "https://api.github.com/repos/$OWNER/$REPO/labels"

else :

	echo "You are not currently in any git repo"

fi
