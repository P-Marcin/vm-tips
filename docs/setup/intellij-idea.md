<!-- TOC -->
* [:clipboard: INTELLIJ IDEA SETUP](#clipboard-intellij-idea-setup)
  * [:pushpin: SHORTCUT CONFLICTS](#pushpin-shortcut-conflicts)
    * [:bell: REMOVE `CTRL` + `ALT` + `FN` SHORTCUTS](#bell-remove-ctrl--alt--fn-shortcuts)
    * [:bell: REMOVE `ALT` + `FN` SHORTCUTS](#bell-remove-alt--fn-shortcuts)
    * [:bell: REMOVE `CTRL` + `ALT` + `ARROW` SHORTCUT](#bell-remove-ctrl--alt--arrow-shortcut)
    * [:bell: REMOVE `CTRL` + `SHIFT` + `U` SHORTCUT: TOGGLE CASE IN INTELLIJ IDEA](#bell-remove-ctrl--shift--u-shortcut-toggle-case-in-intellij-idea)
  * [:pushpin: SETTINGS](#pushpin-settings)
    * [:bell: `APPEARANCE & BEHAVIOR` - `SYSTEM SETTINGS`](#bell-appearance--behavior---system-settings)
    * [:bell: `APPEARANCE & BEHAVIOR` - `MENUS AND TOOLBARS`](#bell-appearance--behavior---menus-and-toolbars)
    * [:bell: `KEYMAP`](#bell-keymap)
    * [:bell: `EDITOR` - `GENERAL`](#bell-editor---general)
    * [:bell: `EDITOR` - `GENERAL` - `EDITOR TABS`](#bell-editor---general---editor-tabs)
    * [:bell: `VERSION CONTROL` - `GIT`](#bell-version-control---git)
    * [:bell: `TOOLS` - `ACTIONS ON SAVE`](#bell-tools---actions-on-save)
  * [:pushpin: TABS](#pushpin-tabs)
    * [:bell: GIT](#bell-git)
  * [:pushpin: BOTTOM PANEL](#pushpin-bottom-panel)
<!-- TOC -->

# :clipboard: INTELLIJ IDEA SETUP

## :pushpin: SHORTCUT CONFLICTS

### :bell: REMOVE `CTRL` + `ALT` + `FN` SHORTCUTS

`sudo gedit /etc/X11/xorg.conf` and add:

```
Section "ServerFlags"
    Option "DontVTSwitch" "on"
EndSection
Section "InputClass"
    Identifier "keyboard defaults"
    MatchIsKeyboard "on"
    Option "XKbOptions" "srvrkeys:none"
EndSection
```

### :bell: REMOVE `ALT` + `FN` SHORTCUTS

In `dconf-editor` go to: `/org/gnome/desktop/wm/keybindings/`:
* Remove all `ALT` + `FN` shortcuts: put custom value `[]` instead of `default`
* Find `switch-group`: put custom value `[]` instead of `default`

### :bell: REMOVE `CTRL` + `ALT` + `ARROW` SHORTCUT

In `dconf-editor` go to: `/org/gnome/desktop/wm/keybindings/`:
* Find `move-to-workspace-down` and other `move-to`: put custom value `[]` instead of `default`
* Find `switch-to-workspace-down` and other `switch-to`: put custom value `[]` instead of `default`

### :bell: REMOVE `CTRL` + `SHIFT` + `U` SHORTCUT: TOGGLE CASE IN INTELLIJ IDEA

In `dconf-editor` go to: `/desktop/ibus/panel/emoji/`:
* Find `unicode-hotkey`: put custom value `[]` instead of `default`

## :pushpin: SETTINGS

### :bell: `APPEARANCE & BEHAVIOR` - `SYSTEM SETTINGS`

Project:
* Disable `Reopen projects on startup`
* Default project directory: `/home/mp/projects`

### :bell: `APPEARANCE & BEHAVIOR` - `MENUS AND TOOLBARS`

Navigation Bar Toolbar:
* After `CodeWithMeNavbarGroup`: add action `Soft-Wrap` and separator

### :bell: `KEYMAP`

* Keymap: `XWin`
* `Find Shortcut` -> `Ctrl+Shift+U` -> Remove `Create Link` for Markdown Plugin
* `Find Shortcut` -> `Paste from X clipboard` -> Remove `Middle-click`

### :bell: `EDITOR` - `GENERAL`

Mouse Control:
* `Change font size with Ctrl+Mouse Wheel` in `All editors`

Soft Wraps:
* Turn on `Soft-wrap these files`

### :bell: `EDITOR` - `GENERAL` - `EDITOR TABS`

* Disable `Show tabs in one row`

### :bell: `VERSION CONTROL` - `GIT`

Update:
* Remove `Protected branches`
* `Update method` to `Rebase`

### :bell: `TOOLS` - `ACTIONS ON SAVE`

* `Reformat code`
* `Optimize imports`
* `Run code cleanup`

## :pushpin: TABS

### :bell: GIT

`Commit` tab -> Options menu:
* `Switch to commit dialog`

`Git` tab:
* `Group by` -> `Directory` and `Module`

`Pull Requests` tab -> Options menu:
* `Remove from sidebar`

## :pushpin: BOTTOM PANEL

Right click on bottom panel:
* `Memory Indicator`