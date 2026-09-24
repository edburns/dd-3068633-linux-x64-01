# Copilot CLI Session

> [!NOTE]
> - **Session ID:** `4423079c-5614-4468-9d65-46166c3e648f`  
> - **Started:** 9/23/2026, 11:19:42 PM  
> - **Duration:** 1m 30s  
> - **Exported:** 9/23/2026, 11:21:13 PM  

---

<sub>3s</sub>

### User

Invoke skill `shepherd-task-20-create-issues-from-plan` with these inputs:

- CAMPAIGN_ID: 7e00e911-c166-46dc-957a-99f379b4ceaa
- LESSON_PROPAGATION: off
- REPO: edburns/dd-3068633-linux-x64-01
- BASE_BRANCH: experiment/shepherd-control
- PARENT_ISSUE: 1
- PLAN_DIRECTORY: 1-math-control-remove-before-merge
- PLAN_FILE_NAME: math-tool-ignorance-reduction-plan.md
- QUESTIONS_SECTION: ## Ignorance reduction
- IMPLEMENTATION_SECTION: ## Implementation
- EXPECTED_TASK_COUNT: 2
- BASE_REMOTE: origin
- LOG_DIRECTORY: /home/edburns/workareas/dd-3068633-linux-x64-01-shepherd-control/1-math-control-remove-before-merge/prompts/shepherd-task-20-20260923-2319
- DRAFT_VALIDATOR: /home/edburns/.copilot/plugins/shepherd-task/scripts/validate-stage20-drafts.sh
- ISSUE_BODY_VERIFIER: /home/edburns/.copilot/plugins/shepherd-task/scripts/verify-github-issue-body.sh

Fixture pagination response contract (mandatory):

- `gh api ... --paginate --slurp` returns a JSON array of page payloads, so a
  one-page response has the shape `[[{...}]]`, not `[{...}]`.
- Before indexing child issue fields such as `.id`, normalize the response to
  one flat issue array exactly once.
- In Bash, use:
  `jq 'if length == 0 then [] elif all(.[]; type == "array") then add else . end'`.
- In PowerShell, capture the `gh` output and `$LASTEXITCODE` first, then pass
  the complete JSON through the same `jq` normalization before
  `ConvertFrom-Json`.
- Use the normalized flat array for the pre-creation baseline, final child
  count/order checks, and failure reconciliation. Do not apply `add` a second
  time to an already-flat array.

---

<sub>5s</sub>

### `skill`

**shepherd-task-20-create-issues-from-plan**

<details>
<summary>Arguments</summary>

```json
{
  "skill": "shepherd-task-20-create-issues-from-plan"
}
```

</details>

```
Skill "shepherd-task-20-create-issues-from-plan" loaded successfully. Follow the instructions in the skill context.
```


---

<sub>8s</sub>

### Copilot

I’m validating the campaign inputs, plan structure, GitHub parent state, and required draft conventions before any mutation.

---

<sub>15s</sub>

### `view`

**view the file at /home/edburns/workareas/dd-3068633-linux-x64-01-shepherd-control/1-math-control-remove-before-merge/math-tool-ignorance-reduction-plan.md.**

/home/edburns/workareas/dd-3068633-linux-x64-01-shepherd-control/1-math-control-remove-before-merge/math-tool-ignorance-reduction-plan.md

<details>
<summary>38 lines</summary>

```
# PowerShell math-tool control campaign

Build the fixture in two cheap, serial tasks. The repository already contains
deterministic CI pinned to Pester 5.7.1. The acceptance command for every task
is `pwsh -NoLogo -NoProfile -File ./eng/test-math-tool.ps1`. Task 2 starts only after task 1 is merged.

## Ignorance reduction

### Repository-owned validation

**Question:** What command and environment define acceptance?

**Resolution:** The committed canonical command is
`pwsh -NoLogo -NoProfile -File ./eng/test-math-tool.ps1`. The baseline workflow
`.github/workflows/shepherd-task-math-tool.yml` installs exactly Pester
5.7.1 and invokes that repository-owned runner. Do not replace or bypass it.

### Output and ordering contracts

**Question:** What externally observable behavior and dependency order are required?

**Resolution:** Direct CLI execution writes exactly one result line to stdout:
`Fibonacci(N) = value` or `Factorial(N) = value`. Functions return the
numeric value without incidental output. Inputs are non-negative integers.
Implementation is serial: task 2 depends on merged task 1. The implementation
and test files are repository-root `math-tool.ps1` and
`math-tool.Tests.ps1`.

## Implementation

### 1. Implement Fibonacci with unit and isolated CLI coverage

Create `math-tool.ps1` with parameter `N` and a pure `Get-Fibonacci`
function. Direct execution must print exactly `Fibonacci(N) = value`.
Create `math-tool.Tests.ps1` containing dot-sourced unit tests for the
function and isolated child-`pwsh` process tests for direct CLI behavior.
Cover N=0, N=1, and a small representative value. Keep changes limited to the
math tool and its tests.

Acceptance: `pwsh -NoLogo -NoProfile -File ./eng/test-math-tool.ps1` exits zero and the pinned pull-request CI
passes.

### 2. Add factorial and operation dispatch

After task 1 is merged, extend the same script with a pure `Get-Factorial`
function and an `Operation` parameter that dispatches between `fibonacci`
and `factorial` while retaining `N`. Preserve Fibonacci behavior. Cover
factorial edge cases 0 and 1 plus a small representative value. Keep the
interface and tests objective and small; the issue does not prescribe how to
extend the tests.

Acceptance: `pwsh -NoLogo -NoProfile -File ./eng/test-math-tool.ps1` exits zero for the combined regression suite
and the pinned pull-request CI passes.
```

</details>


---

<sub>15s</sub>

### `view`

**view the file at /home/edburns/workareas/dd-3068633-linux-x64-01-shepherd-control/1-math-control-remove-before-merge/shepherd-campaign.json.**

/home/edburns/workareas/dd-3068633-linux-x64-01-shepherd-control/1-math-control-remove-before-merge/shepherd-campaign.json

<details>
<summary>16 lines</summary>

```
{
  "schemaVersion": 1,
  "campaignId": "7e00e911-c166-46dc-957a-99f379b4ceaa",
  "campaignIssueNumber": 1,
  "campaignShortname": "math-control",
  "repository": "edburns/dd-3068633-linux-x64-01",
  "baseBranch": "experiment/shepherd-control",
  "lessonPropagation": "off",
  "campaignMetadataDirectory": "1-math-control-remove-before-merge",
  "lessonsFile": "campaign-lessons.md",
  "createdBy": {
    "shepherdTaskVersion": "1.0.4",
    "stageOutcomeProtocolVersion": 1
  },
  "createdAt": "2026-09-23T23:19:39Z"
}
```

</details>


---

<sub>15s</sub>

### `view`

**view the file at /home/edburns/workareas/dd-3068633-linux-x64-01-shepherd-control/1-math-control-remove-before-merge/campaign-lessons.md.**

/home/edburns/workareas/dd-3068633-linux-x64-01-shepherd-control/1-math-control-remove-before-merge/campaign-lessons.md

<details>
<summary>5 lines</summary>

