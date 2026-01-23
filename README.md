[![License](https://img.shields.io/badge/License-GNU%20AGPL%20V3-green.svg?style=flat)](https://www.gnu.org/licenses/agpl-3.0.en.html)
[![ONLYOFFICE Desktop Editors](https://snapcraft.io/onlyoffice-desktopeditors/badge.svg)](https://snapcraft.io/onlyoffice-desktopeditors)

<h1>Snap for ONLYOFFICE Desktop Editors</h1>

Welcome to the official Snap package for [ONLYOFFICE Desktop Editors](https://www.onlyoffice.com/desktop?utm_source=github&utm_medium=cpc&utm_campaign=GitHubSnapDesktop)\! This repo provides everything you need to easily install a free office suite on your machine using Snap.

## **What is ONLYOFFICE Desktop Editors?**

[ONLYOFFICE Desktop Editors](https://www.onlyoffice.com/desktop?utm_source=github&utm_medium=cpc&utm_campaign=GitHubSnapDesktop) is a free, open-source office suite pack that allows you to create, view and edit office docs stored on your PC without an Internet connection. Along with offline work, it’s possible to connect the application to the cloud for online document collaboration. It’s fully compatible with Microsoft Office formats (DOCX, XLSX, PPTX) and provides a complete set of tools for all your document needs.

The suite includes:

* **✍️ [Document Editor](https://www.onlyoffice.com/word-processor?utm_source=github&utm_medium=cpc&utm_campaign=GitHubSnapDesktop):** For creating and formatting text documents of any complexity.  
* **📊 [Spreadsheet Editor](https://www.onlyoffice.com/sheets?utm_source=github&utm_medium=cpc&utm_campaign=GitHubSnapDesktop):** For managing and analyzing data with powerful tools, formulas, and charts.  
* **🖥️ [Presentation Editor](https://www.onlyoffice.com/slides?utm_source=github&utm_medium=cpc&utm_campaign=GitHubSnapDesktop):** For designing stunning, professional presentations with a variety of creative tools.  
* **📝 [Form Creator](https://www.onlyoffice.com/form-creator?utm_source=github&utm_medium=cpc&utm_campaign=GitHubSnapDesktop):** For building and filling out complex, fillable PDF forms.  
* **✂️ [PDF Editor](https://www.onlyoffice.com/pdf-editor?utm_source=github&utm_medium=cpc&utm_campaign=GitHubSnapDesktop):** For viewing, annotating, and converting your PDF files.  
* **🖼️ [Diagram Viewer](https://www.onlyoffice.com/diagram-viewer?utm_source=github&utm_medium=cpc&utm_campaign=GitHubSnapDesktop):** For viewing diagrams and flowcharts from Visio and other popular formats.

### AI integration 🤖

Connect any AI model (local or cloud-based) for tasks like chatbot requests, translation, OCR, etc. Use AI agents to generate new files, list folder contents, preview file details without opening them in the editor, auto-fill forms with provided data, etc. [More info about AI tools](https://www.onlyoffice.com/ai-assistants?utm_source=github&utm_medium=cpc&utm_campaign=GitHubSnapDesktop)

## **How to install with Snap using the Snapcraft command line tool 🛠️**

Getting started is easy\! A snap package for ONLYOFFICE Desktop Editors is available in the [Snapcraft Store](https://snapcraft.io/onlyoffice-desktopeditors).

Snaps contain all the necessary dependencies, so you just need to have ```snapd``` installed on your system.

### **Step 1: Check for and install ```snapd```**

Most modern Linux distributions come with ```snapd``` pre-installed. You can check if it's running by typing ```snap \--version``` in your terminal.

If it's not installed, you can easily add it. For example, on Ubuntu and other Debian-based distros, run the following commands. The first command updates your package list, and the second installs ```snapd```.
```
# apt update  
# apt install snapd
```
For instructions on other Linux distributions, please visit the [official Snapcraft documentation](https://snapcraft.io/docs/installing-snapd).

### **Step 2: Install ONLYOFFICE Desktop Editors**

Once ```snapd``` is ready, you can install the editors with a single command. This will download and install the latest stable version from the Snap Store.

```
# snap install onlyoffice-desktopeditors
```

That's it\! The application is now installed and ready to use.

## **How to run the editors ▶️**

You can launch the editors in two ways:

1. From the terminal:
   ```
   $ snap run onlyoffice-desktopeditors
   ```

2. From the application menu:  

   Look for ONLYOFFICE in your computer's application menu (usually under an "Office" category).

## **Managing your installation ⚙️**

Here are some helpful commands for managing the Snap package.

### **Allow access to removable media**

To open and save documents on USB drives or external hard disks, you need to grant the snap permission to access removable media.

```
# snap connect onlyoffice-desktopeditors:removable-media
```
### **Uninstalling the editors**

If you need to remove the application, simply run:
```
# snap remove onlyoffice-desktopeditors
```
## **Useful links & resources 🔗**

* **Snapcraft Store**: Find our application on the [official Snap Store](https://snapcraft.io/onlyoffice-desktopeditors).
* **Official website:** Click [here](https://www.onlyoffice.com/desktop?utm_source=github&utm_medium=cpc&utm_campaign=GitHubSnapDesktop) to learn more about ONLYOFFICE Desktop Editors.
* **Main GitHub repository:** Check out the [source code](https://github.com/ONLYOFFICE/DesktopEditors) for the complete project information.  
* **Help Center (Tutorials):** Learn [how to work with the app](https://helpcenter.onlyoffice.com/desktop?utm_source=github&utm_medium=cpc&utm_campaign=GitHubSnapDesktop).


## **Need help or have an idea? Get support here 💡**

* **🐞 Found a bug?** Please report it by creating an issue [here](https://github.com/ONLYOFFICE/snap-desktopeditors/issues).  
* **❓ Have a question?** Ask our community and developers on the [ONLYOFFICE Forum](https://community.onlyoffice.com).  
* **💡 Want to suggest a feature?** Share your ideas on our [feedback platform](https://feedback.onlyoffice.com/forums/966080-your-voice-matters).
* **🧑‍💻 Need help for developers?** Check our [API documentation](https://api.onlyoffice.com/?utm_source=github&utm_medium=cpc&utm_campaign=GitHubSnapDesktop).
