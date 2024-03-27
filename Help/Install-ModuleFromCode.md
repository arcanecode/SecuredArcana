# Install-ModuleFromCode

## SYNOPSIS

Copy a module from source code into the users default PowerShell Modules folder.

## SYNTAX

```powershell
Install-ModuleFromCode [-CodeLocation] <String> [-ModuleName] <String> [-ProgressAction <ActionPreference>]
 [<CommonParameters>]
```

## DESCRIPTION

This function is not exposed as part of the module, as it won't be relavent.

It is inlcuded should you download the source and wish to install from there, as opposed to installing from the PSGallery.

This function will first validate the proper place exists in the default PowerShell Modules folder.

It will be in the format of \ModuleName\Version, if not found it is created.

It then copies the files for the module into the users PowerShell Modules folder.

This is ideal for situations where you have the source code for the module, and the module is not found in the PSGallery or a corporate gallery.

## EXAMPLES

### EXAMPLE 1

```powershell
$keyFile = 'C:\testkey.txt'
New-SecureKeyFile -KeyFilePath $keyFile
```

## PARAMETERS

### -CodeLocation

Enter the path to the source code for the module.

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

### -ModuleName

Enter the module name to install.

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

None

## NOTES

SecuredArcana - Install-ModuleFromCode.ps1

Author: Robert C Cain | [@ArcaneCode](https://twitter.com/arcanecode) | arcane@arcanetc.com

This code is Copyright (c) 2023, 2024 Robert C Cain All rights reserved

The code herein is for demonstration purposes.
No warranty or guarantee is implied or expressly granted.

This module may not be reproduced in whole or in part without
the express written consent of the author.

## RELATED LINKS

[SecuredArcana on GitHub](https://github.com/arcanecode/SecuredArcana)

[ArcaneCode's Website](http://arcanecode.me)
