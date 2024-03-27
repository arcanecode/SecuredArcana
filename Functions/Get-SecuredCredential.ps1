<#
.SYNOPSIS
Creates a credential object based on a passed in user name, along with key file and password file.

.DESCRIPTION
This function uses up to three parameters.

First, it needs a password file, created using Write-SecuredPassword.

Next, it needs a user name associated with the password.

Optionally, you can add on a key file (created with New-SecureKeyFile).

With this data it can recreate a credential object that can be used with cmdlets like Invoke-Command.

Note that when we use a key, we can move the encrypted files from computer to computer.

Without a key, the credentials can only be used on the computer they were created on.

.PARAMETER PasswordPathFile
The path and file name holding the encrypted password. You can create this file using Write-SecuredPassword.

.PARAMETER UserName
The user name associated with these credentials.

.PARAMETER KeyPathFile
Optional. The path and file name holding the encryption key. You can create this file using New-SecureKeyFile.

.INPUTS
This cmdlet has no inputs.

.OUTPUTS
Returns a credential object.

.EXAMPLE
$passwordFile = "C:\testpw.txt"
$user = "arcanecode@gmail.com"
$cred = Get-SecuredCredential -PasswordPathFile $passwordFile -UserName $user

.EXAMPLE
$passwordFile = "C:\testpw.txt"
$user = "arcanecode@gmail.com"
$cred = Get-SecuredCredential -KeyPathFile $keyFile -PasswordPathFile $passwordFile -UserName $user

.NOTES
SecuredArcana - ConvertFrom-SecuredPassword.ps1

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
function Get-SecuredCredential()
{
  [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSAvoidUsingPlainTextForPassword', '', Scope='Function')]        
  [CmdletBinding()]
  param ( [Parameter( Mandatory = $true
                    , HelpMessage = 'Enter the path and file name for the secured password file.'
                    )
          ]
          [string] $PasswordPathFile
        , [Parameter( Mandatory = $true
                    , HelpMessage = 'Enter the username associated with this password.'
                    )
          ]
          [string] $UserName
        , [Parameter( Mandatory = $false )
          ]
          [string] $KeyPathFile = '?'
        )

  if ($KeyPathFile -ne '?')
  {
    if (-not (Test-Path $KeyPathFile))
    {
      Write-Error "Error: Get-SecuredCredential - Key file not found at $KeyPathFile"
      return
    }

    Write-Debug "Get-SecuredCredential: Reading $KeyPathFile"
    $key = Get-Content $KeyPathFile
    Write-Debug "Get-SecuredCredential: Key = $key"

    Write-Debug "Get-SecuredCredential: Getting data from $PasswordPathFile"
    $pass = Get-Content $PasswordPathFile | ConvertTo-SecureString -Key $key

    Write-Debug "Get-SecuredCredential: Generating a credential object for $UserName"
    $cred = New-Object System.Management.Automation.PSCredential `
                       -ArgumentList $UserName, $pass
  }
  else
  {
    Write-Debug "Get-SecuredCredential: Getting data from $PasswordPathFile"
    $pass = Get-Content $PasswordPathFile | ConvertTo-SecureString

    Write-Debug "Get-SecuredCredential: Generating a credential object for $UserName"
    $cred = New-Object System.Management.Automation.PSCredential `
                       -ArgumentList $UserName, $pass
  }

  Write-Debug "Get-SecuredCredential: Returning credential object for $UserName"
  return $cred

}
