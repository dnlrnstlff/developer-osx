# Developer OSX
Here's what to do after completing a fresh install of OS X.

[Cheat sheet for short hands](/BEST_PRACTICE.md)

### App Store

- Run Software Update - _Install all system updates_
- Install Apps
- Install Xcode

### Configuration

1. __Open Xcode and agree to license__

1. __Automatic Install__
  - Download this project - [Download](https://github.com/ktabori/development-osx/archive/master.zip)
  - `cd` into the project directory
  - __Run `./setup.sh`__

1. __More Configuration__
  - Terminal -> Preferencies -> Profiles -> Settings dropdown -> Import
    - `/Assets/Bash/base16-flat-krta.terminal`
  - [Generate new SSH key](https://help.github.com/articles/generating-ssh-keys/)
  - [Generate an access token](https://help.github.com/articles/creating-an-access-token-for-command-line-use/) for Terminal to auth your GitHub account when 2FA is enabled


### General Settings

  1. __Trackpad__
    - Enable tap to click
    - Secondary click with two fingers
    - Scroll direction - _natural_
    - Disable swipe between pages with two/three fingers
    - Swipe between full-screen apps with three fingers
    - Swipe up with three fingers for Mission Control

  1. __Mouse__
    - Set as right button
    - Enable wipe with two fingers
    - Increase tracking

  1. __Dock__
    - Clean up
    - Auto hide or position left/right (?)
    - Add white spaces
      - `defaults write com.apple.dock persistent-apps -array-add '{"tile-type"="spacer-tile";}'`
      - `killall Dock`

  1. __Finder__
    - Finder -> Preferences
      - Show [Hard disks, External disks, Connected servers] on desktop
      - New Finder windows shows - Home directory
      - Check 'Open folders in tabs istead of new windows'
      - [Sidebar](/BEST_PRACTICE.md)
      - Advanced
        - [x] Show all filename extensions
        - [ ] Show warning before changing an extension
        - [x] Show warning before emptying the Trash
        - [x] Empty Trash securely
        - Search the Current Folder
    - Clean up menu bar 'View -> Customize Toolbar...'
    - Change view options to show Path & Status Bars

  1. __Dashboard__
    - System Preferences -> Mission Control -> Dashboard -> 'Off'

  1. __Desktop__
    - Right click on desktop -> Show View Options
      - Icon Size: 44x44
      - Grid Spacing: step 5
      - Text Size: 11
      - Label position: Right
      - [x] Show item info
      - [x] Show icon preview
      - Sort by: 'Kind'
