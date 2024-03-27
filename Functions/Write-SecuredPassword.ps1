<#
.SYNOPSIS
Creates a file holding an encrypted password. You can optinally add a key file to use for encryption.

.DESCRIPTION
This function uses three parameters, one of which is optional. First is the file path and name of the password file you want to create.

The second parameter is the plain text password you want to encrypt. 

The third parameter is the path and file name of the key file you created with New-SecureKeyFile. If you do not pass in a key file, the password will be encrypted using a key that is unique to the machine.

.PARAMETER Password
The password you want to encrypt and store.

.PARAMETER PasswordPathFile
The path and file name you want to create.

.PARAMETER KeyPathFile
Optional. The path and file name holding the encryption key. You can create this file using New-SecureKeyFile.

.INPUTS
This cmdlet has no inputs.

.OUTPUTS
Returns a credential object.

.EXAMPLE
$outputPasswordFile = 'C:\testpw.txt'
Write-SecuredPassword -PasswordPathFile $outputPasswordFile `
                      -Password 'somepassword/'

.EXAMPLE
$keyFile = 'C:\testkey.txt'
$outputPasswordFile = 'C:\testpw.txt'
Write-SecuredPassword -KeyPathFile $keyFile `
                      -PasswordPathFile $outputPasswordFile `
                      -Password 'somepassword/'

.NOTES
SecuredArcana - Write-SecuredPassword.ps1

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
function Write-SecuredPassword()
{
  [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSAvoidUsingPlainTextForPassword', '', Scope='Function')]
  [CmdletBinding()]
  param ( [Parameter( Mandatory = $true
                    , HelpMessage = 'Enter the path and file name for the secured password file.'
                    )
          ]
          [string] $PasswordPathFile
        , [Parameter( Mandatory = $true
                    , HelpMessage = 'Enter the password to convert and store.'
                    )
          ]
          [string] $Password
        , [Parameter( Mandatory = $false )
          ]
          [string] $KeyPathFile = '?' # Default to a question mark, so we can tell if it was passed in
        )

  Write-Debug "Write-SecuredPassword: PasswordPathFile = $PasswordPathFile"
  $securedPass = $Password | ConvertTo-SecureString -AsPlainText -Force

  if ($KeyPathFile -ne '?')
  {
    Write-Debug "Write-SecuredPassword: KeyPathFile = $KeyPathFile"
    $key = Get-Content $KeyPathFile

    Write-Debug "Write-SecuredPassword: Writing the secured password to $PasswordPathFile"
    $securedPass | ConvertFrom-SecureString -Key $key |
                   Out-File $PasswordPathFile -Force
  }
  else
  {
    Write-Debug "Write-SecuredPassword: Writing the secured password to $PasswordPathFile"
    $securedPass | ConvertFrom-SecureString | Out-File $PasswordPathFile -Force
  }

}
