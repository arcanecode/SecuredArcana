<#
.SYNOPSIS
Opens the GitHub site in the default browser for the SecureArcana module.

.DESCRIPTION
This function provides a quick and easy way to open the github site containing the code for this module. It also has documentation in markdown format to provide further explanations of the SecureArcana modules functionality.

.INPUTS
This cmdlet has no inputs.

.OUTPUTS
Opens the github site for this module in your default browser.

.EXAMPLE
Open-SecureArcanaGitHub

.NOTES
SecureArcana - Open-SecureArcanaGitHub.ps1

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

function Open-SecureArcanaGitHub()
{
  [CmdletBinding()]
  param (
        )

  Start-Process "https://github.com/arcanecode/SecuredArcana"

}
