#!/bin/bash
# COMMON FUNCTIONS

LIGHT_GREEN="\033[1;32m"
RED="\033[0;31m"
YELLOW="\033[1;33m"
NC="\033[0m"

printDone() {
  echo -e "${LIGHT_GREEN}DONE${NC}"
}

printError() {
  echo -e "${RED}ERROR${NC}"
}