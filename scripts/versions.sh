#!/bin/bash
# PRINTS DEPENDENCY VERSIONS INSTALLED ON THE SYSTEM

if [ -f "$(dirname "${0}")/functions.sh" ]; then
  source "$(dirname "${0}")/functions.sh"
fi

main() {
  printSection "SYSTEM"
  printVersion "UBUNTU" "$(getUbuntuVersion)"
  printVersion "KERNEL" "$(getKernelVersion)"
  printSection "TOOLS"
  printVersion "INTELLIJ IDEA COMMUNITY" "$(getIntelliJIdeaCommunityVersion)"
  printVersion "KEYSTORE EXPLORER" "$(getKeystoreExplorerVersion)"
  printVersion "POSTMAN" "$(getPostmanVersion)"
  printVersion "GIT" "$(getGitVersion)"
  printVersion "GIT LFS" "$(getGitLfsVersion)"
  printVersion "KAFKA" "$(getKafkaVersion)"
  printVersion "TOMCAT" "$(getTomcatVersion)"
  printSection "SDKMAN TOOLS"
  printVersion "SDKMAN" "$(getSdkManVersion)"
  printVersion "JAVA (Oracle)" "$(getJavaVersion)"
  printVersion "MAVEN" "$(getMavenVersion)"
  printVersion "SPRINGBOOT CLI" "$(getSpringBootCliVersion)"
  printSection "DOCKER TOOLS"
  printVersion "DOCKER CLIENT" "$(getDockerClientVersion)"
  printVersion "DOCKER SERVER" "$(getDockerServerVersion)"
  printVersion "CTOP" "$(getCtopVersion)"
  printSection "KUBERNETES TOOLS"
  printVersion "KUBECTL" "$(getKubectlVersion)"
  printVersion "MINIKUBE KUBERNETES" "$(getMinikubeKubernetesVersion)"
  printVersion "MINIKUBE" "$(getMinikubeVersion)"
  printVersion "HELM" "$(getHelmVersion)"
  printVersion "K9S" "$(getK9sVersion)"
  printSection
}

printSection() {
  printSeparator
  if [[ -n "${1}" ]]; then
    printf "${YELLOW}#${NC} ${LIGHT_GREEN}%-50s${NC} ${YELLOW}#${NC}\n" "${1}"
    printSeparator
  fi
}

printSeparator() {
  echo -e "${YELLOW}######################################################${NC}"
}

printVersion() {
  printf "${YELLOW}|${NC} %-25s ${YELLOW}|${NC} %-22s ${YELLOW}|${NC}\n" "${1}" "${2}"
}

getUbuntuVersion() {
  echo "$(cat "/etc/os-release" | grep "VERSION=" | sed "s/VERSION=\"//;s/ LTS.*//")"
}

getKernelVersion() {
  echo "$(uname -s -r | sed "s/Linux //")"
}

getIntelliJIdeaCommunityVersion() {
  echo "$(cat "/opt/intellij-idea/product-info.json" | jq ".version" | sed "s/\"//g")"
}

getKeystoreExplorerVersion() {
  echo "$(dpkg -s kse | grep "Version" | sed "s/Version: //")"
}

getPostmanVersion() {
  echo "$(cat "/opt/postman/app/resources/app/package.json" | grep "version" | sed "s/.*: //;s/\"//g")"
}

getGitVersion() {
  echo "$(git version | sed "s/git version //")"
}

getGitLfsVersion() {
  echo "$(git lfs version | sed "s/git-lfs\///;s/ (GitHub.*//")"
}

getKafkaVersion() {
  echo "$(cat "/opt/kafka/gradle.properties" | grep "version=" | sed "s/version=//")"
}

getTomcatVersion() {
  echo "$(java -cp "/opt/tomcat/lib/catalina.jar" "org.apache.catalina.util.ServerInfo" | grep "Server version" | sed "s/.*\///")"
}

getSdkManVersion() {
  export SDKMAN_DIR="/opt/sdkman"
  [[ -s "/opt/sdkman/bin/sdkman-init.sh" ]] && source "/opt/sdkman/bin/sdkman-init.sh"
  echo "$(sdk version | grep "script" | sed "s/script: //")"
}

getJavaVersion() {
  echo "$(java --version | grep "java.*LTS" | sed "s/java //;s/ .*//")"
}

getMavenVersion() {
  echo "$(mvn --version | grep "Apache Maven" | sed "s/Apache Maven //;s/ .*//")"
}

getSpringBootCliVersion() {
  echo "$(spring version | sed "s/.*v//")"
}

getDockerClientVersion() {
  echo "$(docker version --format "{{.Client.Version}}")"
}

getDockerServerVersion() {
  echo "$(docker version --format "{{.Server.Version}}")"
}

getCtopVersion() {
  echo "$(ctop -v | sed "s/ctop version //;s/, build.*//")"
}

getKubectlVersion() {
  echo "$(kubectl version --client -o yaml | grep -m 1 "gitVersion" | sed "s/.*gitVersion: v//")"
}

getMinikubeKubernetesVersion() {
  echo "$(minikube config get kubernetes-version)"
}

getMinikubeVersion() {
  echo "$(minikube version --short | sed "s/v//")"
}

getHelmVersion() {
  echo "$(helm version --template="Version: {{.Version}}" | sed "s/Version: v//")"
}

getK9sVersion() {
  echo "$(k9s version -s | grep "Version" | sed "s/Version.*v//")"
}

main "${@}"