```
# Campaign lessons

This file contains validated, reusable lessons for subsequent issues in this campaign.
The issue specification and repository instructions remain authoritative.

## Validated lessons

No validated lessons have been recorded yet.
```

</details>


---

<sub>15s</sub>

### `view`

**view the file at /home/edburns/.copilot/skills/shepherd-task-20-create-issues-from-plan/examples/01-1682-java-tool-ergonomics.md.**

/home/edburns/.copilot/skills/shepherd-task-20-create-issues-from-plan/examples/01-1682-java-tool-ergonomics.md (lines 1-260)

<details>
<summary>15 lines</summary>

```
# Example 01: 1682-java-tool-ergonomics-prompts-remove-before-merge

Read `copilot-sdk/1682-java-tool-ergonomics-prompts-remove-before-merge/dd-3018003-ignorance-reduction-for-implementation-plan.md` (the plan) to get the context.

✅✅Pay very close attention to each **Resolution:** to the questions in `Phase 3 — Ignorance reduction: questions to answer before writing code`.

In this session, we are creating issues of type **Task** as children of Epic https://github.com/github/copilot-sdk/issues/1682 . These issues correspond to the sub-sections in `## Phase 4 — Implementation (the build order)`.

I want you to use `gh` to create issues as sub-issues of 1682.

- I will dispatch these issues by assigning them to an agent. Leave them unassigned for now.

- The description you put in the issues you create is the specification for the work the agent assigned to the issue must do. Therefore, you need to be very specific and targeted when writing the description.

- Set the type to **Task**.

- Each issue will be worked on and resolved in serial. You can assume:
  - All issues will operate in this topic branch of `upstream`: `edburns/1682-java-tool-ergonomics`.

  - The assignee agent has access to the topic branch and, most importantly, to the prompts in the directory `1682-java-tool-ergonomics-prompts-remove-before-merge`, which includes the plan. Therefore, you can instruct the agent to access the plan by reference, you don't need to reference it by value directly in the issue.

- The sub-sections of `## Phase 4 — Implementation (the build order)` have essential details for each corresponding **Task**.

- Instruct the agent to read the entire plan before working.

- Instruct the agent to carefully re-read the relevant sections of the of the plan. ❌❌You can't just say, "read the relevant sections of the plan". ✅✅In the description of the issue, list exactly what sections of the plan apply to this particular issue.
- Though the sub-sections of `## Phase 4 — Implementation (the build order)` have essential details for each corresponding **Task**, I want you to carefully consider if there additional gating tests you can add so that as the agent proceeds from one task to the next, the likelihood of rework is reduced.
```

</details>


---

<sub>15s</sub>

### `view`

**view the file at /home/edburns/.copilot/skills/shepherd-task-20-create-issues-from-plan/examples/02-1810-java-tool-as-lambda.md.**

/home/edburns/.copilot/skills/shepherd-task-20-create-issues-from-plan/examples/02-1810-java-tool-as-lambda.md (lines 1-260)

<details>
<summary>12 lines</summary>

```
# Example 02: 1810-java-tool-ergonomics-tool-as-lambda-remove-before-merge

Carefully read the plan `copilot-sdk/1810-java-tool-ergonomics-tool-as-lambda-remove-before-merge/1810-ignorance-reduction-for-implementation-plan.md`.

We have completed Phases 1 - 3. We are now on Phase 4.

For each sub item in Phase 4, file a child issue of Feature #1810.

Use `gh` to look at Epic #1682 and its child issues for the standard of verbosity and concreteness for issue descriptions.

The issue should be assignable to a coding agent and there must be sufficient detail in the description for the agent to proceed to completion.

Pull out the specific relevant content from Phase 3 as it applies to this current issue in Phase 4.

Tell the agent to take `edburns/1810-java-tool-ergonomics-tool-as-lambda` as the base branch. When I assign the issue to the coding agent, I will set this as the base branch.

Tell the agent to read `1810-java-tool-ergonomics-tool-as-lambda-remove-before-merge/1810-ignorance-reduction-for-implementation-plan.md`, which is present on the branch, for context.

Tell the agent which sub-item within Phase 4 they are solving.

Tell the agent that each issue will be assigned, resolved and merged to the base branch in the order in which they appear in the plan.

No work is to start until I assign each issue to the coding agent, in turn.
```

</details>


---

<sub>15s</sub>

### `view`

**view the file at /home/edburns/.copilot/skills/shepherd-task-20-create-issues-from-plan/examples/03-dd-3017826-java-real-estate-demo.md.**

/home/edburns/.copilot/skills/shepherd-task-20-create-issues-from-plan/examples/03-dd-3017826-java-real-estate-demo.md (lines 1-260)

<details>
<summary>14 lines</summary>

```
# Example 03: dd-3017826-java-real-estate-demo-remove-before-merge

Read `dd-3017826-java-real-estate-demo-remove-before-merge\dd-3017826-java-real-estate-demo-ignorance-reduction-plan.md` (the plan) to get the context.

✅✅Pay very close attention to each **Resolution:** to the questions in `Phase 2 — Ignorance reduction: questions to answer before writing code`.

In this session, we are creating sub-issues as children of https://github.com/edburns/Build26-BRK206-your-agent-anywhere-multiclient-multidevice-with-github-copilot-sdk/issues/2 . These issues correspond to the sub-sections in `## Phase 3 — Implementation (build order)`.

I want you to use `gh` to create issues as sub-issues of #2.

- I will dispatch these issues by assigning them to an agent. Leave them unassigned for now.

- The description you put in the issues you create is the specification for the work the agent assigned to the issue must do. Therefore, you need to be very specific and targeted when writing the description.

- Each issue will be worked on and resolved in serial. You can assume:
  - All issues will operate in this topic branch of `origin`: `edburns/2-build-out-demo`.

  - The assignee agent has access to the topic branch and, most importantly, to the prompts in the directory `dd-3017826-java-real-estate-demo-remove-before-merge`, which includes the plan. Therefore, you can instruct the agent to access the plan by reference, you don't need to reference it by value directly in the issue.

- The sub-sections of `## Phase 3 — Implementation (build order)` have essential details for each corresponding sub-issue.

- Instruct the agent to read the entire plan before working.

- Instruct the agent to carefully re-read the relevant sections of the of the plan. ❌❌You can't just say, "read the relevant sections of the plan". ✅✅In the description of the issue, list exactly what sections of the plan apply to this particular issue.
- Though the sub-sections of `## Phase 3 — Implementation (build order)` have essential details for each corresponding sub-issue, I want you to carefully consider if there additional gating tests you can add so that as the agent proceeds from one task to the next, the likelihood of rework is reduced.
```

</details>


---

<sub>15s</sub>

### `view`

**view the file at /home/edburns/.copilot/skills/shepherd-task-20-create-issues-from-plan/examples/04-28-python-agent-demo.md.**

/home/edburns/.copilot/skills/shepherd-task-20-create-issues-from-plan/examples/04-28-python-agent-demo.md (lines 1-260)

<details>
<summary>16 lines</summary>

```
# Example 04: 28-python-agent-demo-remove-before-merge

