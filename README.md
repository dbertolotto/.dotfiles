# .dotfiles
Collection of various dotfiles.
Run `setup.sh` to link the files to the correct location.

# vim
Run `:PlugInstall` in vim to install the plugins the first time

# bash on windows:
Put this in the `.bashrc`
```bash
export TERM=xterm-256color
```

# useful git commands

## merge project-a into project-b
```bash
cd path/to/project-b
git remote add project-a path/to/project-a
git fetch project-a --tags
git merge --allow-unrelated-histories project-a/master # or whichever branch you want to merge
git remote remove project-a
```
