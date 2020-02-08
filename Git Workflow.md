# Git Workflow
*Great Video Tutorial*: https://www.youtube.com/watch?v=SWYqp7iY_Tc
## When starting a project	
1. Download [Git](https://git-scm.com/download)	
1. Go to [the repository](https://github.com/acm-projects/reverse-climate-change), and find "Clone or Download," and copy that link	
1. Go to a directory on your system	
1. Open a terminal in that directory	
1. Run `git clone <URL you copied>`	
1. Run `cd <Project directory name>`	
## When working on a project	
1. Go to the directory from the previous instructions	
1. Open a terminal in that directory	
1. Run `git checkout <branch>` or `git checkout -b <branch>` to start a new branch **never developed on the master branch**	
1. Run `git pull`, this should be done everytime you sit down to develop to help avoid huge merge conflicts	
1. If there are merge conflicts, got to "When resolving merge conflicts"	
1. Make your changes	
1. Run `git add <files you want to commit>` or `git add --all` to commit all changed files	
1. Run `git commit -m <descriptive commit message>`	
1. Run `git push` or if there is an error, copy the command given	
## When resolving merge conflicts	
1. Git will throw some ugly looking error	
1. Go into the files it lists, and you will see some blocks of coded that are divided by	
```	
>>>>>>>> <some numbers>	
this is some code	
======	
this is some different code	
>>>>>>>> HEAD	
```	
Delete all of the tags and *one* of the blocks of code	
1. Do this for every file in the list	
1. Commit those changes	
## When finished with a feature	
Every feature should exist only on a branch until this happens...	
1. When a feature is complete and well-tested, push all of the finished code to that branch in GitHub	
1. Go to [the repository](https://github.com/acm-projects/reverse-climate-change) and click "Branches," find your branch, and click "New Pull Request"	
1. Title the Pull Request and write a detailed description of the feature and changes	
1. Assign us as reviewers	
1. Once the pull request has been reviewed, the Project Manager *only* will merge it

---

# Common GitHub Commands
[GitHub Cheatsheet PDF](https://www.atlassian.com/dam/jcr:8132028b-024f-4b6b-953e-e68fcce0c5fa/atlassian-git-cheatsheet.pdf)

Login:

| Command | Description |
| ------ | ------ |
| git config --global user.name "username" |  |
| git config --global user.email "email" |  |
| git config user.name | Checks that you're in, in case you’re unsure |

First Time Setup:

| Command | Description |
| ------ | ------ |
| git clone <repo-url<null>> | Creates local copy of remote repo. Try to not do this again unless you blew up your computer |

General Use

| Command | Description |
| ------ | ------ |
| cd pocket-museum | Change directories over to our repository |
| git branch | Lists branches for you |
| git branch <branch name<null>> | Makes new branch |
| git checkout <branch name<null>> | Switch to branch |
| git checkout -b <branch name<null>> | Creates a new branch and switches to it |
| git add . | Finds all changed files |
| git commit -m <message<null>> | Commit with message |
| git push origin <branch name<null>> | Push to branch |
| git pull origin <branch name<null>> | Pull updates from a specific branch |
