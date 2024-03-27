<#
.SYNOPSIS
Provides and creates a code sample for using the Use-NewSecureKeyFile function.

.DESCRIPTION
The Use-NewSecureKeyFile function provides a code sample for using the New-SecureKeyFile function, along with a brief explanation of its purpose.

.INPUTS
This cmdlet has no inputs.

.OUTPUTS
None

.EXAMPLE
Use-NewSecureKeyFile

.NOTES
SecuredArcana - Use-NewSecureKeyFile.ps1

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
function Use-NewSecureKeyFile {
  [CmdletBinding()]
  param (  )

  $headerMsg = @'

  # Use-NewSecureKeyFile
  #
  # Below is a code sample that demonstrates how to use the New-SecureKeyFile function,
  # which generates a unique key then writes that key to the file name passed in. This key file
  # can be used for encryption / decryption with the other functions in this file.
  #
  # You can take this code sample, paste it into your script (or a new script), and modify it as needed.
  # Note the code below was automatically placed into the clipboard for your convience.

'@

  $codeSample = @'

  # Set the path to the key file
  $keyFile = 'C:\testkey.txt'

  # Generate a new key file
  New-SecureKeyFile -KeyFilePath $keyFile

'@

  Set-Clipboard $codeSample
  Write-Host $headerMsg -ForegroundColor DarkGreen
  Write-Host $codeSample

}