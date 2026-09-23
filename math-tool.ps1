[CmdletBinding()]
param(
    [ValidateRange(0, [int]::MaxValue)]
    [int] $N,

    [ValidateSet('fibonacci', 'factorial')]
    [string] $Operation = 'fibonacci'
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

function Get-Factorial {
    param(
        [ValidateRange(0, [int]::MaxValue)]
        [int] $N
    )

    [bigint] $product = 1

    for ($index = 2; $index -le $N; $index++) {
        $product = $product * $index
    }

    return $product
}

if ($MyInvocation.InvocationName -ne '.') {
    switch ($Operation) {
        'factorial' { Write-Output "Factorial($N) = $(Get-Factorial -N $N)" }
        default { Write-Output "Fibonacci($N) = $(Get-Fibonacci -N $N)" }
    }
}