Read `28-python-agent-demo-remove-before-merge/28-python-agent-demo-ignorance-reduction-plan.md` (the plan) to get the context.

✅✅Pay very close attention to each **Resolution:** to the questions in `Phase 2 — Ignorance reduction: questions to answer before writing code`. These pertain to the implementation tasks in Phase 3. ✅✅✅ Make sure to put into the description explicit instructions on how to access the relevant spike research.

In this session, we are creating sub-issues as children of https://github.com/edburns/Build26-BRK206-your-agent-anywhere-multiclient-multidevice-with-github-copilot-sdk/issues/28 . These issues correspond to the sub-sections in `## Phase 3 — Implementation (build order)`.

I want you to use `gh` to create issues as sub-issues of #28

- I will dispatch these issues by assigning them to an agent. Leave them unassigned for now.

- The description you put in the issues you create is the specification for the work the agent assigned to the issue must do. Therefore, you need to be very specific and targeted when writing the description.

- Again, ✅✅For each **Resolution:** to the questions in `Phase 2 — Ignorance reduction: questions to answer before writing code`, include the relevant Resolution values in the issue description. These pertain to the implementation tasks in Phase 3. ✅✅✅ Make sure to put into the description explicit instructions on how to access the relevant spike research for that task.

- For tasks dealing with the UI, make sure to refer to the relevant screengrabs, but only ones within `28-python-agent-demo-remove-before-merge/`.

- Each issue will be worked on and resolved in serial. You can assume:
  - All issues will operate in this topic branch of `origin`: `edburns/28-python-agent-demo`.

  - The assignee agent has access to the topic branch and, most importantly, to the prompts in the directory `28-python-agent-demo-remove-before-merge/`, which includes the plan. Therefore, you can instruct the agent to access the plan by reference, you don't need to reference it by value directly in the issue.

- The sub-sections of `## Phase 3 — Implementation (build order)` have essential details for each corresponding sub-issue.

- Instruct the agent to read the entire plan before working.

- Instruct the agent to carefully re-read the relevant sections of the of the plan. ❌❌You can't just say, "read the relevant sections of the plan". ✅✅In the description of the issue, list exactly what sections of the plan apply to this particular issue.
- Though the sub-sections of `## Phase 3 — Implementation (build order)` have essential details for each corresponding sub-issue, I want you to carefully consider if there additional gating tests you can add so that as the agent proceeds from one task to the next, the likelihood of rework is reduced.
```

</details>


---

<sub>15s</sub>

### `bash`

**Validate repository and GitHub inputs**

$ set -o pipefail
printf '%s\n' '== repo ==' && git remote -v && git --no-pager status --short && printf '%s\n' '== branch/default/parent/type ==' && git show-ref --verify --quiet refs/heads/experiment/shepherd-control && echo 'local_branch=yes' && gh api repos/edburns/dd-3068633-linux-x64-01 --jq '{default_branch,owner}' && gh api repos/edburns/dd-3068633-linux-x64-01/issues/1 --jq '{number,state,repository_url,title}' && printf '%s\n' '== children paginated/slurped ==' && gh api repos/edburns/dd-3068633-linux-x64-01/issues/1/sub_issues --paginate --slurp | jq 'if length == 0 then [] elif all(.[]; type == "array") then add else . end | map({id,number,title})' && printf '%s\n' '== paths/scripts ==' && test -d /home/edburns/workareas/dd-3068633-linux-x64-01-shepherd-control/1-math-control-remove-before-merge/prompts/shepherd-task-20-20260923-2319 && test -w /home/edburns/workareas/dd-3068633-linux-x64-01-shepherd-control/1-math-control-remove-before-merge/prompts/shepherd-task-20-20260923-2319 && test -x /home/edburns/.copilot/plugins/shepherd-task/scripts/validate-stage20-drafts.sh && test -x /home/edburns/.copilot/plugins/shepherd-task/scripts/verify-github-issue-body.sh && echo paths_ok

<details>
<summary>13 lines</summary>

```
== repo ==
origin	git@github.com:edburns/dd-3068633-linux-x64-01.git (fetch)
origin	git@github.com:edburns/dd-3068633-linux-x64-01.git (push)
?? 1-math-control-remove-before-merge/prompts/
== branch/default/parent/type ==
local_branch=yes
{"default_branch":"main","owner":{"avatar_url":"https://avatars.githubusercontent.com/u/75821?v=4","events_url":"https://api.github.com/users/edburns/events{/privacy}","followers_url":"https://api.github.com/users/edburns/followers","following_url":"https://api.github.com/users/edburns/following{/other_user}","gists_url":"https://api.github.com/users/edburns/gists{/gist_id}","gravatar_id":"","html_url":"https://github.com/edburns","id":75821,"login":"edburns","node_id":"MDQ6VXNlcjc1ODIx","organizations_url":"https://api.github.com/users/edburns/orgs","received_events_url":"https://api.github.com/users/edburns/received_events","repos_url":"https://api.github.com/users/edburns/repos","site_admin":true,"starred_url":"https://api.github.com/users/edburns/starred{/owner}{/repo}","subscriptions_url":"https://api.github.com/users/edburns/subscriptions","type":"User","url":"https://api.github.com/users/edburns","user_view_type":"public"}}
{"number":1,"repository_url":"https://api.github.com/repos/edburns/dd-3068633-linux-x64-01","state":"open","title":"[Campaign][off] shepherd-task simple-math control"}
== children paginated/slurped ==
[]
== paths/scripts ==
paths_ok
<shellId: 0 completed with exit code 0>
```

</details>


---

<sub>18s</sub>

### Copilot

The invocation is valid so far: the parent is open, the base branch differs from `main`, the baseline has no children, and this user-owned repository will use untyped issues. I’m now deriving the exact draft schema and confirming the base-branch artifacts before persisting both issue specifications.

---

<sub>23s</sub>

### `view`

**view the file at /home/edburns/.copilot/plugins/shepherd-task/scripts/validate-stage20-drafts.sh.**

/home/edburns/.copilot/plugins/shepherd-task/scripts/validate-stage20-drafts.sh (lines 1-300)

<details>
<summary>66 lines</summary>

```
#!/usr/bin/env bash
# shepherd-task-version: 1.0.4

set -euo pipefail

