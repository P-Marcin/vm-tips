<!-- TOC -->
* [:clipboard: UBUNTU SETUP](#clipboard-ubuntu-setup)
  * [:pushpin: CREATE VIRTUAL MACHINE](#pushpin-create-virtual-machine)
  * [:pushpin: SETUP VIRTUAL MACHINE](#pushpin-setup-virtual-machine)
    * [:bell: STOP `SUDO` PASSWORD PROMPT](#bell-stop-sudo-password-prompt)
    * [:bell: UPDATE UBUNTU](#bell-update-ubuntu)
    * [:bell: UPDATE VMWARE TOOLS AUTOMATICALLY](#bell-update-vmware-tools-automatically)
    * [:bell: ENABLE SHARED FOLDERS](#bell-enable-shared-folders)
    * [:bell: ENABLE TRASH ICON ON DESKTOP](#bell-enable-trash-icon-on-desktop)
    * [:bell: ENABLE MINIMIZE CLICK ACTION TO DOCK](#bell-enable-minimize-click-action-to-dock)
    * [:bell: DISABLE CORE DUMPS](#bell-disable-core-dumps)
    * [:bell: CHANGE `JOURNALD` SIZE](#bell-change-journald-size)
    * [:bell: `SETTINGS` - `BACKGROUND`](#bell-settings---background)
    * [:bell: `SETTINGS` - `APPEARANCE`](#bell-settings---appearance)
    * [:bell: `SETTINGS` - `MULTITASKING`](#bell-settings---multitasking)
    * [:bell: `SETTINGS` - `PRIVACY` - `FILE HISTORY & TRASH`](#bell-settings---privacy---file-history--trash)
    * [:bell: `SETTINGS` - `PRIVACY` - `DIAGNOSTICS`](#bell-settings---privacy---diagnostics)
    * [:bell: `SETTINGS` - `POWER`](#bell-settings---power)
    * [:bell: `SETTINGS` - `KEYBOARD`](#bell-settings---keyboard)
    * [:bell: `SETTINGS` - `USERS`](#bell-settings---users)
    * [:bell: INSTALL `CHROMIUM`](#bell-install-chromium)
    * [:bell: INSTALL `CURL`](#bell-install-curl)
    * [:bell: INSTALL `DCONF-EDITOR`](#bell-install-dconf-editor)
    * [:bell: INSTALL `GNOME-TWEAKS`](#bell-install-gnome-tweaks)
    * [:bell: INSTALL `GNOME-SHELL-EXTENSION-MANAGER`](#bell-install-gnome-shell-extension-manager)
    * [:bell: INSTALL `JQ`](#bell-install-jq)
    * [:bell: INSTALL `NEOFETCH`](#bell-install-neofetch)
    * [:bell: INSTALL `TERMINATOR`](#bell-install-terminator)
    * [:bell: INSTALL `TLDR`](#bell-install-tldr)
    * [:bell: INSTALL `TREE`](#bell-install-tree)
    * [:bell: INSTALL `UBUNTU-RESTRICTED-EXTRAS`](#bell-install-ubuntu-restricted-extras)
    * [:bell: INSTALL `VLC`](#bell-install-vlc)
    * [:bell: INSTALL `XCLIP`](#bell-install-xclip)
    * [:bell: INSTALL `YARN`](#bell-install-yarn)
    * [:bell: ADD `NEW DOCUMENT` TEMPLATE](#bell-add-new-document-template)
    * [:bell: SHOW HIDDEN FILES](#bell-show-hidden-files)
    * [:bell: FIX "APPIMAGES REQUIRE FUSE TO RUN"](#bell-fix-appimages-require-fuse-to-run)
    * [:bell: FIX MOZILLA FIREFOX DARK THEME BUG](#bell-fix-mozilla-firefox-dark-theme-bug)
    * [:bell: FIX MISSING NETWORK AFTER RESUME FROM SUSPEND](#bell-fix-missing-network-after-resume-from-suspend)
<!-- TOC -->

# :clipboard: UBUNTU SETUP

## :pushpin: CREATE VIRTUAL MACHINE

Open VMware Workstation -> `File` -> `New Virtual Machine` -> `Typical` -> `Browse Installer disc image file (iso)` (https://ubuntu.com/download/desktop)

Easy install operation:
* Full name: `mp`
* User name: `mp`
* Password: `password`

Name the Virtual Machine:
* Virtual Machine name: `mp-vm`
* Location: `D:\VM\mp-vm`

Specify disk capacity:
* Maximum disk size: `50 GB`
* Split virtual disk into multiple files

Ready to create Virtual Machine:
* Customize Hardware:
  * Memory: `8 GB`
  * Number of processors: `4`
  * Remove printer
  * Accelerate 3D graphics: `turn off` to avoid glitches

Keyboard layout:
* `Polish`/`Polish`

Updates and other software:
* Minimal installation
* Download updates while installing Ubuntu
* Install third-party software for graphics and Wi-Fi hardware and additional media formats

Installation type:
* `Erase disk and install Ubuntu` -> `Install now` -> `Continue`

Where are you?
* `Warsaw`

Who are you?
* Your name: `mp`
* Your computer's name: `vm`
* Pick a username: `mp`
* Choose a password: `password`
* Log in automatically

Ubuntu post-installation:
* Online Accounts: `skip`
* Livepatch: `skip`
* Help improve Ubuntu: `no`
* Privacy: `off`
* Software Updater: `Install now`

## :pushpin: SETUP VIRTUAL MACHINE

### :bell: STOP `SUDO` PASSWORD PROMPT

`sudo visudo` and paste the below at the end of the file:

```bash
mp ALL=(ALL) NOPASSWD: ALL
```

### :bell: UPDATE UBUNTU

```bash
echo "Kernel version: $(uname -r)"; echo "$(cat '/etc/os-release' | grep 'VERSION=' | sed 's/VERSION=/Ubuntu version: /;s/"//g')"; sudo apt -y update; sudo apt -y upgrade; sudo apt dist-upgrade; sudo apt autoremove --purge; sudo apt -y autoclean; echo "Kernel version: $(uname -r)"; echo "$(cat '/etc/os-release' | grep 'VERSION=' | sed 's/VERSION=/Ubuntu version: /;s/"//g')"
```

### :bell: UPDATE VMWARE TOOLS AUTOMATICALLY

`Power off` -> `Edit virtual machine settings`:
* Remove CD/DVD
* Remove CD/DVD 2
* Remove Floppy
* Add `CD/DVD (SATA)` as `Auto Detect` without `Connect at power on`

In VM Options:
* `Synchronize guest time with host`
* Set `VMware Tools` to `Update automatically`

<details>
<summary>Reinstall VMWare Tools in case of problems (usually not needed)</summary>

Use `sudo apt upgrade open-vm-tools` or below if still the problem persists.

When starting Ubuntu, click `Player` -> `Manage` -> `Reinstall VMWare Tools`:

```bash
tar -xvzf VMwareTools-version.tar.gz -C ~/Pulpit
sudo ~/Pulpit/vmware-tools-distrib/vmware-install.pl
sudo rm -r ~/Pulpit/vmware-tools-distrib
```
</details>

### :bell: ENABLE SHARED FOLDERS

In VM Options:
* Set shared folders to `Always enabled`
* Add shared folder
* `sudo gedit /etc/fstab`
  * Add `.host:/ /mnt/hgfs fuse.vmhgfs-fuse defaults,allow_other 0 0`
* Restart VM

### :bell: ENABLE TRASH ICON ON DESKTOP

```bash
gsettings set org.gnome.shell.extensions.ding show-trash true
```

### :bell: ENABLE MINIMIZE CLICK ACTION TO DOCK

```bash
gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize'
```

### :bell: DISABLE CORE DUMPS

`sudo gedit /etc/security/limits.conf`:
* Change `#- soft core 0` to `- hard core 0`

### :bell: CHANGE `JOURNALD` SIZE

`sudo gedit /etc/systemd/journald.conf`:
* Add `SystemMaxUse=100M`
* Restart with `sudo systemctl restart systemd-journald`

### :bell: `SETTINGS` - `BACKGROUND`

* Add background from `~/Pictures`

### :bell: `SETTINGS` - `APPEARANCE`

* Style: `Dark`
* Color: `Blue`
* Position of new icons: `Top Left`
* Icon size: `30`
* Position on screen: `Bottom`
* Configure dock behavior:
  * Show trash: `Off`

### :bell: `SETTINGS` - `MULTITASKING`

* Workspaces:
  * Enable `Fixed number of Workspaces`
  * Number of Workspaces: `1`

### :bell: `SETTINGS` - `PRIVACY` - `FILE HISTORY & TRASH`

* File history: `Off`
 
### :bell: `SETTINGS` - `PRIVACY` - `DIAGNOSTICS`

* Send error reports to Canonical: `Off`

### :bell: `SETTINGS` - `POWER`

* Screen blank: `Never`

### :bell: `SETTINGS` - `KEYBOARD`

* `View and Customize shortcuts`:
  * `Switch windows of an app directly`: remove `Alt+F6`

### :bell: `SETTINGS` - `USERS`

* Add avatar from `~/Pictures`

### :bell: INSTALL `CHROMIUM`

Web browser, open-source version of Google Chrome

```bash
sudo snap install chromium
```

### :bell: INSTALL `CURL`

Transfers a URL

```bash
sudo apt install curl
```

### :bell: INSTALL `DCONF-EDITOR`

Graphical editor for `gsettings` and `dconf`

```bash
sudo apt install dconf-editor
```

### :bell: INSTALL `GNOME-TWEAKS`

Customizes GNOME desktop

```bash
sudo apt install gnome-tweaks
```

### :bell: INSTALL `GNOME-SHELL-EXTENSION-MANAGER`

Extension manager for GNOME desktop

```bash
sudo apt install gnome-shell-extension-manager
```

Run `extension-manager` and install extensions:
* `Applications Overview Tooltip`
* `Apt Update Indicator`
* `Clock Override`
* `Force Quit`

### :bell: INSTALL `JQ`

Command-line JSON processor

```bash
sudo apt install jq
```

### :bell: INSTALL `NEOFETCH`

Fast, highly customizable system info script

```bash
sudo apt install neofetch
```

### :bell: INSTALL `TERMINATOR`

Multiple GNOME terminals in one window

```bash
sudo apt install terminator
```

https://github.com/Stunkymonkey/nautilus-open-any-terminal

```bash
sudo apt install python3-pip
sudo apt install python3-nautilus
pip install nautilus-open-any-terminal
nautilus -q
git clone https://github.com/Stunkymonkey/nautilus-open-any-terminal.git nautilus-open-any-terminal
sudo nautilus-open-any-terminal/tools/update-extension-system.sh install
sudo glib-compile-schemas /usr/share/glib-2.0/schemas
gsettings set com.github.stunkymonkey.nautilus-open-any-terminal terminal terminator
gsettings set com.github.stunkymonkey.nautilus-open-any-terminal keybindings '<Ctrl><Alt>t'
gsettings set com.github.stunkymonkey.nautilus-open-any-terminal new-tab true
gsettings set com.github.stunkymonkey.nautilus-open-any-terminal flatpak system
pip uninstall nautilus-open-any-terminal
rm -rf nautilus-open-any-terminal
```

`sudo gedit /usr/share/applications/terminator.desktop`:
* Change `Exec=terminator` to `Exec=terminator --title Terminal --working-directory=/home/mp/projects`

### :bell: INSTALL `TLDR`

Simplified and community-driven man pages

https://tldr.sh

```bash
sudo apt install npm
sudo npm install -g tldr
```

### :bell: INSTALL `TREE`

Lists content of directories in a tree-like format

```bash
sudo apt install tree
```

### :bell: INSTALL `UBUNTU-RESTRICTED-EXTRAS`

Support for MP3 and unencrypted DVD playback, Microsoft TrueType core fonts, Adobe Flash plugin and codecs for common audio and video files

```bash
sudo apt install ubuntu-restricted-extras
```

### :bell: INSTALL `VLC`

Multimedia player

```bash
sudo snap install vlc
```

### :bell: INSTALL `XCLIP`

Command line interface to the X11 clipboard. It allows you to put the output of a command directly into the clipboard so that you don't have to copy & paste from the terminal manually (which can be a tedious task especially if the output is very long). It also allows you to put the contents of a file directly into the clipboard

```bash
sudo apt install xclip
```

### :bell: INSTALL `YARN`

Compiles Casper theme for Ghost

```bash
sudo apt install npm
sudo npm install -g yarn
```

### :bell: ADD `NEW DOCUMENT` TEMPLATE

```bash
touch "/home/mp/Templates/New Document"
```

### :bell: SHOW HIDDEN FILES

`Files` -> `Settings`:
* `Show Hidden Files`

### :bell: FIX "APPIMAGES REQUIRE FUSE TO RUN"

`sudo apt install libfuse2`

### :bell: FIX MOZILLA FIREFOX DARK THEME BUG

`sudo gedit /usr/lib/firefox/firefox.sh` and add:

```bash
GTK_THEME=Adwaita:light

export GTK_THEME
export MOZ_APP_LAUNCHER
```

### :bell: FIX MISSING NETWORK AFTER RESUME FROM SUSPEND

`sudo gedit /etc/pm/sleep.d/network_restart` and add:

```bash
case "${1}" in
  resume|thaw)
    sudo systemctl restart NetworkManager docker
;;
esac
```

Then `sudo chmod +x /etc/pm/sleep.d/network_restart`