
cd dev/3party/AzViz
$env:PSModulePath += "$([System.IO.Path]::PathSeparator)$(Get-Location)"
Install-Module PSGraph -Scope CurrentUser -Verbose
Import-Module AzViz -Scope Local -Verbose

#e.g. test exec of AzViz - it actually worked!
Connect-AzAccount
Export-AzViz -ResourceGroup rg-app-dev -Theme light -OutputFormat png -Show

#e.g. trying to build a reasonable command to visualise specific project
Set-AzContext -SubscriptionName "your_sub_name"
$excludeTypes = @("*slots","*smartDetectorAlertRules","*disks","*snapshots")
Export-AzViz -ResourceGroup rg-app-pro,rg-common-pro,rg-share-pro -ExcludeTypes $excludeTypes -Theme light -OutputFormat png -Show


#Pre-req - launch pwsh with admin rights
#Install-Module Az -Scope AllUsers -Force

