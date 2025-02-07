# AGCC Block

This PowerShell script and batch file combination helps manage a firewall rule that blocks the **Adobe GCC Server**. The setup includes batch files to easily check, create, enable, and disable the rule.

---

## Features

- **Checks if the firewall rule exists** to block outbound connections for *AdobeGCClient.exe*.
- **Creates the firewall rule** if it doesn't exist.
- **Removes the firewall rule** if it exists, and you choose to delete it.
- **Enables or disables the rule** if it exists.
- **Simplifies the process** with batch file execution.

---

## Prerequisites

- **Windows 10/11** or **Windows Server** with PowerShell 5.1 or later.
- **Administrator privileges** (required to modify firewall rules).

---

## How to Use

1. **Download Instructions for the Script:**

    - **From the Releases Section:**
        - Navigate to the [Releases](https://github.com/hexagonal717/agccblock/releases) page of the repository.
        - Download the latest release.
        - Extract the ZIP file to access the `AGCCBlock` folder.
    - **To download as a ZIP file:**
        - On the main repository page, click the **Code** button and select **Download ZIP**.
        - Extract the ZIP file to access the `AGCCBlock` folder.
    - **To clone using Git:**
        - Open Git Bash or a terminal.
        - Run the following command:
          ```bash
          git clone https://github.com/hexagonal717/agccblock
          ```
        - This will clone the entire repository to your local machine, and you can access the `AGCCBlock` folder.

2. **Run the `run_this.bat` file:**
    - Locate the `run_this.bat` file in the directory where you extracted or cloned the repository.
    - Double-click the `run_this.bat` file to execute it. This file will run the PowerShell script with the necessary permissions.
    - If Windows SmartScreen appears, warning you that the file might be unsafe, follow these steps to bypass it:
        - Click on **More info**.
        - Then click **Run anyway**.
        - The script will then execute with the necessary permissions.

3. **Interactive Menu:**
    - After running the script, you'll be presented with an interactive menu with the following options:
       1. **Create AGCCBlock Firewall Rule**  
            This option will create a new firewall rule to block the Adobe Genuine Service Server.

       2. **Remove AGCCBlock Firewall Rule**  
            This option will remove the existing AGCCBlock firewall rule from your system.

       3. **Check for AGCCBlock Firewall Rule**  
            This option will check if the AGCCBlock firewall rule already exists on your system.

       4. **Enable AGCCBlock Firewall Rule**  
            This option will enable the AGCCBlock firewall rule, enforcing the block on the Adobe GCC Server.

       5. **Disable AGCCBlock Firewall Rule**  
            This option will disable the AGCCBlock firewall rule, allowing the Adobe GCC Server to bypass the firewall.

       6. **Exit**  
            This option will exit the menu and close the application.
---

## Files

- `run_this.bat`: Batch file that runs the AGCCBlock.ps1 script to check and create or manage the firewall rule.
- `AGCCBlock.ps1`: PowerShell script that checks for, creates, enables, or disables the firewall rule.

---

## Notes

- **Administrator privileges** are required to run these scripts as they modify system firewall rules.
- If the rule already exists, it can be enabled or disabled without creating a new rule.
- This script is designed to work on **Windows 10/11** or **Windows Server** with PowerShell 5.1 or later.

---


## License
This project is licensed under the MIT License - see the LICENSE file for details.
