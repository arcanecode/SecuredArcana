# Write-SecuredPassword

## SYNOPSIS

Creates a file holding an encrypted password.
You can optinally add a key file to use for encryption.

## SYNTAX

```powershell
Write-SecuredPassword [-PasswordPathFile] <String> [-Password] <String> [[-KeyPathFile] <String>]
 [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION

This function uses three parameters, one of which is optional.
First is the file path and name of the password file you want to create.

The second parameter is the plain text password you want to encrypt. 

The third parameter is the path and file name of the key file you created with New-SecureKeyFile.
If you do not pass in a key file, the password will be encrypted using a key that is unique to the machine.

## EXAMPLES

### EXAMPLE 1

```powershell
$outputPasswordFile = 'C:\testpw.txt'
Write-SecuredPassword -PasswordPathFile $outputPasswordFile `
                      -Password 'somepassword/'
```

### EXAMPLE 2

```powershell
$keyFile = 'C:\testkey.txt'
$outputPasswordFile = 'C:\testpw.txt'
Write-SecuredPassword -KeyPathFile $keyFile `
                      -PasswordPathFile $outputPasswordFile `
                      -Password 'somepassword/'
```

## PARAMETERS

### -KeyPathFile

Optional.
The path and file name holding the encryption key.
You can create this file using New-SecureKeyFile.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: ?
Accept pipeline input: False
Accept wildcard characters: False
```

### -Password

The password you want to encrypt and store.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -PasswordPathFile

The path and file name you want to create.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ProgressAction

A common parameter. The action to take when the progress is updated.

```yaml
Type: ActionPreference
Parameter Sets: (All)
Aliases: proga

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

This cmdlet has no inputs.

## OUTPUTS

Returns a credential object.

## NOTES

SecuredArcana - Write-SecuredPassword.ps1

Author: Robert C Cain | [@ArcaneCode](https://twitter.com/arcanecode) | arcane@arcanetc.com

This code is Copyright (c) 2023, 2024 Robert C Cain All rights reserved

The code herein is for demonstration purposes.
No warranty or guarantee is implied or expressly granted.

This module may not be reproduced in whole or in part without
the express written consent of the author.

## RELATED LINKS

[SecuredArcana on GitHub](https://github.com/arcanecode/SecuredArcana)

[ArcaneCode's Website](http://arcanecode.me)
