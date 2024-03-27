<#-------------------------------------------------------------------------------------------------
  SecuredArcana
  Author: Robert C. Cain | @ArcaneCode | arcane@arcanetc.com
           http://arcanecode.me

  SecuredArcana is used to store encrypted credentials on the drive. It uses keys so these
  credentials can be easily moved between computers.

  Workflow

    First, create a cryptographic key using Write-SecuredKey
    You can use one key for all passwords, or create a key for each credential (recommended)

    Second, write the password to a secure file using Write-SecuredPassword. You pass in the
    password along with the path to the key file.

    To retrieve a credentail object for use with commands such as Invoke-Command, use
    Get-SecuredCredentail. Pass in the key file, password file, and user name associated with it.
    It will return a credential object.

    Need to get the password back from the credential in plain text? Then use
    ConvertFrom-SecuredCredential. Pass in the credentail and it will return the password.
    Add the -NoClipboard switch if you do not want the password copied to the clipboard.

  Notes

    This code is Copyright (c) 2020, 2023 Robert C. Cain. All rights reserved.

    The code herein is for demonstration purposes. No warranty or guarentee
    is implied or expressly granted.

    This module may not be reproduced in whole or in part without the express
    written consent of the author.


-------------------------------------------------------------------------------------------------#>

# Before running, you need to have the most current version of SecuredArcana loaded in memory
Remove-Module SecuredArcana -ErrorAction SilentlyContinue
Import-Module .\SecuredArcana

#------------------------------------------------------------------------------------------------
# Create a secure key that will be stored in a keyfile
#------------------------------------------------------------------------------------------------
$keyFile = 'C:\temp\testkey.txt'
New-SecureKeyFile -KeyFilePath $keyFile

#------------------------------------------------------------------------------------------------
# Create a bogus password file for testing, using a secured key
#------------------------------------------------------------------------------------------------
$keyFile = 'C:\temp\testkey.txt'
$outputPasswordFile = 'C:\temp\testpw.txt'
Write-SecuredPassword -KeyPathFile $keyFile `
                      -PasswordPathFile $outputPasswordFile `
                      -Password 'somepassword/'


#------------------------------------------------------------------------------------------------
# Now generate a credential object from the files
#------------------------------------------------------------------------------------------------
$keyFile = 'C:\temp\testkey.txt'
$passwordFile = 'C:\temp\testpw.txt'
$user = 'arcanecode@gmail.com'

$cred = Get-SecuredCredential -KeyPathFile $keyFile `
                              -PasswordPathFile $passwordFile `
                              -UserName $user `
                              -Debug


#------------------------------------------------------------------------------------------------
# Now you can grab the actual password
#------------------------------------------------------------------------------------------------
$pw = ConvertFrom-SecuredPassword -Credential $cred

# Display it
"Here's the data: $pw"

#------------------------------------------------------------------------------------------------
# Now lets do this without a key file
#------------------------------------------------------------------------------------------------

#------------------------------------------------------------------------------------------------
# Create a bogus password file for testing, without using a secured key
#------------------------------------------------------------------------------------------------
$outputPasswordFile = 'C:\temp\testpwNoKey.txt'
Write-SecuredPassword -PasswordPathFile $outputPasswordFile `
                      -Password 'someOtherPassword#'

#------------------------------------------------------------------------------------------------
# Now generate a credential object from the files
#------------------------------------------------------------------------------------------------
$passwordFile = 'C:\temp\testpwNoKey.txt'
$user = 'arcanecode@gmail.com'

$cred = Get-SecuredCredential -PasswordPathFile $passwordFile `
                              -UserName $user `
                              -Debug

#------------------------------------------------------------------------------------------------
# Now you can grab the actual password
#------------------------------------------------------------------------------------------------
$pw = ConvertFrom-SecuredPassword -Credential $cred

# Display it
"Here's the data: $pw"

#------------------------------------------------------------------------------------------------
# Demo the Use-* functions
#------------------------------------------------------------------------------------------------

Use-ConvertFromSecuredPassword

Use-GetSecuredCredential

Use-NewSecureKeyFile

Use-WriteSecuredPassword
