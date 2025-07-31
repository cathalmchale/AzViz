# Entry point for debugger

# TODO: 'Connect-AzAccount' separately in your debug session
# TODO: 'Install-Module PSGraph -Scope CurrentUser -Verbose' separately in your debug session

# TODO: cd into the directory of this Program.ps1 script file and run:
   # $env:PSModulePath += "$([System.IO.Path]::PathSeparator)$(Get-Location)"

Remove-Module AzViz -ErrorAction SilentlyContinue
Import-Module AzViz -Scope Local -Verbose

#$debugRg = @('rg-wwwsharedeu1-pro','rg-apisharedeu1-pro')
#$debugRg = @('rg-intune-pro')
$debugRg = @('rg-core-pro')
$excludeTypes = @("*slots","*smartDetectorAlertRules","*disks","*snapshots","*certificates","*privateDnsZones")
Export-AzViz -ResourceGroup $debugRg -ExcludeTypes $excludeTypes -Theme light -OutputFormat png -Show -LabelVerbosity 2 -SkipNetwork

