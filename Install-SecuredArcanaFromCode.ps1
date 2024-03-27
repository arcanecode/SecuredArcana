<#-------------------------------------------------------------------------------------------------
  SecuredArcana - Install-SecuredArcanaFromCode
  Author: Robert C. Cain | @ArcaneCode | arcane@arcanetc.com
           http://arcanecode.me

  Synopsis
    Copy a module from source code into the users default PowerShell Modules folder.

  Details

    This will first validate the proper place exists in the default PowerShell Modules folder.
    It will be in the format of \ModuleName\Version. If not, its created.

    It then copies the files for the module into the users PowerShell Modules folder. This is
    ideal for situations where you have the source code for the module, and the module is not
    found in the PSGallery or a corporate gallery.

  Notes

    This code is Copyright (c) 2020, 2023 Robert C. Cain. All rights reserved.

    The code herein is for demonstration purposes. No warranty or guarentee
    is implied or expressly granted.

    This module may not be reproduced in whole or in part without the express
    written consent of the author.


-------------------------------------------------------------------------------------------------#>

# Make sure we're in the right spot
# Set this to whatever you've put the code
$codeLocation = 'C:\Users\rccain\OneDrive - Kent Corporation\Projects\SecuredArcana\'
$moduleName = 'SecuredArcana'

# Just make sure we've got the current version
Remove-Module $moduleName -ErrorAction SilentlyContinue
Import-Module ".\$moduleName"

# OK Copy the files over
Install-ModuleFromCode -CodeLocation $codeLocation -ModuleName $moduleName

# Display the installed files as a sanity check
Get-ChildItem -Path $codeLocation -Recurse
