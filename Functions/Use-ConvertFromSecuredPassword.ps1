<#
.SYNOPSIS
Provides and creates a code sample for using the ConvertFrom-SecuredPassword function.

.DESCRIPTION
The Use-ConvertFromSecuredPassword function provides a code sample for using the ConvertFrom-SecuredPassword function, along with a brief explanation of its purpose.

.INPUTS
This cmdlet has no inputs.

.OUTPUTS
None

.EXAMPLE
Use-ConvertFromSecuredPassword

.NOTES
SecuredArcana - Use-ConvertFromSecurePassword.ps1

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
function Use-ConvertFromSecuredPassword {
  [CmdletBinding()]
  param (  )

  $headerMsg = @'

  # Use-ConvertFromSecuredPassword
  #
  # Below is a code sample that demonstrates how to use the ConvertFrom-SecuredPassword function.
  # This function is used to extract a password from a PSCredential object.
  #
  # You can take this code sample, paste it into your script (or a new script), and modify it as needed.
  # Note the code below was automatically placed into the clipboard for your convience.

'@

  $codeSample = @'

  # Retrieve the password from the PSCredential object
  $myPassword = ConvertFrom-SecuredPassword -Credential $credentialObject

'@

  Set-Clipboard $codeSample
  Write-Host $headerMsg -ForegroundColor DarkGreen
  Write-Host $codeSample

}