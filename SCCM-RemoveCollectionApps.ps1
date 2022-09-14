# Have a ton of stale application deployments that you would like to remove quickly? Use this function to remove application deployments from a collection.
# Load the ConfigurationManager module for Windows PowerShell connect to your site and provider machine before running the function.    
function SCCM-RemoveCollectionApps{

    param (
            [string[]]
            [Parameter(Mandatory = $true, ValueFromRemainingArguments)]
            $dcollects
            )

            if ($dcollects -like '*.txt' -or $dcollects -like '*.csv') {
                $dcollects = Get-Content $dcollects
            }

        foreach ($dcollect in $dcollects){   
                $lotsaapps = Get-CMDeployment -CollectionName "$dcollect" -FeatureType "Application" 
                foreach ($app in $lotsaapps){
                    Write-Host $app.SoftwareName -ForegroundColor Red
                    Remove-CMDeployment -ApplicationName $app.SoftwareName -CollectionName $app.collectionname -force #-WhatIf
                    }
            }   
    }
# SYNTAX:   
# SCCM-RemoveCollectionApps ComputerLab








