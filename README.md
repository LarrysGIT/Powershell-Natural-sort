
## Sort?

You may notice "sort" in Windows explorer is different from other programs.

Windows explorer is using `natural sort`, which in many cases more like a `human`.

## Natural sort?

Windows explorer uses a legacy API in `shlwapi.dll` named `StrCmpLogicalW` on sorting strings.

## I want use `Natural sort` in my powershell script.

### Sort string array
```powershell
PS> # Load the function
PS> . .\NaturalSort.ps1
PS>
PS> # Typical use
PS> Sort-Naturally -Array @('2', '1', '11')
1
2
11
PS> # Typical use, via pipeline
PS> ,@('2', '1', '11') | Sort-Naturally
1
2
11
PS> # For compare, if regular sort is used
PS> @('2', '1', '11') | Sort-Object
1
11
2
```

### Sort object array
PS>
PS> # Not good
PS> $t = ls .\testfiles\*.txt
PS> $t | Sort-Object
1.txt
10.txt
2.txt
PS>
PS> # Good result
PS> Sort-Naturally -Array $t
1.txt
2.txt
10.txt
PS> ,$t | Sort-Naturally
1.txt
2.txt
10.txt

### Sort object array by member property
PS> 
PS> # Sort by a selected property
PS> $t = @()
PS> $t += New-Object PSObject -Property @{Name = "1"; ID = "2"}
PS> $t += New-Object PSObject -Property @{Name = "10"; ID = "1"}
PS> $t += New-Object PSObject -Property @{Name = "2"; ID = "10"}
PS> $t
ID Name
-- ----
2  1   
1  10  
10 2   
PS> ,$t | Sort-Naturally -Property ID
ID Name
-- ----
1  10  
2  1   
10 2   
PS> ,$t | Sort-Naturally -Property Name
ID Name
-- ----
2  1   
10 2   
1  10  
PS> $tt = ls .\testfiles
PS> ,$tt | Sort-Naturally -Property Name -Descending
Name  
----  
10.txt
2.txt 
1.txt 
PS> 
PS> 
PS> 
```
