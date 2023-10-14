# :clipboard: VMWARE

## :pushpin: VMWARE UPDATE

https://docs.vmware.com/en/VMware-Workstation-Pro/index.html

Turn off Virtual Machine and make a backup.

In VMware Workstation Pro select `Help` -> `Software Updates`:
- `Check for Updates`

If needed: `VM` -> `Manage` -> `Change Hardware Compatibility...`:
- `Alter this virtual machine`

## :pushpin: CREATE NEW VIRTUAL MACHINE

Open VMware Workstation -> `File` -> `New Virtual Machine` -> `Typical` -> `Installer disc image file (iso)` -> `Browse...` (https://xubuntu.org/download/)

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
    * USB Controller -> uncheck `Share Bluetooth devices with the virtual machine`
    * Remove printer
    * Accelerate 3D graphics: `turn off` to avoid glitches

Keyboard layout:
* `Polish`/`Polish`

Updates and other software:
* Minimal installation
* Download updates while installing Xubuntu
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

In VM Options:
* Set shared folders to `Always enabled`
* Add shared folder

## :pushpin: UPDATE VMWARE TOOLS AUTOMATICALLY

`Power off` -> `Edit virtual machine settings`:
* Remove CD/DVD
* Remove CD/DVD 2
* Remove Floppy
* Add `CD/DVD (SATA)` as `Auto Detect` without `Connect at power on`

In `Options` -> :
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
