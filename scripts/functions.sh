#!/bin/bash
# COMMON FUNCTIONS

# CONSTANTS
readonly OPT_DIR="/opt"
readonly PROGRESS_INDICATOR="."
## COLORS
readonly RESET="\033[0m"
readonly BOLD="\033[1m"
readonly GRAY="\033[1;2m"
readonly RED="\033[1;31m"
readonly GREEN="\033[1;32m"
readonly YELLOW="\033[1;33m"
readonly BLUE="\033[1;34m"
readonly PURPLE="\033[1;35m"
readonly CYAN="\033[1;36m"

# LOGGERS

logStep() {
  local prefix="${1}"
  local stepName="${2}"
  printf "%b%s%b %b%s%b\n" \
    "${CYAN}" "${prefix}" "${RESET}" \
    "${BOLD}" "${stepName}" "${RESET}"
}

logOperation() {
  local prefix="${1}"
  local operationName="${2}"
  printf "%b%s%b %b%s%b %s" \
    "${CYAN}" "${prefix}" "${RESET}" \
    "${BOLD}" "${operationName}" "${RESET}" \
    "${PROGRESS_INDICATOR}${PROGRESS_INDICATOR}${PROGRESS_INDICATOR}"
}

logProgress() {
  local extraChar="${1}"
  local pid="${!}"
  sleep 0.05
  while [[ -d "/proc/${pid}" ]]; do
      sleep 0.5
      printf "%s" "${PROGRESS_INDICATOR}"
  done
  printf " "
  set +o errexit
  wait "${pid}"
  local errorCode="${?}"
  set -o errexit
  case "${errorCode}" in
    # OK
    0) printf "%bO%b%b\n" "${GREEN}" "${RESET}" "${extraChar}";;
    # ALREADY DONE
    10) printf "%b-%b%b\n" "${GRAY}" "${RESET}" "${extraChar}";;
    # ERROR
    *) printf "%bX%b%b\n" "${RED}" "${RESET}" "${extraChar}" 1>&2;;
  esac
}

logDone() {
  local extraChar="${1}"
  printf "%bDONE%b%b\n" "${GREEN}" "${RESET}" "${extraChar}"
}

logAlreadyDone() {
  local extraChar="${1}"
  printf "%bALREADY DONE%b%b\n" "${GRAY}" "${RESET}" "${extraChar}"
}

logUpToDate() {
  local extraChar="${1}"
  printf "%bUP TO DATE%b%b\n" "${GRAY}" "${RESET}" "${extraChar}"
}

logInfo() {
  local msg="${1}"
  printf "%b? INFO:%b %s\n" "${BLUE}" "${RESET}" "${msg}"
}

logWarn() {
  local msg="${1}"
  printf "%b! WARN:%b %s\n" "${YELLOW}" "${RESET}" "${msg}" 1>&2
}

logError() {
  local msg="${1}"
  local extraChar="${2}"
  local prefix="$([[ -n "${msg}" ]] && printf "!!! ")"
  local suffix="$([[ -n "${msg}" ]] && printf ": ")"
  printf "%b%sERROR%s%b%s%b\n" "${RED}" "${prefix}" "${suffix}" "${RESET}" "${msg}" "${extraChar}" 1>&2
}

# EXECUTION TIMER

executionTimerStart() {
  START_TIME=$(date +%s%N)
}

executionTimerEnd() {
  if [[ -z "${START_TIME}" ]]; then
    logError "Execution Timer has not been started"
    return 1
  fi
  END_TIME=$(date +%s%N)
  local EXECUTION_TIME=$((END_TIME - START_TIME))
  EXECUTION_TIME=$(bc <<< "scale=5; ${EXECUTION_TIME} / 1000000000")
  printf "%b^^^ EXECUTION TIME:%b %.5f seconds\n" "${PURPLE}" "${RESET}" "${EXECUTION_TIME/./,}"
}

# VALIDATIONS

validateOperatingSystemSupport() {
  if ! isPackageInstalled "apt-get"; then
    logError "Your operating system is not supported"
    exit 1
  fi
}

validateSystemRestartRequired() {
  if [[ -f "/var/run/reboot-required" ]]; then
    logWarn "System restart is required"
  fi
}

# ASSERTIONS

isOwnerEqualToUser() {
  local dir="${1}"
  stat --format "%U" "${dir}" | grep -q "${USER}"
}

isPackageInstalled() {
  local package="${1}"
  command -v "${package}" >/dev/null
}

isUpdateNeededForFile() {
  local source="${1}"
  local target="${2}"
  [[ ! -f "${target}" ]] || ! cmp -s "${source}" "${target}"
}

# FILE OPERATIONS

appendToFile() {
  local file="${1}"
  local content="${2}"
  if [[ -f "${file}" ]] && ! grep -q --fixed-strings --line-regexp "${content}" "${file}"; then
    printf "\n%s\n" "${content}" | sudo tee --append "${file}" >/dev/null
  else
    return 10
  fi
}

