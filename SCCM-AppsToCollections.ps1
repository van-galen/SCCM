# Need to deploy a ton of applications to a ton of collections? No time for the GUI? This function will do that for you. Feed application and collection names to the variables to create SCCM deployments.
# Load the ConfigurationManager module for Windows PowerShell connect to your site and provider machine before running the function.
function SCCM-AppsToCollections {

    param($TARGETDATE, $IU, $Purp, $apps, $collections)

        if ($apps -like '*.txt' -or $apps -like '*.csv') {
            $apps = Get-Content $apps
        }
    
        if ($collections -like '*.txt' -or $collections -like '*.csv') {
            $collections = Get-Content $collections
        }
        
        foreach ($app in $apps) {
            foreach ($collection in $Collections) {
                New-CMApplicationDeployment -CollectionName "$collection" -Name "$app" -DeployAction $IU -DeployPurpose $Purp -UserNotification DisplaySoftwareCenterOnly -AvailableDateTime $TARGETDATE -DeadlineDateTime $TARGETDATE -TimeBaseOn LocalTime -Verbose #-WhatIf
            }
        }
    }
# SYNTAX:
# SCCM-AppsToCollections "1/1/2020" Install Available "C:\temp\application-names.txt" "C:\temp\collections.txt"
# SCCM-AppsToCollections "1/1/2020" Install Required "Matlab 2022a" "Research Computer Lab" 

