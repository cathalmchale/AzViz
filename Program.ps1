# Entry point for debugger

# TODO: 'Connect-AzAccount' separately in your debug session
# TODO: 'Install-Module PSGraph -Scope CurrentUser -Verbose' separately in your debug session
# TODO: 'Import-Module PSGraph -Scope Local -Verbose' separately in your debug session

# TODO: cd into the directory of this Program.ps1 script file and run:
   # $env:PSModulePath += "$([System.IO.Path]::PathSeparator)$(Get-Location)"

Remove-Module AzViz -ErrorAction SilentlyContinue
Import-Module AzViz -Scope Local -Verbose

$debugRg = @('rg-report-pro','rg-apishare-pro')
$excludeTypes = @("*slots") #@("*slots","*smartDetectorAlertRules","*disks","*snapshots","*certificates","*privateDnsZones")
Export-AzViz -ResourceGroup $debugRg -ExcludeTypes $excludeTypes -Theme light -OutputFormat png -Show -LabelVerbosity 2 -SubnetResourceRowLimit 2 -SkipNetwork
