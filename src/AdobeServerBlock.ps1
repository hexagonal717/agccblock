$ruleName = "Adobe Genuine Service Server Block"

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

# Submenu function for rule management
function RuleManagementMenu {
    $submenuExit = $false
    while (-not $submenuExit) {
        Clear-Host  # Clear the console before displaying the menu

        Write-Host "`nSelect an option:"
        Write-Host "1. Check if the firewall rule exists."
        Write-Host "2. Create the firewall rule if it doesn't exist."
        Write-Host "3. Enable the firewall rule if it exists."
        Write-Host "4. Disable the firewall rule if it exists."
        Write-Host "5. Exit"

        $choice = Read-Host "Enter your choice (1, 2, 3, 4, or 5)"

        switch ($choice) {
            1 {
                Clear-Host  # Clear the console before displaying the result
                Write-Host "`nFirewall Rule Check"
                $result = CheckRuleStatus
                Write-Host $result
                Write-Host "`nPress Enter to go back to the menu."
            }
            2 {
                Clear-Host  # Clear the console before displaying the result
                Write-Host "`nCreate Firewall Rule"
                $result = CreateFirewallRule
                Write-Host $result
                Write-Host "`nPress Enter to go back to the menu."
            }
            3 {
                Clear-Host  # Clear the console before displaying the result
                Write-Host "`nEnable Firewall Rule"
                $result = EnableFirewallRule
                Write-Host $result
                Write-Host "`nPress Enter to go back to the menu."
            }
            4 {
                Clear-Host  # Clear the console before displaying the result
                Write-Host "`nDisable Firewall Rule"
                $result = DisableFirewallRule
                Write-Host $result
                Write-Host "`nPress Enter to go back to the menu."
            }
            5 {
                Write-Host "Exiting..."
                $submenuExit = $true
            }
            default {
                Write-Host "Invalid choice. Please select 1, 2, 3, 4, or 5."
            }
        }

        # Wait for user input before going back to the menu
        [System.Console]::ReadLine()
    }
}

# Directly start in the Rule Management submenu
RuleManagementMenu
