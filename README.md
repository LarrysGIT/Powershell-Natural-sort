
## Sort?
You may notice "sort" in Windows explorer and other programs are different. Why?

Because Windows explorer is using `natural sort`, which in many cases more like "humans".

## Natural sort?

Windows explorer is using a legacy API in `shlwapi.dll` called `StrCmpLogicalW` when sorting strings, aka, `Natural sort`

## I want use `Naturall sort` in my powershell script.

Not that easy and not tidy, but achievable.

```
PS> # Natural sort
PS> . .\NaturalSort.ps1
PS> Sort-Naturally -strArray @('2', '1', '11')
1
2
11
PS> # If regular sort is used
PS> @('2', '1', '11') | Sort-Object
1
11
2

PS> # Not good
PS> $t = (ls .\Scripts*.txt).name
PS> $t | Sort-Object
Scripts1.txt
Scripts10.txt
Scripts2.txt
PS> # Good
PS> Sort-Naturally -strArray $t
Scripts1.txt
Scripts2.txt
Scripts10.txt
```

### The script is simple enough while probably not tidy.

### I am devops instead of a professional C# developer, pull request is appreciated

- Larry.Song@outlook.com
