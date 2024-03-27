# New-SecureKeyFile

## SYNOPSIS

Generates a unique encryption key and writes to to a file.

## SYNTAX

```powershell
New-SecureKeyFile [-KeyFilePath] <String> [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION

Generates a unique key then writes that key to the file name passed in.
This file can be
used for encryption / decryption with the other functions in this file.

## EXAMPLES

### EXAMPLE 1

```powershell
$keyFile = 'C:\testkey.txt'
New-SecureKeyFile -KeyFilePath $keyFile
```

## PARAMETERS

### -KeyFilePath

Enter the path and file name for the key file.

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

This cmdlet has one inputs, the name of the file to write the key to.

## OUTPUTS

None

## NOTES

SecuredArcana - New-SecureKeyFile.ps1

Author: Robert C Cain | [@ArcaneCode](https://twitter.com/arcanecode) | arcane@arcanetc.com

This code is Copyright (c) 2023, 2024 Robert C Cain All rights reserved

The code herein is for demonstration purposes.
No warranty or guarantee is implied or expressly granted.

This module may not be reproduced in whole or in part without
the express written consent of the author.

## RELATED LINKS

[SecuredArcana on GitHub](https://github.com/arcanecode/SecuredArcana)

[ArcaneCode's Website](http://arcanecode.me)
