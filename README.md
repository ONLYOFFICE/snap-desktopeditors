[![License](https://img.shields.io/badge/License-GNU%20AGPL%20V3-green.svg?style=flat)](https://www.gnu.org/licenses/agpl-3.0.en.html) [![Snap Status](https://build.snapcraft.io/badge/ONLYOFFICE/snap-desktopeditors.svg)](https://build.snapcraft.io/user/ONLYOFFICE/snap-desktopeditors)

## Overview

ONLYOFFICE Desktop Editors is a free office suite that combines text, spreadsheet and presentation editors allowing to create, view and edit documents stored on your Windows/Linux PC or Mac without an Internet connection. It is fully compatible with Office Open XML formats: .docx, .xlsx, .pptx.

## Functionality

ONLYOFFICE Desktop Editors include the following editors:

* ONLYOFFICE Document Editor
* ONLYOFFICE Spreadsheet Editor
* ONLYOFFICE Presentation Editor
 
The editors allow you to create, edit, save and export text, spreadsheet and presentation documents.

## Installing ONLYOFFICE Desktop Editors using Snapcraft command line tool

ONLYOFFICE Desktop Editors are available in [Snapcraft store](https://snapcraft.io/onlyoffice-desktopeditors) as a snap package. A snap contains all the dependencies to run the application. To use it, all you need is snapd, a system to install and manage snaps. Snapd is included into most of modern distributions. You only need to either enable or install it. See the [official snap project page](https://docs.snapcraft.io/core/install) for the snapd installation instructions.

For example, to install snapd under Ubuntu you need to run the commands:

```
# apt update
# apt install snapd
```

Now the editors can be easily installed using the following command:

```
# snap install onlyoffice-desktopeditors
```

## Running ONLYOFFICE Desktop Editors

Once the installation is over, you can run the editors using the terminal command:

```
$ snap run onlyoffice-desktopeditors
```

In case you prefer to use graphical user interface, you can always find the editors in your computer Application menu - Office - ONLYOFFICE.

## Uninstalling ONLYOFFICE Desktop Editors

To remove the snap containing ONLYOFFICE editors use the following command:

```
# snap remove onlyoffice-desktopeditors
```

## Connect removable media

ONLYOFFICE Desktop Editors can read files from and write files to the `/media` directory. For this use the following command:

```
# snap connect onlyoffice-desktopeditors:removable-media
```

## Project Information

Official website: [https://www.onlyoffice.com/apps.aspx](https://www.onlyoffice.com/apps.aspx/?utm_source=github&utm_medium=cpc&utm_campaign=GitHubSnap)

Code repository: [https://github.com/ONLYOFFICE/DesktopEditors](https://github.com/ONLYOFFICE/DesktopEditors "https://github.com/ONLYOFFICE/DesktopEditors")

## User Feedback and Support

If you have any problems with or questions about ONLYOFFICE Desktop Editors, please visit our official forum to find answers to your questions: [forum.onlyoffice.com][1] or you can ask and answer ONLYOFFICE development questions on [Stack Overflow][3].

  [1]: https://forum.onlyoffice.com
  [2]: https://github.com/ONLYOFFICE/DocumentServer
  [3]: http://stackoverflow.com/questions/tagged/onlyoffice
