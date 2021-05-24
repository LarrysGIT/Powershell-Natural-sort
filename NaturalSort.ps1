
function Sort-Naturally
{
    PARAM(
        [Parameter(ValueFromPipeline=$true)]
        [System.Collections.ArrayList]$Array,
        [String]$Property,
        [switch]$Descending
    )

    Add-Type -TypeDefinition @'
using System;
using System.Collections;
using System.Collections.Generic;
using System.Runtime.InteropServices;

namespace NaturalSort {
    public static class NaturalSort
    {
        [DllImport("shlwapi.dll", CharSet = CharSet.Unicode)]
        public static extern int StrCmpLogicalW(string psz1, string psz2);

        public static System.Collections.ArrayList Sort(System.Collections.ArrayList foo)
        {
            foo.Sort(new NaturalStringComparer());
            return foo;
        }
    }

    public class NaturalStringComparer : IComparer
    {
        public int Compare(object x, object y)
        {
            return NaturalSort.StrCmpLogicalW(x.ToString(), y.ToString());
        }
    }
}
'@
    if($Property)
    {
        $ArrayTmp = @{}
        foreach($obj in $Array)
        {
            $ArrayTmp.Add(("{0}_{1}" -f $obj.$Property, $obj.GetHashCode()), $obj)
        }
        $Keys = New-Object System.Collections.ArrayList
        $Keys.AddRange(@($ArrayTmp.Keys))
        $Keys.Sort((New-Object NaturalSort.NaturalStringComparer))
        $Array.Clear()
        foreach($k in $Keys)
        {
            $Array.Add($ArrayTmp[$k]) | Out-Null
        }
    }
    else
    {
        $Array.Sort((New-Object NaturalSort.NaturalStringComparer))
    }
    if($Descending)
    {
        $Array.Reverse()
    }
    return $Array
}
