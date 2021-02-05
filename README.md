
## Sort?

You may notice "sort" in Windows explorer is different from other programs.

Windows explorer is using `natural sort`, which in many cases more like a `human`.

## Natural sort?

Windows explorer uses a legacy API in `shlwapi.dll` named `StrCmpLogicalW` on sorting strings.

## I want use `Natural sort` in my powershell script.

Achievable.

```powershell
PS> # Natural sort
PS> . .\NaturalSort.ps1
PS> Sort-Naturally -Array @('2', '1', '11')
1
2
11
PS> # If regular sort is being used
PS> @('2', '1', '11') | Sort-Object
1
11
2

PS> # Not good
PS> $t = ls .\testfiles\*.txt
PS> $t | Sort-Object
1.txt
10.txt
2.txt

PS> # Good
PS> Sort-Naturally -Array $t
1.txt
2.txt
10.txt
```

