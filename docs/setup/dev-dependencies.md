<!-- TOC -->
* [:clipboard: DEV DEPENDENCIES SETUP](#clipboard-dev-dependencies-setup)
    * [:bell: CONFIGURE INTELLIJ IDEA COMMUNITY](#bell-configure-intellij-idea-community)
  * [:pushpin: GIT](#pushpin-git)
    * [:bell: CONFIGURE `GIT`](#bell-configure-git)
    * [:bell: INSTALL `GIT` PROMPT](#bell-install-git-prompt)
    * [:bell: CONFIGURE `GIT` PROMPT](#bell-configure-git-prompt)
    * [:bell: CONFIGURE GITHUB TOKEN](#bell-configure-github-token)
<!-- TOC -->

# :clipboard: DEV DEPENDENCIES SETUP

### :bell: CONFIGURE INTELLIJ IDEA COMMUNITY

Open `IntelliJ IDEA` -> `Welcome Screen` -> `Options menu` -> `Edit Custom VM Options` and set:
```bash
-Xms1024m
-Xmx2048m
```

## :pushpin: GIT

### :bell: CONFIGURE `GIT`

https://github.com/settings/emails

Turn on:
- `Keep my email addresses private`
- `Block command line pushes that expose my email`

```bash
git config --global user.name "Marcin P"
git config --global user.email "XXXXXXXX+P-Marcin@users.noreply.github.com"
```

### :bell: INSTALL `GIT` PROMPT

**Git Prompt** is a program which adds the **current branch name** to command prompt.

| COMMAND     | DESCRIPTION                      |
|-------------|----------------------------------|
| `__git_ps1` | check if Git Prompt is installed |

If `__git_ps1` is not found, then
download [`git-prompt.sh`](https://github.com/git/git/blob/master/contrib/completion/git-prompt.sh) script from `git`
repository:
```bash
curl -Lo "${HOME}/.git-prompt.sh" "https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh"
```

### :bell: CONFIGURE `GIT` PROMPT

| COMMAND       | DESCRIPTION                                                                                                        |
|---------------|--------------------------------------------------------------------------------------------------------------------|
| `echo ${PS1}` | display current `PS1` (stands for "**Prompt String One**", the first prompt string that you see at a command line) |

In `~/.bashrc` add `$(__git_ps1 "(%s)")` after `\w` (below example adds additional colors):
```bash
export PS1='\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\[\033[01;33m\]$(__git_ps1 "(%s)")\[\033[00m\]\$ '
```

or if Git Prompt has been installed manually:
```bash
if [ -f ~/.git-prompt.sh ]; then
  source ~/.git-prompt.sh
  export PS1='\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\[\033[01;33m\]$(__git_ps1 "(%s)")\[\033[00m\]\$ '
fi
```

### :bell: CONFIGURE GITHUB TOKEN

https://github.com/settings/tokens

```bash
No expiration
Scope: repo, workflow, read:org, gist
```
