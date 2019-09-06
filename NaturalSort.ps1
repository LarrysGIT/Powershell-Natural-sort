
function Sort-Naturally
{
    PARAM(
        [System.Collections.ArrayList]$Array,
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
    $Array.Sort((New-Object NaturalSort.NaturalStringComparer))
    if($Descending)
    {
        $Array.Reverse()
    }
    return $Array
}
