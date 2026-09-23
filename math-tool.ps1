[CmdletBinding()]
param(
    [ValidateRange(0, [int]::MaxValue)]
    [int] $N
)

Set-StrictMode -Version Latest

function Get-Fibonacci {
    param(
        [ValidateRange(0, [int]::MaxValue)]
        [int] $N
    )

    if ($N -eq 0) {
        return [bigint] 0
    }

    [bigint] $previous = 0
    [bigint] $current = 1

    for ($index = 2; $index -le $N; $index++) {
        [bigint] $next = $previous + $current
        $previous = $current
        $current = $next
    }

    return $current
}

if ($MyInvocation.InvocationName -ne '.') {
    Write-Output "Fibonacci($N) = $(Get-Fibonacci -N $N)"
}
