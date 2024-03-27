<#
.SYNOPSIS
Lists all the commands in the SecureArcana module.

.DESCRIPTION
This will return a list of commands in the SecureArcana module, along with a brief sysnopsis of each.

.INPUTS
This cmdlet has no inputs.

.OUTPUTS
None

.EXAMPLE
Get-SecureArcanaCommands

.NOTES
SecuredArcana - Get-SecureArcanaCommands.ps1

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
function Get-SecureArcanaCommands {
  [CmdletBinding()]
  param (  )

  $headerMsg = @'

Below is a listing of all the commands in the SecureArcana module, along with a brief synopsis of each.

For more help on a specific command, use Get-Help <command> -Full.
Also be sure to review the about file using Get-Help about_SecureArcana.

Main Commands --------------------------------------------------------------------------------------
  Below are the main commands in the SecureArcana module for handling secure passwords
  and credentials.

ConvertFrom-SecuredPassword
  Extracts a password from a PSCredential object.

Get-SecuredCredential
  Retrieves a PSCredential object from a file.

New-SecureKeyFile
  Creates a new secure key file.

Write-SecuredPassword
  Writes a password to a file in a secure manner.

Get-SecureArcanaCommands
  Lists all the commands in the SecureArcana module.

Open Commands --------------------------------------------------------------------------------------
  The commands that begin with "Open-" provide an easy way to quickly access both the authors
  blog site and the GitHub site for the SecureArcana module.

  Open-AboutArcaneCode
    Opens the authors blog site to the "About Me" page with more information on his other projects.

  Open-SecureArcanaGitHub
    Opens the GitHub site in the default browser for the SecureArcana module.

Use Commands ---------------------------------------------------------------------------------------
  The commands that begin with "Use-" provide code samples for using the SecureArcana functions
  They place a copy of the sample into the clipboard to allow you to quickly assemble your scripts.

  Use-ConvertFromSecuredPassword
    Provides and creates a code sample for using the ConvertFrom-SecuredPassword function.

  Use-GetSecuredCredential
    Provides and creates a code sample for using the Get-SecuredCredential function.

  Use-NewSecureKeyFile
    Provides and creates a code sample for using the New-SecureKeyFile function.

  Use-WriteSecuredPassword
    Provides and creates a code sample for using the Write-SecuredPassword function.

'@

  Write-Host $headerMsg

}