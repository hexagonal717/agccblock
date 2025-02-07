$ruleName = "Adobe Genuine Service Server Block"

function ShowHeading {
    Clear-Host
    Write-Host "==============================="
    Write-Host "   AGCCBlock by hexagonal717"
    Write-Host "==============================="
}

function CheckRuleStatus {
    $rule = Get-NetFirewallRule -DisplayName $ruleName -ErrorAction SilentlyContinue
    if ($rule) {
        return "Firewall rule '$ruleName' already exists."
    } else {
        return "Firewall rule '$ruleName' does not exist."
    }
}

function CreateFirewallRule {
    $rule = Get-NetFirewallRule -DisplayName $ruleName -ErrorAction SilentlyContinue
    if ($rule) {
        return "Firewall rule '$ruleName' already exists."
    } else {
        New-NetFirewallRule -DisplayName $ruleName `
            -Direction Outbound `
            -Program "C:\Program Files (x86)\Common Files\Adobe\AdobeGCClient\AdobeGCClient.exe" `
            -Action Block
        return "Firewall rule '$ruleName' created successfully."
    }
}

function EnableFirewallRule {
    $rule = Get-NetFirewallRule -DisplayName $ruleName -ErrorAction SilentlyContinue
    if ($rule) {
        Set-NetFirewallRule -DisplayName $ruleName -Enabled True
        return "Firewall rule '$ruleName' is now enabled."
    } else {
        return "Firewall rule '$ruleName' does not exist, cannot enable."
    }
}

function DisableFirewallRule {
    $rule = Get-NetFirewallRule -DisplayName $ruleName -ErrorAction SilentlyContinue
    if ($rule) {
        Set-NetFirewallRule -DisplayName $ruleName -Enabled False
        return "Firewall rule '$ruleName' is now disabled."
    } else {
        return "Firewall rule '$ruleName' does not exist, cannot disable."
    }
}

function RemoveFirewallRule {
    $rule = Get-NetFirewallRule -DisplayName $ruleName -ErrorAction SilentlyContinue
    if ($rule) {
        Remove-NetFirewallRule -DisplayName $ruleName
        return "Firewall rule '$ruleName' removed successfully."
    } else {
        return "Firewall rule '$ruleName' does not exist, cannot remove."
    }
}

# Submenu function for rule management
function RuleManagementMenu {
    $submenuExit = $false
    while (-not $submenuExit) {
        ShowHeading  # Display the heading before the menu

        Write-Host "`nSelect an option:"
        Write-Host "1. Create AGCCBlock Firewall Rule."
        Write-Host "2. Remove AGCCBlock Firewall Rule."
        Write-Host "3. Check for AGCCBlock Firewall Rule."
        Write-Host "4. Enable AGCCBlock Firewall Rule."
        Write-Host "5. Disable AGCCBlock Firewall Rule."
        Write-Host "6. Exit"

        $choice = Read-Host "Enter your choice (1, 2, 3, 4, 5, or 6)"

        switch ($choice) {
            1 {
                Clear-Host  # Clear the console before displaying the result
                ShowHeading
                Write-Host "`nCreate AGCCBlock Firewall Rule"
                $result = CreateFirewallRule
                Write-Host $result
                Write-Host "`nPress Enter to go back to the menu."

            }
            2 {
                Clear-Host  # Clear the console before displaying the result
                ShowHeading
                Write-Host "`nRemove AGCCBlock Firewall Rule"
                $result = RemoveFirewallRule
                Write-Host $result
                Write-Host "`nPress Enter to go back to the menu."

            }
            3 {
                Clear-Host  # Clear the console before displaying the result
                ShowHeading
                Write-Host "`nCheck for AGCCBlock Firewall Rule"
                $result = CheckRuleStatus
                Write-Host $result
                Write-Host "`nPress Enter to go back to the menu."
            }
            4 {
                Clear-Host  # Clear the console before displaying the result
                ShowHeading
                Write-Host "`nEnable AGCCBlock Firewall Rule"
                $result = EnableFirewallRule
                Write-Host $result
                Write-Host "`nPress Enter to go back to the menu."
            }
            5 {
                Clear-Host  # Clear the console before displaying the result
                ShowHeading
                Write-Host "`nDisable AGCCBlock Firewall Rule"
                $result = DisableFirewallRule
                Write-Host $result
                Write-Host "`nPress Enter to go back to the menu."
            }
            6 {
                Write-Host "Exiting..."
                $submenuExit = $true
                Exit  # Exit the PowerShell script and close the window
            }
            default {
                Write-Host "Invalid choice. Please select 1, 2, 3, 4, 5, or 6."
            }
        }

        # Wait for user input before going back to the menu
        [System.Console]::ReadLine()
    }
}

# Directly start in the Rule Management submenu
RuleManagementMenu
