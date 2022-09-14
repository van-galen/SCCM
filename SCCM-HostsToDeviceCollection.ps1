# Feed names or file path to the $hostnames variable then create direct membership rules on an sccm device collection
# Load the ConfigurationManager module for Windows PowerShell connect to your site and provider machine before running the function.
function SCCM-HostsToDeviceCollection {



    Param($hostnames,$collectname)
    
                if ($hostnames -like '*.txt' -or $hostnames -like '*.csv'){
                    $hostnames = Get-Content $hostnames
                    }

    
            foreach ($names in $hostnames){
                Add-CMDeviceCollectionDirectMembershipRule -CollectionName $collectname -ResourceID (Get-CMDevice -Name $names).ResourceID
                }   
       
    }
# SYNTAX:
# SCCM-HoststoDeviceCollection Win10Dell123 CoolDellCollection
