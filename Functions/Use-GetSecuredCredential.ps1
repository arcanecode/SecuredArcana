<#
.SYNOPSIS
Provides and creates a code sample for using the Use-GetSecuredCredential function.

.DESCRIPTION
The Use-GetSecuredCredential function provides a code sample for using the Get-SecuredCredential function, along with a brief explanation of its purpose.

.INPUTS
This cmdlet has no inputs.

.OUTPUTS
None

.EXAMPLE
Use-GetSecuredCredential

.NOTES
SecuredArcana - Use-GetSecuredCredential.ps1

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
function Use-GetSecuredCredential {
  [CmdletBinding()]
  param (  )

  $headerMsg = @'

  # Use-GetSecuredCredential
  #
  # Below is a code sample that demonstrates how to use the Get-SecuredCredential function.
  # This function is used to generate a PSCredential object from the combination of a password
  # supplied when you run the function, the password that was encrypted and stored in a file,
  # and (optionally) the key that was used to encrypt the password.
  #
  # Note both versions are displayed below, with and without the key. Use the version
  # that matches your needs.
  #
  # You can take this code sample, paste it into your script (or a new script), and modify it as needed.
  # Note the code below was automatically placed into the clipboard for your convience.

'@

  $codeSample = @'

# Retrieve the password from the PSCredential object, without using a key file
$passwordFile = 'C:\testpw.txt'
$user = 'arcanecode@gmail.com'

$cred = Get-SecuredCredential -PasswordPathFile $passwordFile `
                              -UserName $user

# Retrieve the password from the PSCredential object using a key file
$keyFile = 'C:\testkey.txt'
$passwordFile = 'C:\testpw.txt'
$user = 'arcanecode@gmail.com'

$cred = Get-SecuredCredential -KeyPathFile $keyFile `
                              -PasswordPathFile $passwordFile `
                              -UserName $user

'@

  Set-Clipboard $codeSample
  Write-Host $headerMsg -ForegroundColor DarkGreen
  Write-Host $codeSample

}