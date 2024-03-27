# ConvertFrom-SecuredPassword

## SYNOPSIS

Converts a password from a secured string to plain text.

## SYNTAX

```powershell
ConvertFrom-SecuredPassword [-Credential] <PSCredential> [-NoClipboard] [-ProgressAction <ActionPreference>]
 [<CommonParameters>]
```

## DESCRIPTION

Accepts a credential object and extracts the password, returning it as plain text.

## EXAMPLES

### EXAMPLE 1

```powershell
$myPassword = ConvertFrom-SecuredPassword -Credential $credentialObject
```

Returns the password into the $myPassword variable as well as placing a copy in the clipboard.

### EXAMPLE 2

```powershell
$myPassword = ConvertFrom-SecuredPassword -Credential $credentialObject -NoClipboard
```

Returns the password into the $myPassword variable, but does not put it in the clipboard.

## PARAMETERS

### -Credential

A standard PSCredential object containing the data you need to extract.

```yaml
Type: PSCredential
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -NoClipboard

A switch, when provided does not copy the extracted password to the clipboard.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
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

Returns the password in plain text.

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
