# ALIASES

# UBUNTU
alias bashrc="gedit ${HOME}/.bashrc &"
alias bashaliases="gedit ${HOME}/.bash_aliases &"
alias checkInternet="nmcli device"
alias clear="tput reset"
alias fixInternet="sudo systemctl restart NetworkManager"
alias hosts="sudo gedit /etc/hosts &"
alias largestDir='sudo du -hs --threshold=50M ?(.)[!.]* | sort -hr | head -n 20'
alias largestFile='sudo find . -type f -size +50M -exec du -h '{}' + | sort -hr | head -n 20'
alias ls="exa"
alias src="cd ${HOME}/projects"

# INTELLIJ IDEA
alias idea="/opt/intellij-idea/bin/idea.sh"

# DOCKER
alias d="docker"
complete -F __start_docker d
alias dls="docker container ls -a --format 'table {{.ID}}\t{{.Image}}\t{{.CreatedAt}}\t{{.Status}}\t{{.Names}}'"
alias dlsize="docker container ls -a --format 'table {{.ID}}\t{{.Image}}\t{{.CreatedAt}}\t{{.Status}}\t{{.Names}}\t{{.Size}}'"
alias dils="docker image ls"
alias dilsa="docker image ls -a"
alias dnls="docker network ls"
alias dvls="docker volume ls"
alias fixDocker="sudo systemctl restart NetworkManager docker"
alias fixDockerDanglingImages="docker image rm $(docker image ls --filter 'dangling=true' -q --no-trunc)"

# KUBERNETES
alias k="kubectl"
complete -F __start_kubectl k
alias m="minikube"
complete -F __start_minikube m
alias h="helm"
complete -F __start_helm h

# MAVEN
alias m2="gedit ${HOME}/.m2/settings.xml &"
alias mvnBuildClasspath="mvn dependency:build-classpath"
alias mvnDependencyTree="mvn dependency:tree"
alias mvnEffectivePom="mvn help:effective-pom"
alias mvnSourcesJavadoc="mvn dependency:sources dependency:resolve -Dclassifier=javadoc"
