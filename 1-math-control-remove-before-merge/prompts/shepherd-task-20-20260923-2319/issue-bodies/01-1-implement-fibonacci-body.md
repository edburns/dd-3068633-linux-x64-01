## Campaign context and required reading

On the `experiment/shepherd-control` branch, the directory `1-math-control-remove-before-merge` contains the plan (`math-tool-ignorance-reduction-plan.md`) and supporting resources (diagrams, decision records). Spike subdirectories are research artifacts — read the plan's Resolution sections for findings, not the spike source code.

Read the entire plan before working. Then carefully re-read these exact sections:

- `## Ignorance reduction`
- `### Repository-owned validation`
- `### Output and ordering contracts`
- `## Implementation`
- `### 1. Implement Fibonacci with unit and isolated CLI coverage`

The resolved validation decision is that the only canonical acceptance command is `pwsh -NoLogo -NoProfile -File ./eng/test-math-tool.ps1`. The existing pull-request workflow `.github/workflows/shepherd-task-math-tool.yml` installs exactly Pester 5.7.1 and calls that repository-owned runner. Do not replace, bypass, or duplicate the runner.

The resolved behavior decision is that direct CLI execution writes exactly one result line to stdout in the form `Fibonacci(N) = value`, while functions return only their numeric value with no incidental output. Inputs are non-negative integers. The production and test files are the repository-root files `math-tool.ps1` and `math-tool.Tests.ps1`.

Research for this campaign established those validation, output, purity, input, file-location, and serial-ordering constraints. There is no separate spike implementation to reuse. Implement production behavior and tests from the specification and repository conventions; do not copy or adapt research artifact code.

## Branch and execution order

Use `experiment/shepherd-control` from remote `origin` as the base branch for this task. This is task 1 of 2. The tasks are assigned, completed, and merged serially in the order listed in the plan. Do not begin work until this issue is assigned to you. Task 2 must not begin until this task's pull request is merged into the base branch.

Keep the pull request targeted to this issue and target `experiment/shepherd-control`.

## Implement

Create the repository-root `math-tool.ps1` with:

- A script parameter named `N` accepting non-negative integer input.
- A pure `Get-Fibonacci` function that returns the Fibonacci number as a numeric value and emits no progress, labels, diagnostics, or other incidental pipeline output.
- Direct-execution behavior that invokes the function and writes exactly one stdout line formatted as `Fibonacci(N) = value`.
- Correct Fibonacci behavior for the required edge cases `N=0` and `N=1` and for larger non-negative integers covered by the small representative test case.

Create the repository-root `math-tool.Tests.ps1` with:

- Dot-sourced unit tests that exercise `Get-Fibonacci` without relying on CLI formatting.
- Isolated child-`pwsh` process tests that execute `math-tool.ps1` as a command-line script and verify the external stdout contract.
- Coverage for `N=0`, `N=1`, and at least one small representative value greater than 1.

Keep the implementation objective and small. Follow existing PowerShell and Pester conventions in the repository.

## Completion gates

Before declaring the task complete:

- Run `pwsh -NoLogo -NoProfile -File ./eng/test-math-tool.ps1` and require exit code zero.
- Confirm the pinned Pester suite passes for the function tests and isolated CLI tests.
- Verify unit assertions compare numeric values, which guards against accidental labels or other pipeline output from `Get-Fibonacci`.
- Verify each child-process CLI case produces exactly one nonblank stdout line and that the complete line equals the required `Fibonacci(N) = value` text for `N=0`, `N=1`, and the representative value.
- Verify the child process exits zero for every covered valid input.
- Verify the pull-request CI workflow remains unchanged and passes with Pester 5.7.1 through the repository-owned runner.
- Confirm the pull request has no changes outside `math-tool.ps1` and `math-tool.Tests.ps1`.

## Out of scope

- Factorial calculation, an `Operation` parameter, or operation dispatch; those belong to task 2.
- Replacing or modifying the canonical test runner, workflow, or pinned Pester version.
- Adding dependencies, modules, generated artifacts, or unrelated repository cleanup.
- Expanding the interface beyond the specified non-negative integer `N` input and exact Fibonacci output contract.
