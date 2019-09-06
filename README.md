
## Sort?
You may notice "sort" in Windows explorer and other programs are different. Why?

Because Windows explorer is using `natural sort`, which in many cases more like a `human`.

## Natural sort?

Windows explorer is using a legacy API in `shlwapi.dll` called `StrCmpLogicalW` when sort strings, aka, `Natural sort`

## I want use `Natural sort` in my powershell script.

Not tidy, but achievable.

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

### The script is simple enough while probably not tidy.

### I am devops instead of a professional C# developer, pull request is appreciated
