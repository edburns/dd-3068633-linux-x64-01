Describe 'Get-Fibonacci' {
    BeforeAll {
        . (Join-Path $PSScriptRoot 'math-tool.ps1')
    }

    $cases = @(
        @{ N = 0; Expected = [bigint] 0 }
        @{ N = 1; Expected = [bigint] 1 }
        @{ N = 5; Expected = [bigint] 5 }
    )

    It 'returns only the numeric Fibonacci value for N=<N>' -ForEach $cases {
        $result = @(Get-Fibonacci -N $N)

        $result | Should -HaveCount 1
        $result[0] | Should -BeOfType ([bigint])
        $result[0] | Should -Be $Expected
    }
}

Describe 'Get-Factorial' {
    BeforeAll {
        . (Join-Path $PSScriptRoot 'math-tool.ps1')
    }

    $cases = @(
        @{ N = 0; Expected = [bigint] 1 }
        @{ N = 1; Expected = [bigint] 1 }
        @{ N = 5; Expected = [bigint] 120 }
    )

    It 'returns only the numeric factorial value for N=<N>' -ForEach $cases {
        $result = @(Get-Factorial -N $N)

        $result | Should -HaveCount 1
        $result[0] | Should -BeOfType ([bigint])
        $result[0] | Should -Be $Expected
    }
}

Describe 'math-tool CLI' {
    $cases = @(
        @{ N = 0; Expected = 'Fibonacci(0) = 0' }
        @{ N = 1; Expected = 'Fibonacci(1) = 1' }
        @{ N = 5; Expected = 'Fibonacci(5) = 5' }
    )

    It 'writes one result line for N=<N>' -ForEach $cases {
        $scriptPath = Join-Path $PSScriptRoot 'math-tool.ps1'
        $output = & pwsh -NoLogo -NoProfile -File $scriptPath -N $N
        $exitCode = $LASTEXITCODE
        $lines = @($output)

        $exitCode | Should -Be 0
        $lines | Should -HaveCount 1
        $lines[0] | Should -Match '\S'
        $lines[0] | Should -Be $Expected
    }

    $operationCases = @(
        @{ Operation = 'fibonacci'; N = 0; Expected = 'Fibonacci(0) = 0' }
        @{ Operation = 'fibonacci'; N = 1; Expected = 'Fibonacci(1) = 1' }
        @{ Operation = 'fibonacci'; N = 5; Expected = 'Fibonacci(5) = 5' }
        @{ Operation = 'factorial'; N = 0; Expected = 'Factorial(0) = 1' }
        @{ Operation = 'factorial'; N = 1; Expected = 'Factorial(1) = 1' }
        @{ Operation = 'factorial'; N = 5; Expected = 'Factorial(5) = 120' }
    )

    It 'writes one result line for Operation=<Operation> N=<N>' -ForEach $operationCases {
        $scriptPath = Join-Path $PSScriptRoot 'math-tool.ps1'
        $output = & pwsh -NoLogo -NoProfile -File $scriptPath -N $N -Operation $Operation
        $exitCode = $LASTEXITCODE
        $lines = @($output | Where-Object { $_ -match '\S' })

        $exitCode | Should -Be 0
        $lines | Should -HaveCount 1
        $lines[0] | Should -Be $Expected
    }

    It 'dispatches distinct results for the same N' {
        $scriptPath = Join-Path $PSScriptRoot 'math-tool.ps1'

        $fibonacci = & pwsh -NoLogo -NoProfile -File $scriptPath -N 5 -Operation fibonacci
        $factorial = & pwsh -NoLogo -NoProfile -File $scriptPath -N 5 -Operation factorial

        @($fibonacci)[0] | Should -Be 'Fibonacci(5) = 5'
        @($factorial)[0] | Should -Be 'Factorial(5) = 120'
        @($fibonacci)[0] | Should -Not -Be @($factorial)[0]
    }
}
