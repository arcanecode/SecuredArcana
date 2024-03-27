# Get-SecuredCredential

## SYNOPSIS

Creates a credential object based on a passed in user name, along with key file and password file.

## SYNTAX

```powershell
Get-SecuredCredential [-PasswordPathFile] <String> [-UserName] <String> [[-KeyPathFile] <String>]
 [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION

This function uses up to three parameters.

First, it needs a password file, created using Write-SecuredPassword.

Next, it needs a user name associated with the password.

Optionally, you can add on a key file (created with New-SecureKeyFile).

With this data it can recreate a credential object that can be used with cmdlets like Invoke-Command.

Note that when we use a key, we can move the encrypted files from computer to computer.

Without a key, the credentials can only be used on the computer they were created on.

## EXAMPLES

### EXAMPLE 1

```powershell
$passwordFile = "C:\testpw.txt"
$user = "arcanecode@gmail.com"
$cred = Get-SecuredCredential -PasswordPathFile $passwordFile -UserName $user
```

### EXAMPLE 2

```powershell
$passwordFile = "C:\testpw.txt"
$user = "arcanecode@gmail.com"
$cred = Get-SecuredCredential -KeyPathFile $keyFile -PasswordPathFile $passwordFile -UserName $user
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

### -PasswordPathFile

The path and file name holding the encrypted password.
You can create this file using Write-SecuredPassword.

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

### -UserName

The user name associated with these credentials.

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

### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

This cmdlet has no inputs.

## OUTPUTS

Returns a credential object.

## NOTES

SecuredArcana - ConvertFrom-SecuredPassword.ps1

Author: Robert C Cain | [@ArcaneCode](https://twitter.com/arcanecode) | arcane@arcanetc.com

This code is Copyright (c) 2023, 2024 Robert C Cain All rights reserved

The code herein is for demonstration purposes.
No warranty or guarantee is implied or expressly granted.

This module may not be reproduced in whole or in part without
the express written consent of the author.

## RELATED LINKS

[SecuredArcana on GitHub](https://github.com/arcanecode/SecuredArcana)

[ArcaneCode's Website](http://arcanecode.me)
