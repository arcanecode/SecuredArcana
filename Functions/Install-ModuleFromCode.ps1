<#
.SYNOPSIS
Copy a module from source code into the users default PowerShell Modules folder.

.DESCRIPTION
This function is not exposed as part of the module, as it won't be relavent.

It is inlcuded should you download the source and wish to install from there, as opposed to installing from the PSGallery.

This function will first validate the proper place exists in the default PowerShell Modules folder.

It will be in the format of \ModuleName\Version, if not found it is created.

It then copies the files for the module into the users PowerShell Modules folder.

This is ideal for situations where you have the source code for the module, and the module is not found in the PSGallery or a corporate gallery.

.PARAMETER KeyPathFile
The path and file name to create the key in.

.INPUTS
This cmdlet has no inputs.

.OUTPUTS
None

.EXAMPLE
$keyFile = 'C:\testkey.txt'
New-SecureKeyFile -KeyFilePath $keyFile

.NOTES
SecuredArcana - Install-ModuleFromCode.ps1

Author: Robert C Cain | @ArcaneCode | arcane@arcanetc.com

This code is Copyright (c) 2023, 2024 Robert C Cain All rights reserved

The code herein is for demonstration purposes.
No warranty or guarantee is implied or expressly granted.

This module may not be reproduced in whole or in part without
the express written consent of the author.

.LINK
https://github.com/arcanecode/SecuredArcana

.LINK
http://arcanecode.me

#>

function Install-ModuleFromCode {
  [CmdletBinding()]
  param ( [Parameter( Mandatory = $true
                    , HelpMessage = 'Enter the path to the source code for the module.'
                    )
          ]
          [string] $CodeLocation
        , [Parameter( Mandatory = $true
                    , HelpMessage = 'Enter the module name to install.'
                    )
          ]
          [string] $ModuleName
        )


  # Change to the folder with the code, saving the original location
  Push-Location $CodeLocation

  # Reload the module, we need the most current one in order to get the module version
  Remove-Module $ModuleName -ErrorAction SilentlyContinue
  Import-Module ".\$ModuleName"

  # Get the current version number
  $moduleInfo = (Get-Module $ModuleName)
  $ver = "$($moduleInfo.Version.Major).$($moduleInfo.Version.Minor).$($moduleInfo.Version.Build)"

  # Get the default path for PowerShell Modules
  $userModulePath = ($env:PSModulePath).Split(';')[0]

  # Now see if a folder exists for this module
  $modulePath = "$userModulePath\$ModuleName"
  if ((Test-Path $modulePath) -eq $false)
    { New-Item -ItemType Directory -Path $modulePath }

  # Next check to see if a version number folder exists for the current version
  $modulePathVer = "$modulePath\$ver"
  if ((Test-Path $modulePathVer) -eq $false)
    { New-Item -ItemType Directory -Path $modulePathVer }

  # The folders have been verified, copy the files over.
  # Recurse through sub folders and overwrite whats there.
  Copy-Item -Path "$CodeLocation\*" -Destination $modulePathVer -Recurse -Force

  # Restore the previous folder location
  Pop-Location

}
