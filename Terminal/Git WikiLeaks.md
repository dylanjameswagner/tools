@see https://wikileaks.org/ciav7p1/cms/page_1179773.html

# Git Tips & Tricks
Add your best Git tricks here! Share the love!

## The "I can never remember that alias I set" Trick
```
[alias]
	aliases = !git config --get-regexp 'alias.*' | colrm 1 6 | sed 's/[ ]/ = /' | sort
```
### Gitignore

	git config --global core.excludesfile ${HOME}/.gitignore

Then create a ~/.gitignore. .gitignore follows glob syntax

##The "The Git URL is too long" Trick

('excerpt-include' missing)

## The "I forgot something in my last commit" Trick

	# first: stage the changes you want incorporated in the previous commit
	# use -C to reuse the previous commit message in the HEAD
	git commit --amend -C HEAD
	# or use -m to make a new message
	git commit --amend -m 'add some stuff and the other stuff i forgot before'

## The "Oh crap I didn't mean to commit yet" Trick

	# undo last commit and bring changes back into staging (i.e. reset to the commit one before HEAD)
	git reset --soft HEAD^

## The "That commit sucked!  Start over!" Trick

	# undo last commit and destroy those awful changes you made (i.e. reset to the commit one before HEAD)
	git reset --hard HEAD^

## The "Oh no I should have been working in a branch" Trick

	# takes staged changes and 'stashes' them for later, and reverts to HEAD.
	git stash

	# creates new branch and switches to it, then takes the stashed changes and stages them in the new branch. fancy!
	git stash branch new-branch-name 	

## The "OK, which commit broke the build!?" Trick

	# Made lots of local commits and haven't run any tests...
	# [unittest runner of choice]
	# Failures... now unclear where it was broken.

	# git bisect to rescue.
	git bisect start # to initiate a bisect
	git bisect bad   # to tell bisect that the current rev is the first spot you know was broken.
	git bisect good <some tag or rev that you knew was working>
	git bisect run [unittest runner of choice]
	# Some runs.
	# BLAMO -- git shows you the commit that broke
	git bisect reset #to exit and put code back to state before git bisect start
	# Fix code. Run tests. Commit working code. Make the world a better place.

## The "I have merge conflicts, but I know that one version is the correct one" Trick, a.k.a. "Ours vs. Theirs"

	# in master
	git merge a_branch
	CONFLICT (content): Merge conflict in conflict.txt
	Automatic merge failed; fix conflicts and then commit.
	git status -s
	UU conflict.txt

	# we know the version of the file from the branch is the version we want.
	git checkout --theirs conflict.txt
	git add conflict.txt
	git commit

	# Sometimes during a merge you want to take a file from one side wholesale.
	# The following aliases expose the ours and theirs commands which let you
	# pick a file(s) from the current branch or the merged branch respectively.
	#
	# N.b. the function is there as hack to get $@ doing
	# what you would expect it to as a shell user.
	# Add the below to your .gitconfig for easy ours/theirs aliases.
	#    ours   = "!f() { git checkout --ours $@ && git add $@; }; f"
	#    theirs = "!f() { git checkout --theirs $@ && git add $@; }; f"

## The "Workaround Self-signed Certificates" Trick
This trick should no longer be necessary for using Stash, so long as you have the certificate for DEVLAN Domain Controller Certificate Authority installed.

	# Issue: When attempting to clone (or any other command that interacts with the remote server) git by default validates
	# the presented SSL certificate by the server.  Our server's certificate is not valid and therefore git exits out with an error.
	# Resolution(Linux): For a one time fix, you can use the env command to create an environment variable of GIT_SSL_NO_VERIFY=TRUE.
	env GIT_SSL_NO_VERIFY=TRUE git <command> <arguments>

	# If you don't want to do this all the time, you can change your git configuration:
	git config --global http.sslVerify false
	Split a subdirectory into a new repository/project
	git clone ssh://stash/proj/mcplugins.git
	cd mcplugins
	git checkout origin/master -b mylib
	git filter-branch --prune-empty --subdirectory-filter plugins/mylib mylib
	git push ssh://stash/proj/mylib.git mylib:master

## Local Branch Cleanup

```
	# Delete local branches that have been merged into HEAD
	git branch --merged | grep -v '\\*\\|master\\|develop' | xargs -n 1 git branch -d
	# Delete local branches that have been merged into origin/master
	git branch --merged origin/master | grep -v '\\*\\|master\\|develop' | xargs -n 1 git branch -d
	# Show what local branches haven't been merged to HEAD
	git branch --no-merged | grep -v '\\*\\|master\\|develop'
```
