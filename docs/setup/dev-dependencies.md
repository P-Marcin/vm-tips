<!-- TOC -->
* [:clipboard: DEV DEPENDENCIES SETUP](#clipboard-dev-dependencies-setup)
  * [:pushpin: SDKMAN AND DEPENDENCIES](#pushpin-sdkman-and-dependencies)
    * [:bell: INSTALL `SDK`](#bell-install-sdk)
    * [:bell: ENABLE `SDK` AUTO-COMPLETION](#bell-enable-sdk-auto-completion)
    * [:bell: CONFIGURE `SDK`](#bell-configure-sdk)
    * [:bell: DEPENDENCIES](#bell-dependencies)
  * [:pushpin: INTELLIJ IDEA COMMUNITY](#pushpin-intellij-idea-community)
    * [:bell: INSTALL INTELLIJ IDEA COMMUNITY](#bell-install-intellij-idea-community)
    * [:bell: ADD INTELLIJ IDEA COMMUNITY TO DOCK](#bell-add-intellij-idea-community-to-dock)
    * [:bell: CONFIGURE INTELLIJ IDEA COMMUNITY](#bell-configure-intellij-idea-community)
  * [:pushpin: KEYSTORE EXPLORER](#pushpin-keystore-explorer)
  * [:pushpin: POSTMAN](#pushpin-postman)
    * [:bell: INSTALL POSTMAN](#bell-install-postman)
    * [:bell: ADD POSTMAN TO DOCK](#bell-add-postman-to-dock)
  * [:pushpin: GIT](#pushpin-git)
    * [:bell: INSTALL `GIT`](#bell-install-git)
    * [:bell: INSTALL `GIT-LFS`](#bell-install-git-lfs)
    * [:bell: CONFIGURE `GIT`](#bell-configure-git)
    * [:bell: INSTALL `GIT` PROMPT](#bell-install-git-prompt)
    * [:bell: CONFIGURE `GIT` PROMPT](#bell-configure-git-prompt)
    * [:bell: CONFIGURE GITHUB TOKEN](#bell-configure-github-token)
  * [:pushpin: KAFKA](#pushpin-kafka)
  * [:pushpin: TOMCAT](#pushpin-tomcat)
  * [:pushpin: DOCKER](#pushpin-docker)
    * [:bell: INSTALL `DOCKER`](#bell-install-docker)
    * [:bell: ENABLE `DOCKER` AUTO-COMPLETION](#bell-enable-docker-auto-completion)
    * [:bell: ENABLE IPV4 FORWARDING](#bell-enable-ipv4-forwarding)
    * [:bell: ENABLE MEMORY SWAP](#bell-enable-memory-swap)
    * [:bell: INSTALL `CTOP`](#bell-install-ctop)
  * [:pushpin: KUBERNETES](#pushpin-kubernetes)
    * [:bell: INSTALL `KUBECTL`](#bell-install-kubectl)
    * [:bell: ENABLE `KUBECTL` AUTO-COMPLETION](#bell-enable-kubectl-auto-completion)
    * [:bell: INSTALL `MINIKUBE`](#bell-install-minikube)
    * [:bell: ENABLE `MINIKUBE` AUTO-COMPLETION](#bell-enable-minikube-auto-completion)
    * [:bell: CLEAN `MINIKUBE`](#bell-clean-minikube)
    * [:bell: CONFIGURE `MINIKUBE`](#bell-configure-minikube)
    * [:bell: INSTALL `HELM`](#bell-install-helm)
    * [:bell: ENABLE `HELM` AUTO-COMPLETION](#bell-enable-helm-auto-completion)
    * [:bell: INSTALL `K9S`](#bell-install-k9s)
<!-- TOC -->

# :clipboard: DEV DEPENDENCIES SETUP

## :pushpin: SDKMAN AND DEPENDENCIES

### :bell: INSTALL `SDK`

https://github.com/sdkman/sdkman-cli/releases

```bash
sudo chown -R ${USER}:${USER} /opt
export SDKMAN_DIR=/opt/sdkman && curl -s https://get.sdkman.io | bash
```

### :bell: ENABLE `SDK` AUTO-COMPLETION

`gedit ${SDKMAN_DIR}/etc/config`:
```bash
# enable bash or zsh auto-completion
sdkman_auto_complete=true
```

### :bell: CONFIGURE `SDK`

`gedit ${SDKMAN_DIR}/etc/config`:
- Change `sdkman_colour_enable` from `true` to `false`

### :bell: DEPENDENCIES

`MAVEN`:

https://maven.apache.org/docs/history.html

```bash
sdk list maven
sdk install maven X.X.X
```

`JAVA`:

https://www.java.com/releases

```bash
sdk list java
sdk install java X.X.X
```

`SPRINGBOOT` - SPRING BOOT CLI:

https://github.com/spring-projects/spring-boot/releases

```bash
sdk list springboot
sdk install springboot X.X.X
```

## :pushpin: INTELLIJ IDEA COMMUNITY

### :bell: INSTALL INTELLIJ IDEA COMMUNITY

https://www.jetbrains.com/idea/download/#section=linux

https://www.jetbrains.com/idea/whatsnew/

```bash
VERSION="XXXX.X.X"; DIRECTORY="intellij-idea"; curl -Lo "${DIRECTORY}.tar.gz" "https://download.jetbrains.com/idea/ideaIC-${VERSION}.tar.gz" && [[ -d "/opt/${DIRECTORY}" ]] && rm -r "/opt/${DIRECTORY}"; mkdir "/opt/${DIRECTORY}" && tar -xzf "${DIRECTORY}.tar.gz" --strip-components=1 -C "/opt/${DIRECTORY}" && rm "${DIRECTORY}.tar.gz"
```

### :bell: ADD INTELLIJ IDEA COMMUNITY TO DOCK

`sudo gedit /usr/share/applications/idea.desktop` and add:
```bash
[Desktop Entry]
Type=Application
Name=IntelliJ IDEA
GenericName=IntelliJ IDEA
Comment=The Java IDE for Professional Developers by JetBrains
Icon=/opt/intellij-idea/bin/idea.svg
TryExec=/opt/intellij-idea/bin/idea.sh
Exec=/opt/intellij-idea/bin/idea.sh
Terminal=false
Categories=Development
StartupWMClass=jetbrains-idea-ce
```

### :bell: CONFIGURE INTELLIJ IDEA COMMUNITY

Open `InteliJ IDEA` -> `Welcome Screen` -> `Options menu` -> `Edit Custom VM Options` and set:
```bash
-Xms1024m
-Xmx2048m
```

## :pushpin: KEYSTORE EXPLORER

https://github.com/kaikramer/keystore-explorer/releases

```bash
VERSION="X.X.X"; BINARY="kse.deb"; curl -Lo "${BINARY}" "https://github.com/kaikramer/keystore-explorer/releases/download/v${VERSION}/kse_${VERSION}_all.deb" && sudo apt install ./"${BINARY}" && rm "${BINARY}"
```

## :pushpin: POSTMAN

### :bell: INSTALL POSTMAN

https://www.postman.com/release-notes/postman-app/

```bash
DIRECTORY="postman"; curl -Lo "${DIRECTORY}.tar.gz" "https://dl.pstmn.io/download/latest/linux64" && [[ -d "/opt/${DIRECTORY}" ]] && rm -r "/opt/${DIRECTORY}"; mkdir "/opt/${DIRECTORY}" && tar -xzf "${DIRECTORY}.tar.gz" --strip-components=1 -C "/opt/${DIRECTORY}" && rm "${DIRECTORY}.tar.gz"
```

### :bell: ADD POSTMAN TO DOCK

`sudo gedit /usr/share/applications/postman.desktop` and add:
```bash
[Desktop Entry]
Type=Application
Name=Postman
GenericName=Postman
Comment=API platform for building and using APIs
Icon=/opt/postman/app/icons/icon_128x128.png
TryExec=/opt/postman/Postman
Exec=/opt/postman/Postman
Terminal=false
Categories=Development
StartupWMClass=postman
```

## :pushpin: GIT

### :bell: INSTALL `GIT`

https://git-scm.com/downloads

https://launchpad.net/~git-core/+archive/ubuntu/ppa

```bash
sudo add-apt-repository ppa:git-core/ppa
sudo apt update
sudo apt install git
```

### :bell: INSTALL `GIT-LFS`

https://github.com/git-lfs/git-lfs/releases

https://packagecloud.io/github/git-lfs/install#bash-deb

```bash
curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | sudo bash
sudo apt install git-lfs
```

### :bell: CONFIGURE `GIT`

https://github.com/settings/emails

Turn on:
- `Keep my email addresses private`
- `Block command line pushes that expose my email`

```bash
git config --global user.name "Marcin P"
git config --global user.email "XXXXXXXX+P-Marcin@users.noreply.github.com"
git config --global init.defaultBranch "main"
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

## :pushpin: KAFKA

https://kafka.apache.org/downloads

```bash
VERSION="X.X.X"; DIRECTORY="kafka"; curl -Lo "${DIRECTORY}.tar" "https://downloads.apache.org/kafka/${VERSION}/kafka-${VERSION}-src.tgz" && [[ -d "/opt/${DIRECTORY}" ]] && rm -r "/opt/${DIRECTORY}"; mkdir "/opt/${DIRECTORY}" && tar -xf "${DIRECTORY}.tar" --strip-components=1 -C "/opt/${DIRECTORY}" && rm "${DIRECTORY}.tar"
```

## :pushpin: TOMCAT

https://tomcat.apache.org/download-10.cgi

```bash
VERSION="X.X.X"; DIRECTORY="tomcat"; curl -Lo "${DIRECTORY}.tar.gz" "https://dlcdn.apache.org/tomcat/tomcat-10/v${VERSION}/bin/apache-tomcat-${VERSION}.tar.gz" && [[ -d "/opt/${DIRECTORY}" ]] && rm -r "/opt/${DIRECTORY}"; mkdir "/opt/${DIRECTORY}" && tar -xzf "${DIRECTORY}.tar.gz" --strip-components=1 -C "/opt/${DIRECTORY}" && rm "${DIRECTORY}.tar.gz"
```

## :pushpin: DOCKER

### :bell: INSTALL `DOCKER`

```bash
# Install
curl -s https://get.docker.com | bash
# Manage Docker as a non-root user
sudo usermod -aG docker "${USER}"
# Run Docker daemon
sudo systemctl enable containerd && sudo systemctl start containerd
sudo systemctl enable docker && sudo systemctl start docker
# Change the permissions of docker socket to be able to connect to the Docker daemon
sudo chmod 666 /var/run/docker.sock
```

https://docs.docker.com/engine/install/linux-postinstall/

### :bell: ENABLE `DOCKER` AUTO-COMPLETION

```bash
sudo apt install bash-completion
```

`sudo gedit ~/.bashrc` and add:
```bash
# Bash completion
if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
fi
```

Then:

```bash
docker completion bash | sudo tee "/etc/bash_completion.d/docker"
```

### :bell: ENABLE IPV4 FORWARDING

`sudo gedit /etc/sysctl.conf`:
- Uncomment `net.ipv4.ip_forward = 1`
- `sudo systemctl restart NetworkManager`

### :bell: ENABLE MEMORY SWAP

`sudo gedit /etc/default/grub`:
- Add ` cgroup_enable=memory swapaccount=1` to `GRUB_CMDLINE_LINUX` at the end
- `sudo update-grub`
- Restart VM.

### :bell: INSTALL `CTOP`

https://github.com/bcicen/ctop/releases

```bash
VERSION="X.X.X"; BINARY="ctop"; sudo curl -Lo "/usr/local/bin/${BINARY}" "https://github.com/bcicen/ctop/releases/download/v${VERSION}/ctop-${VERSION}-linux-amd64" && sudo chmod +x "/usr/local/bin/${BINARY}"
```

## :pushpin: KUBERNETES

### :bell: INSTALL `KUBECTL`

https://github.com/kubernetes/kubernetes/releases

```bash
VERSION="X.X.X"; BINARY="kubectl"; sudo curl -Lo "/usr/local/bin/${BINARY}" "https://storage.googleapis.com/kubernetes-release/release/v${VERSION}/bin/linux/amd64/kubectl" && sudo chmod +x "/usr/local/bin/${BINARY}"
```

### :bell: ENABLE `KUBECTL` AUTO-COMPLETION

```bash
kubectl completion bash | sudo tee "/etc/bash_completion.d/kubectl"
```

### :bell: INSTALL `MINIKUBE`

https://github.com/kubernetes/minikube/releases

```bash
VERSION="X.X.X"; BINARY="minikube"; sudo curl -Lo "/usr/local/bin/${BINARY}" "https://github.com/kubernetes/minikube/releases/download/v${VERSION}/minikube-linux-amd64" && sudo chmod +x "/usr/local/bin/${BINARY}"
```

### :bell: ENABLE `MINIKUBE` AUTO-COMPLETION

```bash
minikube completion bash | sudo tee "/etc/bash_completion.d/minikube"
```

### :bell: CLEAN `MINIKUBE`

```
minikube delete --all --purge
```

### :bell: CONFIGURE `MINIKUBE`

```bash
minikube config set driver docker
minikube config set kubernetes-version "$(kubectl version --client -o yaml | grep -m 1 gitVersion | sed 's/.*gitVersion: v//')"
```

### :bell: INSTALL `HELM`

https://github.com/helm/helm/releases

```bash
VERSION="X.X.X"; BINARY="helm"; curl -Lo "${BINARY}.tar.gz" "https://get.helm.sh/helm-v${VERSION}-linux-amd64.tar.gz" && sudo tar -xzf "${BINARY}.tar.gz" --strip-components=1 -C "/usr/local/bin" "linux-amd64/${BINARY}" && sudo chmod +x "/usr/local/bin/${BINARY}" && rm "${BINARY}.tar.gz"
```

### :bell: ENABLE `HELM` AUTO-COMPLETION

```bash
helm completion bash | sudo tee "/etc/bash_completion.d/helm"
```

### :bell: INSTALL `K9S`

https://github.com/derailed/k9s/releases

```bash
VERSION="X.X.X"; BINARY="k9s"; curl -Lo "${BINARY}.tar.gz" "https://github.com/derailed/k9s/releases/download/v${VERSION}/k9s_Linux_amd64.tar.gz" && sudo tar -xzf "${BINARY}.tar.gz" -C "/usr/local/bin" "${BINARY}" && sudo chmod +x "/usr/local/bin/${BINARY}" && rm "${BINARY}.tar.gz"
```