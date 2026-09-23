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
}
