# :clipboard: ONE-LINE INSTALLATION COMMANDS

## :pushpin: Remote `bash.sh`

```bash
curl -s https://bash.sh | bash
```

## :pushpin: Remote binary

```bash
VERSION="X.X.X"; BINARY="X"; sudo curl -Lo "/usr/local/bin/${BINARY}" "https://github.com/binary/binary/releases/download/v${VERSION}/binary" && sudo chmod +x "/usr/local/bin/${BINARY}"
```

## :pushpin: Remote `deb`

```bash
VERSION="X.X.X"; BINARY="X.deb"; curl -Lo "${BINARY}" "https://github.com/binary/binary/releases/download/v${VERSION}/binary.deb" && sudo apt install ./"${BINARY}" && rm "${BINARY}"
```

## :pushpin: Remote `tar.gz`

```bash
# Binary
VERSION="X.X.X"; BINARY="X"; curl -Lo "${BINARY}.tar.gz" "https://github.com/binary/binary/releases/download/v${VERSION}/binary.tar.gz" && sudo tar -xzf "${BINARY}.tar.gz" --strip-components=1 -C "/usr/local/bin" "linux-amd64/${BINARY}" && sudo chmod +x "/usr/local/bin/${BINARY}" && rm "${BINARY}.tar.gz"

# Directory
VERSION="X.X.X"; DIRECTORY="X"; curl -Lo "${DIRECTORY}.tar.gz" "https://github.com/directory/directory/releases/download/v${VERSION}/directory.tar.gz" && [[ -d "/opt/${DIRECTORY}" ]] && rm -r "/opt/${DIRECTORY}"; mkdir "/opt/${DIRECTORY}" && tar -xzf "${DIRECTORY}.tar.gz" --strip-components=1 -C "/opt/${DIRECTORY}" && rm "${DIRECTORY}.tar.gz"
```

## :pushpin: Remote `tar`

```bash
# Binary
VERSION="X.X.X"; BINARY="X"; curl -Lo "${BINARY}.tar" "https://github.com/binary/binary/releases/download/v${VERSION}/binary.tar" && sudo tar -xf "${BINARY}.tar" --strip-components=1 -C "/usr/local/bin" "linux-amd64/${BINARY}" && sudo chmod +x "/usr/local/bin/${BINARY}" && rm "${BINARY}.tar"

# Directory
VERSION="X.X.X"; DIRECTORY="X"; curl -Lo "${DIRECTORY}.tar" "https://github.com/directory/directory/releases/download/v${VERSION}/directory.tar" && [[ -d "/opt/${DIRECTORY}" ]] && rm -r "/opt/${DIRECTORY}"; mkdir "/opt/${DIRECTORY}" && tar -xf "${DIRECTORY}.tar" --strip-components=1 -C "/opt/${DIRECTORY}" && rm "${DIRECTORY}.tar"
```