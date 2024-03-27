<#
.SYNOPSIS
Converts a password from a secured string to plain text.

.DESCRIPTION
Accepts a credential object and extracts the password, returning it as plain text.

.PARAMETER Credential
A standard PSCredential object containing the data you need to extract.

.PARAMETER NoClipboard
A switch, when provided does not copy the extracted password to the clipboard.

.INPUTS
This cmdlet has no inputs.

.OUTPUTS
Returns the password in plain text.

.EXAMPLE
$myPassword = ConvertFrom-SecuredPassword -Credential $credentialObject

Returns the password into the $myPassword variable as well as placing a copy in the clipboard.

.EXAMPLE
$myPassword = ConvertFrom-SecuredPassword -Credential $credentialObject -NoClipboard

Returns the password into the $myPassword variable, but does not put it in the clipboard.

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

function ConvertFrom-SecuredPassword()
{
  [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSAvoidUsingPlainTextForPassword', '', Scope='Function')]
  [CmdletBinding()]
  param ( [Parameter( Mandatory = $true
                    , HelpMessage = 'Pass in a credential object.'
                    )
          ]
          [System.Management.Automation.PSCredential] $Credential
        , [switch] $NoClipboard
        )

  Write-Debug 'ConvertFrom-SecuredPassword: Extracting password from credential object'
  $pw = $Credential.GetNetworkCredential().Password

  if ($NoClipboard -eq $false)
  {
    Set-Clipboard $pw
  }

  Write-Debug 'ConvertFrom-SecuredPassword: Returning the password'
  return $pw

}
