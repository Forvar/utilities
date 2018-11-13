# Git utilities
## Git aliases
I find really productive to set a bunch of aliases for the git command. Git allows custom sub-command aliases to be set in the file `.gitconfig`.
Copy and paste from the file `git-aliases.txt` the lines you want to use to your `~/.gitconfig` aliases section.
## Git scripts
If an alias is too complex to set, sub-commands can be introduced by adding to your path custom scripts whose name is of the form `git-*`. An example is a version naming script I wrote that creates a commit in the origin/master branch with a proper tag.
For example if you want to take your work in the branch `origin/develop` and commit it as a new release in the master branch with the version name `v2.3.0-beta.4`, you could call the script `git-ver` as follows:

	`git-ver origin/develop v2.3.0-beta.4`

or, if you put the script in e.g. `~/.local/bin`

	`git ver origin/develop v2.3.0-beta.4`
