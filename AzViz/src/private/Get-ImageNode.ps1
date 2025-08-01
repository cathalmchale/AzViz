Function Get-ImageNode {
    [CmdletBinding()]
    param(
        [string[]]$Rows,
        [string]$Type,
        [String]$Name,
        [String]$Label,
        [String]$Style = 'Filled',
        [String]$Shape = 'none',
        [String]$FillColor = 'White'
    )

    # Write-host "NAME: $Name, ROWS: $Rows, TYPE: $Type" -ForegroundColor Magenta

    $RootPath = Split-Path (Split-Path $PSScriptRoot -Parent) -Parent
    $IconPath = Join-Path $RootPath 'icons'

    $TR = ''
    $flag = $true
    foreach ($r in $Rows) {
        if (-not $r) {
            continue
        }

        if ($flag) {
            # Write-Verbose "   > Creating Node: $r"
            $TR += '<TR><TD align="center" colspan="2"><B><FONT POINT-SIZE="11">{0}</FONT></B></TD></TR>' -f $r
            $flag = $false
        }
        else {
            $overrideColor = $null
            # Rudimentary, but will do for now.
            if ($r -like '*virtualNetworks*') {
                $propertyKey = 'Subnet'
                $parts = $r -split '/'
                $propertyVal = ($parts | Select-Object -Last 3) -join '/'
                $overrideColor = $NetworkEdgeColor
            } else {
                $propertyKey = 'Meta'
                $propertyVal = $r
            }
            $fontColorAttr = $overrideColor ? " COLOR='$overrideColor'" : ""
            $TR += '<TR><TD align="right"><FONT POINT-SIZE="9"{0}>{1}:</FONT></TD><TD align="left"><FONT POINT-SIZE="9"{0}>{2}</FONT></TD></TR>' -f $fontColorAttr, $propertyKey, $propertyVal
        }
    }

    $Path = $images[$Type]
    if ($Path) {
        '"{0}" [label=<<TABLE border="0" cellborder="0" cellpadding="0"><TR><TD ALIGN="center" colspan="2"><img src="{1}"/></TD></TR>{2}</TABLE>>;fillcolor="white";shape="none";penwidth="1";fontname="Courier New";]' -f $Name, $(Join-Path $IconPath $images[$Type]), $TR
    }
    else {
        '"{0}" [label=<<TABLE border="0" cellborder="0" cellpadding="0"><TR><TD ALIGN="center" colspan="2"><img src="{1}"/></TD></TR>{2}</TABLE>>;fillcolor="white";shape="none";penwidth="1";fontname="Courier New";]' -f $Name, $(Join-Path $IconPath $images["resources"]), $TR
    }

}


# Get-ImageNode -Name 'test' -Rows 'testnode','192.168.1.1' -Type "Microsoft.Compute/virtualMachines"
