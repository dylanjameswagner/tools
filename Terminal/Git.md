# Git

## Rename Origin to Something More Meaningful

	git remote rename origin github
	git remote rename origin pantheon
	git remote rename origin acquia

## Environment Branches
###### Push to Remote-Environment Master

	git push remote-dev master
	git push remote-test master
	git push remote-live master

###### Pull Remote Environment Master to Local Environment Branch

	git pull remote-live master:branch-live
	git pull remote-test master:branch-test
	git pull remote-dev master:branch-dev

###### Push Local Environment Branch to Remote Environment Master (Fast-forward)

	git push remote-dev branch-dev:master
	git push remote-test branch-test:master
	git push remote-live branch-live:master

## Delete Remote Branch

	git push origin --delete <branchName>

## Remove Unwanted Items From Repo History
https://stackoverflow.com/questions/10067848/remove-folder-and-its-contents-from-git-githubs-history

### Remove a Directory from The Git History

	git filter-branch --tree-filter 'rm -rf path/to/dir' --prune-empty HEAD

https://stackoverflow.com/questions/10067848/remove-folder-and-its-contents-from-git-githubs-history/17824718#17824718

If you are here to copy-paste code:

This is an example which removes node_modules from history

	git filter-branch --tree-filter "rm -rf node_modules" --prune-empty HEAD
	git for-each-ref --format="%(refname)" refs/original/ | xargs -n 1 git update-ref -d
	echo node_modules/ >> .gitignore
	git add .gitignore
	git commit -m 'Removing node_modules from git history'
	git gc
	git push origin master --force

What git actually does:

The first line iterates through all references on the same tree (--tree-filter) as HEAD (your current branch), running the command rm -rf node_modules. This command deletes the node_modules folder (-r, without -r, rm won't delete folders), with no prompt given to the user (-f). The added --prune-empty deletes useless (not changing anything) commits recursively.

The second line deletes the reference to that old branch.

The rest of the commands are relatively straightforward.

### Add Directory to the .gitignore and Commit the Change

	echo path/to/dir >> .gitignore
	git add .gitignore
	git commit -m 'Remove path/to/dir from git history'

### Git Garbage Collection

	git gc

### Force Push the Change to Master

	git push origin master --force

## push to multiple remotes
https://stackoverflow.com/questions/14290113/git-pushing-code-to-two-remotes

	git remote add all git@github.com:username/primary.git
	git remote set-url all --add --push git@github.com:username/primary.git
	git remote set-url all --add --push git@github.com:username/secondary.git
	git push all master

	git config -e

## rebase branch (didnt work, might be superfluous)
https://github.com/edx/edx-platform/wiki/How-to-Rebase-a-Pull-Request

	git merge-base my-branch master
	git rebase -i ${HASH}

## Diff some things

	git diff > ~/Desktop/lyttleco.diff

## Git Commands to Know

	git status
	git add .
	git add -A
	git add -u
	git add -p
	git clean -dfn
	git commit
	git commit -m ''
	git commit -am ''
	git commit --amend -m ''
	git branch
	git branch -d
	git branch -m <oldname> <newname>
	git checkout
	git checkout -b
	git reset
	git reset --hard
	git remote -v
	git remote add
	git remote rename <oldname> <newname>
	git pull origin
	git push origin
	git merge

<!--break-->

	.gitignore
