<#
.SYNOPSIS
Provides and creates a code sample for using the Use-WriteSecuredPassword function.

.DESCRIPTION
The Use-WriteSecuredPassword function provides a code sample for using the Write-SecuredPassword function, along with a brief explanation of its purpose.

.INPUTS
This cmdlet has no inputs.

.OUTPUTS
None

.EXAMPLE
Use-WriteSecuredPassword

.NOTES
SecuredArcana - Use-WriteSecuredPassword.ps1

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
function Use-WriteSecuredPassword {
  [CmdletBinding()]
  param (  )

  $headerMsg = @'

  # Use-WriteSecuredPasword
  #
  # Below is a code sample that demonstrates how to use the Write-SecuredPasword function,
  # which creates a file holding an encrypted password. You can optinally add a key file
  # to use for encryption.
  #
  # There are two versions of the function, one that uses a key file and one that does not.
  # Samples of both are in the output, use the one that applies to your needs.
  #
  # -- WARNING ----------------------------------------------------------------------------------------
  # The password is written in plain text in the code below. This is for demonstration purposes only.
  # In a production environment you should never save the password. Instead have a script prompt for
  # the password at run time, or at the very least ensure you never save the plain text password in
  # your scripts.
  # ---------------------------------------------------------------------------------------------------
  #
  # You can take this code sample, paste it into your script (or a new script), and modify it as needed.
  # Note the code below was automatically placed into the clipboard for your convience.

'@

  $codeSample = @'

  # Write a secured password without a key file.
  # Doing so means this password can only be decrypted on the machine it was created on.
  $outputPasswordFile = 'C:\testpw.txt'
  Write-SecuredPassword -PasswordPathFile $outputPasswordFile `
                        -Password 'somepassword/'

  # Write a secured password with a key file.
  # Doing so means this password can be decrypted on any machine that has the key file.
  $keyFile = 'C:\testkey.txt'
  $outputPasswordFile = 'C:\testpw.txt'
  Write-SecuredPassword -KeyPathFile $keyFile `
                        -PasswordPathFile $outputPasswordFile `
                        -Password 'somepassword/'

'@

  Set-Clipboard $codeSample
  Write-Host $headerMsg -ForegroundColor DarkGreen
  Write-Host $codeSample

}