appendToProperty() {
  local file="${1}"
  local key="${2}"
  local value="${3}"
  if [[ -f "${file}" ]] && ! grep -q --fixed-strings "${value}" "${file}"; then
    propertyOld="$(grep "${key}=" "${file}")"
    local propertyNew="$(printf "%s" "${propertyOld}" | sed "s/.$/${value}/")"
    sudo sed --in-place "/${propertyOld//\//\\\/}/c ${propertyNew//\//\\\/}" "${file}"
  else
    return 10
  fi
}

createFile() {
  local file="${1}"
  local content="${2}"
  if [[ ! -f "${file}" ]]; then
    printf "%s" "${content}" | sudo tee "${file}" >/dev/null
  else
    return 10
  fi
}

replaceLine() {
  local file="${1}"
  local line="${2}"
  local replacement="${3}"
  if [[ -f "${file}" ]] && ! grep -q --fixed-strings --line-regexp "${replacement}" "${file}"; then
    sudo sed --in-place "/${line}/c ${replacement}" "${file}"
  else
    return 10
  fi
}

setProperty() {
  local file="${1}"
  local key="${2}"
  local value="${3}"
  local property="${key}=${value}"
  if [[ -f "${file}" ]] && ! grep -q --fixed-strings --line-regexp "${property}" "${file}"; then
    sudo sed --in-place "/${key}=/c ${property}" "${file}"
  else
    return 10
  fi
}

# XDOTOOL OPERATIONS

xdotoolWindowPid() {
  local class="${1}"
  xdotool search --limit 1 --onlyvisible --class "${class}"
}

xdotoolWindowPidSync() {
  local class="${1}"
  xdotool search --sync --limit 1 --onlyvisible --class "${class}"
}

xdotoolWindowRaiseAndFocusSync() {
  local pid="${1}"
  xdotool windowraise "${pid}" sleep 0.2
  xdotool windowfocus "${pid}" sleep 0.2
}

xdotoolMouseMoveClickAndReset() {
  local pid="${1}"
  local x="${2}"
  local y="${3}"
  xdotool mousemove --window "${pid}" "${x}" "${y}" sleep 0.2 click 1 sleep 0.2 mousemove --window "${pid}" 0 0 sleep 0.2
}

# VERSION FETCHING

getUbuntuVersion() {
  grep "VERSION=" "/etc/os-release" | sed "s/.*=\"//;s/ .*//"
}

getKernelVersion() {
  uname -s -r | sed "s/.* //"
}

getIntellijIdeaVersion() {
  [[ -d "${OPT_DIR}/intellij-idea" ]] \
    && jq ".version" "${OPT_DIR}/intellij-idea/product-info.json" | tr -d "\""
}

getKeystoreExplorerVersion() {
  isPackageInstalled "kse" \
    && apt-cache show kse | grep "Version:" | sed "s/.* //"
}

getPostmanVersion() {
  [[ -d "${OPT_DIR}/postman" ]] \
    && jq ".version" "${OPT_DIR}/postman/app/resources/app/package.json" | tr -d "\""
}

getGitVersion() {
  isPackageInstalled "git" \
    && git version | sed "s/.*version //"
}

getGitLfsVersion() {
  isPackageInstalled "git-lfs" \
    && git lfs version | sed "s/.*\///;s/ (.*//"
}

getDockerClientVersion() {
  isPackageInstalled "docker" \
    && docker version --format "{{.Client.Version}}"
}

getDockerServerVersion() {
  isPackageInstalled "docker" \
    && docker version --format "{{.Server.Version}}"
}

getCtopVersion() {
  isPackageInstalled "ctop" \
    && ctop -v | sed "s/.*version //;s/,.*//"
}

getKubectlClientVersion() {
  isPackageInstalled "kubectl" \
    && kubectl version --client | grep "Client Version:" | sed "s/.*v//"
}

getKubectlServerVersion() {
  isPackageInstalled "minikube" \
    && minikube config get "kubernetes-version"
}

getKubectlKrewVersion() {
  [[ -d "${HOME}/.krew" ]] \
    && kubectl krew version | grep "GitTag" | sed "s/.*v//"
}

getMinikubeVersion() {
  isPackageInstalled "minikube" \
    && minikube version --short | tr -d "v"
}

getHelmVersion() {
  isPackageInstalled "helm" \
    && helm version --template="Version: {{.Version}}" | sed "s/.*v//"
}

getK9sVersion() {
  isPackageInstalled "k9s" \
    && k9s version --short | grep "Version" | sed "s/.*v//"
}

getSdkManVersion() {
  isPackageInstalled "sdk" \
    && cat "${OPT_DIR}/sdkman/var/version"
}

getSdkManDependencyVersion() {
  if isPackageInstalled "sdk"; then
    local dependency="${1}"
    readlink "${OPT_DIR}/sdkman/candidates/${dependency}/current"
  fi
}

getKafkaVersion() {
  [[ -d "${OPT_DIR}/kafka" ]] \
    && grep "version=" "${OPT_DIR}/kafka/gradle.properties" | sed "s/.*=//"
}

getTomcatVersion() {
  [[ -d "${OPT_DIR}/tomcat" ]] \
    && ${OPT_DIR}/tomcat/bin/version.sh | grep "Server version:" | sed "s/.*\///"
}
