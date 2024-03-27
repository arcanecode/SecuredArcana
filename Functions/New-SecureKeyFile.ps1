<#
.SYNOPSIS
Generates a unique encryption key and writes to to a file.

.DESCRIPTION
Generates a unique key then writes that key to the file name passed in. This file can be
used for encryption / decryption with the other functions in this file.

.PARAMETER KeyPathFile
The path and file name to create the key in.

.INPUTS
This cmdlet has one inputs, the name of the file to write the key to.

.OUTPUTS
None

.EXAMPLE
$keyFile = 'C:\testkey.txt'
New-SecureKeyFile -KeyFilePath $keyFile

.NOTES
SecuredArcana - New-SecureKeyFile.ps1

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
function New-SecureKeyFile()
{
  [CmdletBinding()]
  param ( [Parameter( Mandatory = $true
                    , HelpMessage = 'Enter the path and file name for the key file.'
                    )
          ]
          [string] $KeyFilePath
        )

  # Create a storage spot in memory for the key
  Write-Debug 'New-SecureKeyFile: Creating a 32 byte key'
  $key = New-Object Byte[] 32

  # Create the crypto key
  Write-Debug 'New-SecureKeyFile: Generating the cryptographic key'
  [Security.Cryptography.RNGCryptoServiceProvider]::Create().GetBytes($key)

  # Write the key to a file
  Write-Debug "New-SecureKeyFile: Writing the key to $KeyFilePath"
  $key | Out-File $KeyFilePath -Force

}