[[ $# -eq 3 ]] || {
    echo "Usage: $0 <body-directory> <expected-count> <off|campaign>" >&2
    exit 1
}

body_directory="$1"
expected_count="$2"
lesson_propagation="$3"

[[ -d "$body_directory" ]] || {
    echo "Stage-20 body directory does not exist: $body_directory" >&2
    exit 1
}
[[ "$expected_count" =~ ^[1-9][0-9]*$ ]] || {
    echo "Expected count must be a positive integer." >&2
    exit 1
}
[[ "$lesson_propagation" == "off" || "$lesson_propagation" == "campaign" ]] || {
    echo "Lesson propagation must be off or campaign." >&2
    exit 1
}

body_files=()
while IFS= read -r -d '' body_file; do
    body_files+=("$body_file")
done < <(
    find "$body_directory" -maxdepth 1 -type f -name '*-body.md' \
        ! -name '*-observed-body.md' -print0
)
[[ ${#body_files[@]} -eq $expected_count ]] || {
    echo "Expected $expected_count persisted stage-20 body files; found ${#body_files[@]}." >&2
    exit 1
}

required_headings=(
    '## Campaign context and required reading'
    '## Branch and execution order'
    '## Implement'
    '## Completion gates'
    '## Out of scope'
)

for body_file in "${body_files[@]}"; do
    [[ -s "$body_file" && "$(awk 'END { print NR }' "$body_file")" -gt 1 ]] || {
        echo "Persisted issue body must contain physical Markdown lines: $body_file" >&2
        exit 1
    }
    first_nonblank="$(awk 'NF { print; exit }' "$body_file")"
    [[ "$first_nonblank" =~ ^##[[:space:]]+[^[:space:]] ]] || {
        echo "Persisted issue body must begin with a level-two heading: $body_file" >&2
        exit 1
    }
    for heading in "${required_headings[@]}"; do
        grep -Fqx -- "$heading" "$body_file" || {
            echo "Persisted issue body is missing the physical heading '$heading': $body_file" >&2
            exit 1
        }
    done
    if [[ "$lesson_propagation" == "campaign" ]]; then
        grep -Fqx -- '## Campaign lessons (REQUIRED)' "$body_file" || {
            echo "Treatment issue body is missing its campaign-lessons heading: $body_file" >&2
            exit 1
        }
    elif grep -Fqx -- '## Campaign lessons (REQUIRED)' "$body_file"; then
        echo "Control issue body unexpectedly contains a campaign-lessons heading: $body_file" >&2
        exit 1
    fi
done
```

</details>


---

<sub>23s</sub>

### `view`

**view the file at /home/edburns/.copilot/plugins/shepherd-task/scripts/verify-github-issue-body.sh.**

/home/edburns/.copilot/plugins/shepherd-task/scripts/verify-github-issue-body.sh (lines 1-260)

<details>
<summary>131 lines</summary>

```
#!/usr/bin/env bash
# shepherd-task-version: 1.0.4
set -euo pipefail

fail() {
    printf 'verify-github-issue-body: %s\n' "$*" >&2
    exit 1
}

[[ $# -ge 3 && $# -le 6 ]] ||
    fail "usage: $0 OWNER/REPO ISSUE_NUMBER EXPECTED_BODY_PATH [MAX_ATTEMPTS] [DELAY_SECONDS] [DIAGNOSTIC_PATH]"

repository="$1"
issue_number="$2"
expected_body_path="$3"
max_attempts="${4:-6}"
delay_seconds="${5:-5}"
diagnostic_path="${6:-}"
gh_command="${GH_COMMAND:-gh}"

[[ "$repository" =~ ^[A-Za-z0-9_.-]+/[A-Za-z0-9_.-]+$ ]] ||
    fail "invalid repository: $repository"
[[ "$issue_number" =~ ^[1-9][0-9]*$ ]] ||
    fail "invalid issue number: $issue_number"
[[ "$max_attempts" =~ ^[1-9][0-9]*$ ]] ||
    fail "MAX_ATTEMPTS must be a positive integer"
[[ "$delay_seconds" =~ ^[0-9]+$ ]] ||
    fail "DELAY_SECONDS must be a non-negative integer"
[[ -f "$expected_body_path" ]] ||
    fail "expected issue body file not found: $expected_body_path"

temp_directory="$(mktemp -d)"
trap 'rm -rf "$temp_directory"' EXIT
response_path="$temp_directory/response.json"
actual_path="$temp_directory/actual.txt"
actual_normalized="$temp_directory/actual-normalized.txt"
expected_normalized="$temp_directory/expected-normalized.txt"

normalize_file() {
    jq -b -Rsj 'gsub("\r\n|\r"; "\n")' "$1" >"$2"
}

equivalent_files() {
    local actual="$1"
    local expected="$2"
    local candidate="$temp_directory/candidate.txt"

    cmp -s -- "$actual" "$expected" && return 0
    cp "$actual" "$candidate"
    printf '\n' >>"$candidate"
    cmp -s -- "$candidate" "$expected" && return 0
    cp "$expected" "$candidate"
    printf '\n' >>"$candidate"
    cmp -s -- "$actual" "$candidate"
}

sha256_file() {
    if command -v sha256sum >/dev/null 2>&1; then
        sha256sum "$1" | awk '{print $1}'
    else
        shasum -a 256 "$1" | awk '{print $1}'
    fi
}

write_diagnostic() {
    local reason="$1"
    local attempts="$2"
    [[ -n "$diagnostic_path" ]] || return 0

    mkdir -p "$(dirname "$diagnostic_path")"
    local expected_length actual_length expected_hash actual_hash first_offset
    expected_length="$(wc -c <"$expected_normalized" | tr -d ' ')"
    actual_length="$(wc -c <"$actual_normalized" | tr -d ' ')"
    expected_hash="$(sha256_file "$expected_normalized")"
    actual_hash="$(sha256_file "$actual_normalized")"
    first_offset="$( (cmp -l -- "$actual_normalized" "$expected_normalized" 2>/dev/null || true) | awk 'NR == 1 { print $1 - 1 }')"
    [[ -n "$first_offset" ]] || first_offset="null"

    jq -n \
        --arg repository "$repository" \
        --argjson issueNumber "$issue_number" \
        --arg endpoint "repos/$repository/issues/$issue_number" \
        --argjson attempts "$attempts" \
        --arg observedAt "$(date -u +%Y-%m-%dT%H:%M:%SZ)" \
        --arg reason "$reason" \
        --argjson expectedLength "$expected_length" \
        --argjson actualLength "$actual_length" \
        --arg expectedSha256 "$expected_hash" \
        --arg actualSha256 "$actual_hash" \
        --argjson firstDifferenceOffset "$first_offset" \
        '{
            schemaVersion: 1,
            repository: $repository,
            issueNumber: $issueNumber,
            endpoint: $endpoint,
            attempts: $attempts,
            observedAt: $observedAt,
            reason: $reason,
            expectedLength: $expectedLength,
            actualLength: $actualLength,
            expectedSha256: $expectedSha256,
            actualSha256: $actualSha256,
            firstDifferenceOffset: $firstDifferenceOffset
        }' >"$diagnostic_path"
}

normalize_file "$expected_body_path" "$expected_normalized"
last_reason=""

for ((attempt = 1; attempt <= max_attempts; attempt++)); do
    set +e
    "$gh_command" api "repos/$repository/issues/$issue_number" >"$response_path" 2>"$temp_directory/error.txt"
    exit_code=$?
    set -e

    if [[ $exit_code -ne 0 ]]; then
        last_reason="GitHub REST request failed with exit code $exit_code."
        error_message="$(cat "$temp_directory/error.txt")"
        authentication_error_pattern='HTTP[[:space:]]+(401|403)|[Aa]uthentication|[Nn][Oo][Tt][[:space:]]authorized|[Rr]esource[[:space:]]not[[:space:]]accessible'
        if [[ "$error_message" =~ $authentication_error_pattern ]]; then
            : >"$actual_normalized"
            write_diagnostic "$last_reason" "$attempt"
            fail "unable to fetch issue #$issue_number from $repository: $error_message"
        fi
    elif ! jq -e 'type == "object" and has("body")' "$response_path" >/dev/null 2>&1; then
        last_reason="GitHub REST response was invalid JSON."
    else
        jq -b -j '.body // ""' "$response_path" >"$actual_path"
        normalize_file "$actual_path" "$actual_normalized"
        if equivalent_files "$actual_normalized" "$expected_normalized"; then
            cat "$response_path"
            exit 0
        fi
        last_reason="GitHub issue body differs from the persisted draft."
    fi

    if [[ $attempt -lt $max_attempts ]]; then
        printf 'verify-github-issue-body: %s Retrying issue #%s body verification (%s/%s).\n' \
            "$last_reason" "$issue_number" "$attempt" "$max_attempts" >&2
        ((delay_seconds > 0)) && sleep "$delay_seconds"
    fi
done

[[ -f "$actual_normalized" ]] || : >"$actual_normalized"
write_diagnostic "$last_reason" "$max_attempts"
diagnostic_suffix=""
[[ -z "$diagnostic_path" ]] || diagnostic_suffix=" Diagnostic: $diagnostic_path"
fail "issue #$issue_number body verification failed after $max_attempts attempts. $last_reason$diagnostic_suffix"
```

</details>


---

<sub>23s</sub>

### `glob`

**1-math-control-remove-before-merge/**/***

"1-math-control-remove-before-merge/**/*"

<details>
<summary>8 matches</summary>

```
/home/edburns/workareas/dd-3068633-linux-x64-01-shepherd-control/1-math-control-remove-before-merge/shepherd-campaign.json
/home/edburns/workareas/dd-3068633-linux-x64-01-shepherd-control/1-math-control-remove-before-merge/math-tool-ignorance-reduction-plan.md
/home/edburns/workareas/dd-3068633-linux-x64-01-shepherd-control/1-math-control-remove-before-merge/prompts/shepherd-task-20-20260923-2319/create-issues-otel-20260923-2319.jsonl
/home/edburns/workareas/dd-3068633-linux-x64-01-shepherd-control/1-math-control-remove-before-merge/shepherd-test-experiment.json
/home/edburns/workareas/dd-3068633-linux-x64-01-shepherd-control/1-math-control-remove-before-merge/prompts/shepherd-task-20-20260923-2319/20260923-2319-invoke-shepherd-task-20-create-issues-from-plan-skill.md
/home/edburns/workareas/dd-3068633-linux-x64-01-shepherd-control/1-math-control-remove-before-merge/prompts/shepherd-task-20-20260923-2319/20260923-2319-invoke-shepherd-task-20-create-issues-from-plan-skill.sh
/home/edburns/workareas/dd-3068633-linux-x64-01-shepherd-control/1-math-control-remove-before-merge/prompts/shepherd-task-20-20260923-2319/create-issues-session-20260923-2319.jsonl
/home/edburns/workareas/dd-3068633-linux-x64-01-shepherd-control/1-math-control-remove-before-merge/campaign-lessons.md
```

</details>


---

<sub>23s</sub>

### `bash`

**Confirm base branch plan artifacts**

$ set -o pipefail
printf '%s\n' '== remote branch ==' && git ls-remote --exit-code --heads origin refs/heads/experiment/shepherd-control && printf '%s\n' '== base plan hashes ==' && git show experiment/shepherd-control:1-math-control-remove-before-merge/math-tool-ignorance-reduction-plan.md | sha256sum && git show experiment/shepherd-control:1-math-control-remove-before-merge/shepherd-campaign.json | jq '{campaignId,lessonPropagation}' && git cat-file -e experiment/shepherd-control:1-math-control-remove-before-merge/campaign-lessons.md && echo campaign_lessons_exists=yes && printf '%s\n' '== heading counts ==' && test "$(git show experiment/shepherd-control:1-math-control-remove-before-merge/math-tool-ignorance-reduction-plan.md | grep -Fx '## Ignorance reduction' | wc -l)" -eq 1 && test "$(git show experiment/shepherd-control:1-math-control-remove-before-merge/math-tool-ignorance-reduction-plan.md | grep -Fx '## Implementation' | wc -l)" -eq 1 && git show experiment/shepherd-control:1-math-control-remove-before-merge/math-tool-ignorance-reduction-plan.md | awk '/^## Implementation$/{in_impl=1;next} in_impl && /^## /{exit} in_impl && /^### /{print}'

<details>
<summary>13 lines</summary>

```
== remote branch ==
356d62c3f967ea950f828f650c07745185df682d	refs/heads/experiment/shepherd-control
== base plan hashes ==
5e84bc58598094a555d79868904436adbfc8a182a7e3250d4c14f288dbdff501  -
{
  "campaignId": "7e00e911-c166-46dc-957a-99f379b4ceaa",
  "lessonPropagation": "off"
}
campaign_lessons_exists=yes
== heading counts ==
### 1. Implement Fibonacci with unit and isolated CLI coverage
### 2. Add factorial and operation dispatch
<shellId: 1 completed with exit code 0>
```

</details>


---

<sub>25s</sub>

### Copilot

Both gating questions are resolved: acceptance is the pinned Pester 5.7.1 runner, while the observable contract fixes exact stdout, pure numeric returns, non-negative inputs, root-level files, and serial dependency order. No separate spike artifacts exist, so the drafts carry these research decisions directly and explicitly forbid using research code as production templates.

---

<sub>47s</sub>

### `apply_patch`

<details>
<summary>Arguments</summary>

```json
"*** Begin Patch\n*** Add File: /home/edburns/workareas/dd-3068633-linux-x64-01-shepherd-control/1-math-control-remove-before-merge/prompts/shepherd-task-20-20260923-2319/issue-bodies/01-1-implement-fibonacci-body.md\n+## Campaign context and required reading\n+\n+On the `experiment/shepherd-control` branch, the directory `1-math-control-remove-before-merge` contains the plan (`math-tool-ignorance-reduction-plan.md`) and supporting resources (diagrams, decision records). Spike subdirectories are research artifacts — read the plan's Resolution sections for findings, not the spike source code.\n+\n+Read the entire plan before working. Then carefully re-read these exact sections:\n+\n+- `## Ignorance reduction`\n+- `### Repository-owned validation`\n+- `### Output and ordering contracts`\n+- `## Implementation`\n+- `### 1. Implement Fibonacci with unit and isolated CLI coverage`\n+\n+The resolved validation decision is that the only canonical acceptance command is `pwsh -NoLogo -NoProfile -File ./eng/test-math-tool.ps1`. The existing pull-request workflow `.github/workflows/shepherd-task-math-tool.yml` installs exactly Pester 5.7.1 and calls that repository-owned runner. Do not replace, bypass, or duplicate the runner.\n+\n+The resolved behavior decision is that direct CLI execution writes exactly one result line to stdout in the form `Fibonacci(N) = value`, while functions return only their numeric value with no incidental output. Inputs are non-negative integers. The production and test files are the repository-root files `math-tool.ps1` and `math-tool.Tests.ps1`.\n+\n+Research for this campaign established those validation, output, purity, input, file-location, and serial-ordering constraints. There is no separate spike implementation to reuse. Implement production behavior and tests from the specification and repository conventions; do not copy or adapt research artifact code.\n+\n+## Branch and execution order\n+\n+Use `experiment/shepherd-control` from remote `origin` as the base branch for this task. This is task 1 of 2. The tasks are assigned, completed, and merged serially in the order listed in the plan. Do not begin work until this issue is assigned to you. Task 2 must not begin until this task's pull request is merged into the base branch.\n+\n+Keep the pull request targeted to this issue and target `experiment/shepherd-control`.\n+\n+## Implement\n+\n+Create the repository-root `math-tool.ps1` with:\n+\n+- A script parameter named `N` accepting non-negative integer input.\n+- A pure `Get-Fibonacci` function that returns the Fibonacci number as a numeric value and emits no progress, labels, diagnostics, or other incidental pipeline output.\n+- Direct-execution behavior that invokes the function and writes exactly one stdout line formatted as `Fibonacci(N) = value`.\n+- Correct Fibonacci behavior for the required edge cases `N=0` and `N=1` and for larger non-negative integers covered by the small representative test case.\n+\n+Create the repository-root `math-tool.Tests.ps1` with:\n+\n+- Dot-sourced unit tests that exercise `Get-Fibonacci` without relying on CLI formatting.\n+- Isolated child-`pwsh` process tests that execute `math-tool.ps1` as a command-line script and verify the external stdout contract.\n+- Coverage for `N=0`, `N=1`, and at least one small representative value greater than 1.\n+\n+Keep the implementation objective and small. Follow existing PowerShell and Pester conventions in the repository.\n+\n+## Completion gates\n+\n+Before declaring the task complete:\n+\n+- Run `pwsh -NoLogo -NoProfile -File ./eng/test-math-tool.ps1` and require exit code zero.\n+- Confirm the pinned Pester suite passes for the function tests and isolated CLI tests.\n+- Verify unit assertions compare numeric values, which guards against accidental labels or other pipeline output from `Get-Fibonacci`.\n+- Verify each child-process CLI case produces exactly one nonblank stdout line and that the complete line equals the required `Fibonacci(N) = value` text for `N=0`, `N=1`, and the representative value.\n+- Verify the child process exits zero for every covered valid input.\n+- Verify the pull-request CI workflow remains unchanged and passes with Pester 5.7.1 through the repository-owned runner.\n+- Confirm the pull request has no changes outside `math-tool.ps1` and `math-tool.Tests.ps1`.\n+\n+## Out of scope\n+\n+- Factorial calculation, an `Operation` parameter, or operation dispatch; those belong to task 2.\n+- Replacing or modifying the canonical test runner, workflow, or pinned Pester version.\n+- Adding dependencies, modules, generated artifacts, or unrelated repository cleanup.\n+- Expanding the interface beyond the specified non-negative integer `N` input and exact Fibonacci output contract.\n*** Add File: /home/edburns/workareas/dd-3068633-linux-x64-01-shepherd-control/1-math-control-remove-before-merge/prompts/shepherd-task-20-20260923-2319/issue-bodies/02-2-add-factorial-dispatch-body.md\n+## Campaign context and required reading\n+\n+On the `experiment/shepherd-control` branch, the directory `1-math-control-remove-before-merge` contains the plan (`math-tool-ignorance-reduction-plan.md`) and supporting resources (diagrams, decision records). Spike subdirectories are research artifacts — read the plan's Resolution sections for findings, not the spike source code.\n+\n+Read the entire plan before working. Then carefully re-read these exact sections:\n+\n+- `## Ignorance reduction`\n+- `### Repository-owned validation`\n+- `### Output and ordering contracts`\n+- `## Implementation`\n+- `### 1. Implement Fibonacci with unit and isolated CLI coverage`\n+- `### 2. Add factorial and operation dispatch`\n+\n+The resolved validation decision is that the only canonical acceptance command is `pwsh -NoLogo -NoProfile -File ./eng/test-math-tool.ps1`. The existing pull-request workflow `.github/workflows/shepherd-task-math-tool.yml` installs exactly Pester 5.7.1 and calls that repository-owned runner. Do not replace, bypass, or duplicate the runner.\n+\n+The resolved behavior decision is that direct CLI execution writes exactly one result line to stdout: `Fibonacci(N) = value` or `Factorial(N) = value`. Functions return only numeric values with no incidental output. Inputs are non-negative integers. The implementation and test files remain the repository-root `math-tool.ps1` and `math-tool.Tests.ps1`. Fibonacci behavior delivered by task 1 is a compatibility contract and must be preserved.\n+\n+Research for this campaign established those validation, output, purity, input, file-location, backward-compatibility, and serial-ordering constraints. There is no separate spike implementation to reuse. Implement production behavior and tests from the specification and repository conventions; do not copy or adapt research artifact code.\n+\n+## Branch and execution order\n+\n+Use `experiment/shepherd-control` from remote `origin` as the base branch for this task. This is task 2 of 2. The tasks are assigned, completed, and merged serially in the order listed in the plan. Do not begin work until this issue is assigned to you and task 1 has been merged into `experiment/shepherd-control`.\n+\n+Start from the base branch containing the merged task 1 implementation. Keep the pull request targeted to this issue and target `experiment/shepherd-control`.\n+\n+## Implement\n+\n+Extend the existing repository-root `math-tool.ps1` with:\n+\n+- A pure `Get-Factorial` function that returns the factorial as a numeric value and emits no progress, labels, diagnostics, or other incidental pipeline output.\n+- An `Operation` parameter that dispatches between `fibonacci` and `factorial` while retaining the existing `N` parameter.\n+- Direct-execution formatting that writes exactly `Fibonacci(N) = value` for the Fibonacci operation and exactly `Factorial(N) = value` for the factorial operation.\n+- Correct factorial behavior for the edge cases `N=0` and `N=1` and for at least one small representative value greater than 1.\n+- Full preservation of the Fibonacci calculation and CLI behavior established by task 1.\n+\n+Extend the existing repository-root `math-tool.Tests.ps1` to cover the combined behavior. Keep the interface and tests objective and small; choose the cleanest extension of the existing Pester structure rather than introducing a second test harness.\n+\n+## Completion gates\n+\n+Before declaring the task complete:\n+\n+- Run `pwsh -NoLogo -NoProfile -File ./eng/test-math-tool.ps1` and require exit code zero for the combined regression suite.\n+- Confirm the pinned Pester suite still passes every task 1 Fibonacci unit and isolated CLI case without weakening or deleting those assertions.\n+- Add numeric unit assertions for `Get-Factorial` at `N=0`, `N=1`, and a small representative value greater than 1; these assertions must detect incidental pipeline output.\n+- Add isolated child-`pwsh` process coverage for both operation values and require exit code zero.\n+- For each covered CLI case, verify exactly one nonblank stdout line and compare the complete line against the required operation-specific format.\n+- Include a dispatch discrimination test using the same `N` with both operations where Fibonacci and factorial yield different values, so swapped or ignored dispatch cannot pass.\n+- Verify operation names produce the exact capitalization in the output labels while accepting the interface values prescribed by the plan (`fibonacci` and `factorial`).\n+- Verify the pull-request CI workflow remains unchanged and passes with Pester 5.7.1 through the repository-owned runner.\n+- Confirm the pull request has no changes outside `math-tool.ps1` and `math-tool.Tests.ps1`.\n+\n+## Out of scope\n+\n+- Replacing or modifying the canonical test runner, workflow, or pinned Pester version.\n+- Renaming the existing `N` parameter or changing the established Fibonacci calculation/output contract.\n+- Adding operations other than `fibonacci` and `factorial`.\n+- Adding dependencies, modules, generated artifacts, or unrelated repository cleanup.\n+- Broad input-policy work beyond the plan's non-negative integer contract.\n*** End Patch\n"
```

</details>

```
Added 2 file(s): /home/edburns/workareas/dd-3068633-linux-x64-01-shepherd-control/1-math-control-remove-before-merge/prompts/shepherd-task-20-20260923-2319/issue-bodies/01-1-implement-fibonacci-body.md, /home/edburns/workareas/dd-3068633-linux-x64-01-shepherd-control/1-math-control-remove-before-merge/prompts/shepherd-task-20-20260923-2319/issue-bodies/02-2-add-factorial-dispatch-body.md
```


---

<sub>53s</sub>

### `bash`

**Validate persisted issue drafts**

$ set -o pipefail
/home/edburns/.copilot/plugins/shepherd-task/scripts/validate-stage20-drafts.sh "/home/edburns/workareas/dd-3068633-linux-x64-01-shepherd-control/1-math-control-remove-before-merge/prompts/shepherd-task-20-20260923-2319/issue-bodies" 2 off && printf '%s\n' 'draft_validation=passed' && for f in /home/edburns/workareas/dd-3068633-linux-x64-01-shepherd-control/1-math-control-remove-before-merge/prompts/shepherd-task-20-20260923-2319/issue-bodies/*-body.md; do printf '%s lines=%s bytes=%s first=%s\n' "$f" "$(wc -l < "$f")" "$(wc -c < "$f")" "$(awk 'NF {print; exit}' "$f")"; done

```
draft_validation=passed
/home/edburns/workareas/dd-3068633-linux-x64-01-shepherd-control/1-math-control-remove-before-merge/prompts/shepherd-task-20-20260923-2319/issue-bodies/01-1-implement-fibonacci-body.md lines=59 bytes=4453 first=## Campaign context and required reading
/home/edburns/workareas/dd-3068633-linux-x64-01-shepherd-control/1-math-control-remove-before-merge/prompts/shepherd-task-20-20260923-2319/issue-bodies/02-2-add-factorial-dispatch-body.md lines=58 bytes=5071 first=## Campaign context and required reading
<shellId: 2 completed with exit code 0>
```


---

<sub>1m 1s</sub>

### Copilot

Both persisted drafts pass the required physical-Markdown validator. I’m beginning the one-shot mutation now: each issue will be created, body-verified through the supplied REST verifier, linked, and durably ledgered before moving to the next.

---

<sub>1m 26s</sub>

### `bash`

**Create and verify ordered child issues**

$ set -uo pipefail
REPO='edburns/dd-3068633-linux-x64-01'
PARENT_ISSUE=1
LOG_DIRECTORY='/home/edburns/workareas/dd-3068633-linux-x64-01-shepherd-control/1-math-control-remove-before-merge/prompts/shepherd-task-20-20260923-2319'
VERIFIER='/home/edburns/.copilot/plugins/shepherd-task/scripts/verify-github-issue-body.sh'
LEDGER="$LOG_DIRECTORY/creation-ledger.json"
RESULT="$LOG_DIRECTORY/stage-20-result.json"

atomic_write() {
  local path="$1" content="$2" temp
  temp="$(mktemp "$(dirname "$path")/.stage20.XXXXXX")" || return 1
  printf '%s\n' "$content" >"$temp" || { rm -f "$temp"; return 1; }
  mv "$temp" "$path"
}

update_ledger_flag() {
  local number="$1" field="$2" value="$3" updated
  updated="$(
    jq \
      --argjson number "$number" \
      --arg field "$field" \
      --argjson value "$value" \
      'map(if .number == $number then .[$field] = $value else . end)' \
      "$LEDGER"
  )" || return 1
  atomic_write "$LEDGER" "$updated"
}

fail_stage() {
  local operation="$1" error="$2" children_output children_flat reconciled
  if children_output="$(gh api "repos/$REPO/issues/$PARENT_ISSUE/sub_issues" --paginate --slurp 2>&1)"; then
    if children_flat="$(printf '%s' "$children_output" | jq 'if length == 0 then [] elif all(.[]; type == "array") then add else . end')"; then
      reconciled="$(jq --argjson children "$children_flat" 'map(. as $entry | .linked = ([$children[] | select(.id == $entry.id)] | length == 1))' "$LEDGER")" && atomic_write "$LEDGER" "$reconciled"
    else
      error="$error; reconciliation normalization failed"
    fi
  else
    error="$error; reconciliation query failed: $children_output"
  fi
  atomic_write "$RESULT" "$(jq -n --arg error "$operation: $error" '{schemaVersion:1,status:"failed",ledgerFile:"creation-ledger.json",operationError:$error}')"
  printf 'FAILED OPERATION: %s\nERROR: %s\nCREATION LEDGER:\n' "$operation" "$error" >&2
  jq -r '.[] | "#\(.number) | \(.title) | \(.url) | \(.bodyFile) | body_verified=\(.body_verified) | linked=\(.linked)"' "$LEDGER" >&2
  if [[ "$(jq 'length' "$LEDGER")" -eq 0 ]]; then
    printf 'No issues were created; no cleanup is required.\n' >&2
  else
    printf 'CLEANUP COMMANDS:\n' >&2
    jq -r --arg repo "$REPO" '.[] | "gh issue delete \(.number) --repo \"\($repo)\" --yes"' "$LEDGER" >&2
    printf 'The operation did not complete. No automatic rollback was performed. Delete every issue in the ledger before invoking this skill again.\n' >&2
  fi
  exit 1
}

baseline_output="$(gh api "repos/$REPO/issues/$PARENT_ISSUE/sub_issues" --paginate --slurp 2>&1)" || { printf '%s\n' "$baseline_output" >&2; exit 1; }
baseline_flat="$(printf '%s' "$baseline_output" | jq 'if length == 0 then [] elif all(.[]; type == "array") then add else . end')" || { printf 'Unable to normalize baseline children.\n' >&2; exit 1; }

atomic_write "$LEDGER" '[]' || exit 1
atomic_write "$RESULT" '{"schemaVersion":1,"status":"in_progress","ledgerFile":"creation-ledger.json","operationError":null}' || exit 1

create_one() {
  local subsection="$1" title="$2" body_file="$3" create_json id number url ledger_updated issue_json link_error='' linked_ok=false attempt
  create_json="$(gh api "repos/$REPO/issues" -X POST -f title="$title" -F "body=@$body_file" --jq '{id,number,node_id,html_url,title}' 2>&1)" || fail_stage 'create issue' "$create_json"
  id="$(jq -er '.id' <<<"$create_json")" || fail_stage 'parse created issue' "$create_json"
  number="$(jq -er '.number' <<<"$create_json")" || fail_stage 'parse created issue' "$create_json"
  url="$(jq -er '.html_url' <<<"$create_json")" || fail_stage 'parse created issue' "$create_json"
  ledger_updated="$(jq \
    --arg subsection "$subsection" \
    --arg bodyFile "issue-bodies/$(basename "$body_file")" \
    --argjson id "$id" \
    --argjson number "$number" \
    --arg title "$title" \
    --arg url "$url" \
    '. + [{implementationSubsection:$subsection,bodyFile:$bodyFile,id:$id,number:$number,title:$title,url:$url,body_verified:false,linked:false}]' \
    "$LEDGER")" || fail_stage 'append creation ledger' "failed for issue #$number"
  atomic_write "$LEDGER" "$ledger_updated" || fail_stage 'persist creation ledger' "failed for issue #$number"

  issue_json="$("$VERIFIER" "$REPO" "$number" "$body_file" 6 5 "$LOG_DIRECTORY/issue-$number-body-verification-failure.json" 2>&1)" || fail_stage 'verify created issue body' "$issue_json"
  update_ledger_flag "$number" body_verified true || fail_stage 'persist body verification' "failed for issue #$number"

  for attempt in 1 2 3; do
    if printf '{"sub_issue_id": %s}' "$id" | gh api "repos/$REPO/issues/$PARENT_ISSUE/sub_issues" -X POST --input - >/dev/null 2>"$LOG_DIRECTORY/.link-error"; then
      linked_ok=true
      break
    fi
    link_error="$(cat "$LOG_DIRECTORY/.link-error")"
  done
  rm -f "$LOG_DIRECTORY/.link-error"
  [[ "$linked_ok" == true ]] || fail_stage 'link child issue' "issue #$number after 3 attempts: $link_error"
  update_ledger_flag "$number" linked true || fail_stage 'persist linked status' "failed for issue #$number"
  printf 'created_and_linked #%s %s\n' "$number" "$url"
}

create_one \
  '1. Implement Fibonacci with unit and isolated CLI coverage' \
  '1. Implement Fibonacci with unit and isolated CLI coverage' \
  "$LOG_DIRECTORY/issue-bodies/01-1-implement-fibonacci-body.md"
create_one \
  '2. Add factorial and operation dispatch' \
  '2. Add factorial and operation dispatch' \
  "$LOG_DIRECTORY/issue-bodies/02-2-add-factorial-dispatch-body.md"

final_output="$(gh api "repos/$REPO/issues/$PARENT_ISSUE/sub_issues" --paginate --slurp 2>&1)" || fail_stage 'query final children' "$final_output"
final_flat="$(printf '%s' "$final_output" | jq 'if length == 0 then [] elif all(.[]; type == "array") then add else . end')" || fail_stage 'normalize final children' 'jq normalization failed'
baseline_count="$(jq 'length' <<<"$baseline_flat")"
ledger_count="$(jq 'length' "$LEDGER")"
final_count="$(jq 'length' <<<"$final_flat")"
[[ "$final_count" -eq $((baseline_count + ledger_count)) ]] || fail_stage 'verify child count' "baseline=$baseline_count ledger=$ledger_count final=$final_count"
new_children="$(jq -n --argjson baseline "$baseline_flat" --argjson final "$final_flat" '$final | map(select(.id as $id | ($baseline | map(.id) | index($id) | not)))')" || fail_stage 'derive new children' 'jq failed'
expected_ids="$(jq '[.[].id]' "$LEDGER")"
actual_ids="$(jq '[.[].id]' <<<"$new_children")"
[[ "$expected_ids" == "$actual_ids" ]] || fail_stage 'verify child order' "expected IDs $expected_ids; actual IDs $actual_ids"

while IFS= read -r entry; do
  number="$(jq -r '.number' <<<"$entry")"
  body_rel="$(jq -r '.bodyFile' <<<"$entry")"
  issue_json="$("$VERIFIER" "$REPO" "$number" "$LOG_DIRECTORY/$body_rel" 6 5 "$LOG_DIRECTORY/issue-$number-final-body-verification-failure.json" 2>&1)" || fail_stage 'verify final issue body' "$issue_json"
  jq -e '.state == "open" and (.assignees | type == "array" and length == 0)' <<<"$issue_json" >/dev/null || fail_stage 'verify issue state and assignees' "issue #$number is not open and unassigned"
  occurrences="$(jq --argjson id "$(jq '.id' <<<"$entry")" '[.[] | select(.id == $id)] | length' <<<"$final_flat")"
  [[ "$occurrences" -eq 1 ]] || fail_stage 'verify unique child link' "issue #$number occurs $occurrences times"
done < <(jq -c '.[]' "$LEDGER")

atomic_write "$RESULT" '{"schemaVersion":1,"status":"complete","ledgerFile":"creation-ledger.json","operationError":null}' || fail_stage 'write complete stage result' 'atomic write failed'
printf 'stage20_complete\n'
jq '.' "$LEDGER"


<details>
<summary>26 lines</summary>

```
created_and_linked #2 https://github.com/edburns/dd-3068633-linux-x64-01/issues/2
created_and_linked #3 https://github.com/edburns/dd-3068633-linux-x64-01/issues/3
stage20_complete
[
  {
    "implementationSubsection": "1. Implement Fibonacci with unit and isolated CLI coverage",
    "bodyFile": "issue-bodies/01-1-implement-fibonacci-body.md",
    "id": 5560740530,
    "number": 2,
    "title": "1. Implement Fibonacci with unit and isolated CLI coverage",
    "url": "https://github.com/edburns/dd-3068633-linux-x64-01/issues/2",
    "body_verified": true,
    "linked": true
  },
  {
    "implementationSubsection": "2. Add factorial and operation dispatch",
    "bodyFile": "issue-bodies/02-2-add-factorial-dispatch-body.md",
    "id": 5560740734,
    "number": 3,
    "title": "2. Add factorial and operation dispatch",
    "url": "https://github.com/edburns/dd-3068633-linux-x64-01/issues/3",
    "body_verified": true,
    "linked": true
  }
]
<shellId: 3 completed with exit code 0>
```

</details>


---

<sub>1m 29s</sub>

### Copilot

Created and verified 2 ordered, unassigned child issues under #1. Both were created **without an issue type** because the repository is user-owned.

| Implementation subsection | Issue | Title | URL |
|---|---:|---|---|
| 1 | #2 | Implement Fibonacci with unit and isolated CLI coverage | https://github.com/edburns/dd-3068633-linux-x64-01/issues/2 |
| 2 | #3 | Add factorial and operation dispatch | https://github.com/edburns/dd-3068633-linux-x64-01/issues/3 |

**Ordered child list:** `2,3`

**Suggested stage 25 invocation:** Invoke `shepherd-task-25-given-list` with repository `edburns/dd-3068633-linux-x64-01`, base branch `experiment/shepherd-control`, ordered issues `2,3`, and plan directory `1-math-control-remove-before-merge`. Campaign lesson propagation will be derived from the manifest.

---

<sub>Generated by [GitHub Copilot CLI](https://github.com/features/copilot/cli)</sub>
