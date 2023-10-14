<!-- TOC -->
* [:clipboard: DEV DEPENDENCIES UPDATE](#clipboard-dev-dependencies-update)
  * [:pushpin: SDKMAN AND DEPENDENCIES](#pushpin-sdkman-and-dependencies)
    * [:bell: SDKMAN](#bell-sdkman)
    * [:bell: DEPENDENCIES](#bell-dependencies)
  * [:pushpin: INTELLIJ IDEA COMMUNITY](#pushpin-intellij-idea-community)
  * [:pushpin: KEYSTORE EXPLORER](#pushpin-keystore-explorer)
  * [:pushpin: POSTMAN](#pushpin-postman)
  * [:pushpin: GIT](#pushpin-git)
    * [:bell: `GIT`](#bell-git)
    * [:bell: `GIT-LFS`](#bell-git-lfs)
  * [:pushpin: KAFKA](#pushpin-kafka)
  * [:pushpin: TOMCAT](#pushpin-tomcat)
  * [:pushpin: DOCKER](#pushpin-docker)
    * [:bell: `DOCKER`](#bell-docker)
    * [:bell: `DOCKER` AUTO-COMPLETION](#bell-docker-auto-completion)
    * [:bell: `CTOP`](#bell-ctop)
  * [:pushpin: KUBERNETES](#pushpin-kubernetes)
    * [:bell: `KUBECTL`](#bell-kubectl)
    * [:bell: `KUBECTL` AUTO-COMPLETION](#bell-kubectl-auto-completion)
    * [:bell: `MINIKUBE`](#bell-minikube)
    * [:bell: `MINIKUBE` AUTO-COMPLETION](#bell-minikube-auto-completion)
    * [:bell: `MINIKUBE` CONFIGURATION](#bell-minikube-configuration)
    * [:bell: `HELM`](#bell-helm)
    * [:bell: `HELM` AUTO-COMPLETION](#bell-helm-auto-completion)
    * [:bell: `K9S`](#bell-k9s)
<!-- TOC -->

# :clipboard: DEV DEPENDENCIES UPDATE

## :pushpin: SDKMAN AND DEPENDENCIES

### :bell: SDKMAN

https://github.com/sdkman/sdkman-cli/releases

```bash
sdk selfupdate && sdk update
```

### :bell: DEPENDENCIES

`MAVEN`:

https://maven.apache.org/docs/history.html

```bash
sdk list maven
sdk install maven X.X.X
sdk uninstall maven X.X.X
```

`JAVA`:

https://www.java.com/releases

```bash
sdk list java
sdk install java X.X.X
sdk uninstall java X.X.X
```

`SPRINGBOOT` - SPRING BOOT CLI:

https://github.com/spring-projects/spring-boot/releases

```bash
sdk list springboot
sdk install springboot X.X.X
sdk uninstall springboot X.X.X
```

## :pushpin: INTELLIJ IDEA COMMUNITY

https://www.jetbrains.com/idea/whatsnew/

`CTRL + SHIFT + ALT + S` -> `SDKs` -> update `JDK home path`

`Help` -> `Check for Updates...`

## :pushpin: KEYSTORE EXPLORER

https://github.com/kaikramer/keystore-explorer/releases

```bash
VERSION="X.X.X"; BINARY="kse.deb"; curl -Lo "${BINARY}" "https://github.com/kaikramer/keystore-explorer/releases/download/v${VERSION}/kse_${VERSION}_all.deb" && sudo apt install ./"${BINARY}" && rm "${BINARY}"
```

## :pushpin: POSTMAN

https://www.postman.com/release-notes/postman-app/

```bash
DIRECTORY="postman"; curl -Lo "${DIRECTORY}.tar.gz" "https://dl.pstmn.io/download/latest/linux64" && [[ -d "/opt/${DIRECTORY}" ]] && rm -r "/opt/${DIRECTORY}"; mkdir "/opt/${DIRECTORY}" && tar -xzf "${DIRECTORY}.tar.gz" --strip-components=1 -C "/opt/${DIRECTORY}" && rm "${DIRECTORY}.tar.gz"
```

## :pushpin: GIT

### :bell: `GIT`

https://git-scm.com/downloads

[Ubuntu Update](ubuntu.md) is enough to update Git

### :bell: `GIT-LFS`

https://github.com/git-lfs/git-lfs/releases

[Ubuntu Update](ubuntu.md) is enough to update Git-LFS

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

### :bell: `DOCKER`

https://github.com/moby/moby/releases

https://docs.docker.com/engine/release-notes/

[Ubuntu Update](ubuntu.md) is enough to update Docker

### :bell: `DOCKER` AUTO-COMPLETION

```bash
docker completion bash | sudo tee "/etc/bash_completion.d/docker"
```

### :bell: `CTOP`

https://github.com/bcicen/ctop/releases

```bash
VERSION="X.X.X"; BINARY="ctop"; sudo curl -Lo "/usr/local/bin/${BINARY}" "https://github.com/bcicen/ctop/releases/download/v${VERSION}/ctop-${VERSION}-linux-amd64" && sudo chmod +x "/usr/local/bin/${BINARY}"
```

## :pushpin: KUBERNETES

### :bell: `KUBECTL`

https://github.com/kubernetes/kubernetes/releases

https://kubernetes.io/releases/

```bash
VERSION="X.X.X"; BINARY="kubectl"; sudo curl -Lo "/usr/local/bin/${BINARY}" "https://storage.googleapis.com/kubernetes-release/release/v${VERSION}/bin/linux/amd64/kubectl" && sudo chmod +x "/usr/local/bin/${BINARY}"
```

### :bell: `KUBECTL` AUTO-COMPLETION

```bash
kubectl completion bash | sudo tee "/etc/bash_completion.d/kubectl"
```

### :bell: `MINIKUBE`

https://github.com/kubernetes/minikube/releases

```bash
VERSION="X.X.X"; BINARY="minikube"; sudo curl -Lo "/usr/local/bin/${BINARY}" "https://github.com/kubernetes/minikube/releases/download/v${VERSION}/minikube-linux-amd64" && sudo chmod +x "/usr/local/bin/${BINARY}"
```

### :bell: `MINIKUBE` AUTO-COMPLETION

```bash
minikube completion bash | sudo tee "/etc/bash_completion.d/minikube"
```

### :bell: `MINIKUBE` CONFIGURATION

```bash
minikube config set driver docker
minikube config set kubernetes-version "$(kubectl version --client -o yaml | grep -m 1 gitVersion | sed 's/.*gitVersion: v//')"
```

### :bell: `HELM`

https://github.com/helm/helm/releases

```bash
VERSION="X.X.X"; BINARY="helm"; curl -Lo "${BINARY}.tar.gz" "https://get.helm.sh/helm-v${VERSION}-linux-amd64.tar.gz" && sudo tar -xzf "${BINARY}.tar.gz" --strip-components=1 -C "/usr/local/bin" "linux-amd64/${BINARY}" && sudo chmod +x "/usr/local/bin/${BINARY}" && rm "${BINARY}.tar.gz"
```

### :bell: `HELM` AUTO-COMPLETION

```bash
helm completion bash | sudo tee "/etc/bash_completion.d/helm"
```

### :bell: `K9S`

https://github.com/derailed/k9s/releases

```bash
VERSION="X.X.X"; BINARY="k9s"; curl -Lo "${BINARY}.tar.gz" "https://github.com/derailed/k9s/releases/download/v${VERSION}/k9s_Linux_amd64.tar.gz" && sudo tar -xzf "${BINARY}.tar.gz" -C "/usr/local/bin" "${BINARY}" && sudo chmod +x "/usr/local/bin/${BINARY}" && rm "${BINARY}.tar.gz"
```