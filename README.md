
## Sort?
### You may notice "sort" in Windows explorer and other programs are different. Why?
### Windows explorer is using `natural sort` which in many cases like "humans"

## Natural sort?
### Windows explorer is using a legacy API in `shlwapi.dll` called `StrCmpLogicalW`

## I want use `Naturall sort` in my powershell script.
### Not that easy and not tidy, but, achievable.

'''
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
'''

### The script is simple enough while probably not tidy.

- Larry.Song@outlook.com
