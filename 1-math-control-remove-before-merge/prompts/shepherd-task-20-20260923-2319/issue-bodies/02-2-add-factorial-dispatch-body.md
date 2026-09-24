## Campaign context and required reading

On the `experiment/shepherd-control` branch, the directory `1-math-control-remove-before-merge` contains the plan (`math-tool-ignorance-reduction-plan.md`) and supporting resources (diagrams, decision records). Spike subdirectories are research artifacts — read the plan's Resolution sections for findings, not the spike source code.

Read the entire plan before working. Then carefully re-read these exact sections:

- `## Ignorance reduction`
- `### Repository-owned validation`
- `### Output and ordering contracts`
- `## Implementation`
- `### 1. Implement Fibonacci with unit and isolated CLI coverage`
- `### 2. Add factorial and operation dispatch`

The resolved validation decision is that the only canonical acceptance command is `pwsh -NoLogo -NoProfile -File ./eng/test-math-tool.ps1`. The existing pull-request workflow `.github/workflows/shepherd-task-math-tool.yml` installs exactly Pester 5.7.1 and calls that repository-owned runner. Do not replace, bypass, or duplicate the runner.

The resolved behavior decision is that direct CLI execution writes exactly one result line to stdout: `Fibonacci(N) = value` or `Factorial(N) = value`. Functions return only numeric values with no incidental output. Inputs are non-negative integers. The implementation and test files remain the repository-root `math-tool.ps1` and `math-tool.Tests.ps1`. Fibonacci behavior delivered by task 1 is a compatibility contract and must be preserved.

Research for this campaign established those validation, output, purity, input, file-location, backward-compatibility, and serial-ordering constraints. There is no separate spike implementation to reuse. Implement production behavior and tests from the specification and repository conventions; do not copy or adapt research artifact code.

## Branch and execution order

Use `experiment/shepherd-control` from remote `origin` as the base branch for this task. This is task 2 of 2. The tasks are assigned, completed, and merged serially in the order listed in the plan. Do not begin work until this issue is assigned to you and task 1 has been merged into `experiment/shepherd-control`.

Start from the base branch containing the merged task 1 implementation. Keep the pull request targeted to this issue and target `experiment/shepherd-control`.

## Implement

Extend the existing repository-root `math-tool.ps1` with:

- A pure `Get-Factorial` function that returns the factorial as a numeric value and emits no progress, labels, diagnostics, or other incidental pipeline output.
- An `Operation` parameter that dispatches between `fibonacci` and `factorial` while retaining the existing `N` parameter.
- Direct-execution formatting that writes exactly `Fibonacci(N) = value` for the Fibonacci operation and exactly `Factorial(N) = value` for the factorial operation.
- Correct factorial behavior for the edge cases `N=0` and `N=1` and for at least one small representative value greater than 1.
- Full preservation of the Fibonacci calculation and CLI behavior established by task 1.

Extend the existing repository-root `math-tool.Tests.ps1` to cover the combined behavior. Keep the interface and tests objective and small; choose the cleanest extension of the existing Pester structure rather than introducing a second test harness.

## Completion gates

Before declaring the task complete:

- Run `pwsh -NoLogo -NoProfile -File ./eng/test-math-tool.ps1` and require exit code zero for the combined regression suite.
- Confirm the pinned Pester suite still passes every task 1 Fibonacci unit and isolated CLI case without weakening or deleting those assertions.
- Add numeric unit assertions for `Get-Factorial` at `N=0`, `N=1`, and a small representative value greater than 1; these assertions must detect incidental pipeline output.
- Add isolated child-`pwsh` process coverage for both operation values and require exit code zero.
- For each covered CLI case, verify exactly one nonblank stdout line and compare the complete line against the required operation-specific format.
- Include a dispatch discrimination test using the same `N` with both operations where Fibonacci and factorial yield different values, so swapped or ignored dispatch cannot pass.
- Verify operation names produce the exact capitalization in the output labels while accepting the interface values prescribed by the plan (`fibonacci` and `factorial`).
- Verify the pull-request CI workflow remains unchanged and passes with Pester 5.7.1 through the repository-owned runner.
- Confirm the pull request has no changes outside `math-tool.ps1` and `math-tool.Tests.ps1`.

## Out of scope

- Replacing or modifying the canonical test runner, workflow, or pinned Pester version.
- Renaming the existing `N` parameter or changing the established Fibonacci calculation/output contract.
- Adding operations other than `fibonacci` and `factorial`.
- Adding dependencies, modules, generated artifacts, or unrelated repository cleanup.
- Broad input-policy work beyond the plan's non-negative integer contract.
