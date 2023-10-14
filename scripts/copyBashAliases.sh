#!/bin/bash
# COPIES .bash_aliases TO ${HOME}

if [ -f "$(dirname "${0}")/functions.sh" ]; then
  source "$(dirname "${0}")/functions.sh"
fi

main() {
  echo "Copying..."
  copyBashAliases
}

copyBashAliases() {
  echo -en "> .bash_aliases to ${HOME} ... "
  cp ".bash_aliases" "${HOME}" &>/dev/null && printDone || printError
}

main "${@}"