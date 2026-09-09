<a id="top"></a>
<h1 align="center">Testing your policies</h1>

### 1. Run the one command

    python3 scripts/check_resource.py

On your `Service/...` branch this runs **everything CI will run**, in the same order, and tells
you which check failed:

| # | Check | What it means |
|---|-------|---------------|
| 1 | Branch name | your branch follows the naming convention |
| 2 | Branch scope | you have not changed files outside your own resource |
| 3 | Lint | the trees reconcile and your policy content is sound — failing only on what *you* changed |
| 4 | Doc completeness | every argument has a real `true`/`false` `security_impact` and a rationale |
| 5 | True-arg coverage | every `security_impact: true` argument has both a policy and a fixture |
| 6 | OPA test | `terraform plan` + `opa eval` — your compliant fixture passes, your non-compliant one fails |

If it prints `[OK] <resource>: every check passed`, CI will agree. **Run it before every push.**

The `pre-commit` hooks run these for you on every commit, but only as far as the commit reaches:
a commit that touches nothing under your resource skips checks 4-6, a docs-only commit skips
check 6, and a fixture you have just edited skips it as well — building its plan means running
`terraform`, which is not something a git hook should do to you. **This command is the one that
tells you everything is green**, so run it before every push.

![linters-output](images/linters-output.PNG)

### 2. Running the pieces on their own

You do not need these day to day — check 3 and check 6 above run them for you — but they are
useful when you are chasing one specific failure.

The linter validates that the `docs/`, `inputs/`, and `policies/` trees reconcile and that your
fixtures are well-formed:

    python3 scripts/linters/linter.py --platform gcp

`auto_test.py` runs the full `terraform plan` → `opa eval` flow for you: it plans each fixture
(using a committed plan cache and an offline provider cache), then evaluates your policy against
the compliant and non-compliant fixtures.

    # One resource:
    python3 scripts/auto_test/auto_test.py "gcp/<Service>/<resource>"

    # The whole service:
    python3 scripts/auto_test/auto_test.py "gcp/<Service>"

    # The whole platform:
    python3 scripts/auto_test/auto_test.py gcp

A passing run means the compliant fixture produces no violation and the non-compliant fixture
does. Fix any failures and re-run until the resource is green.

> The first run builds an offline provider cache under `.terraform-cache/` (one-time per
> machine, a few minutes). See the repo `README.md` → **Testing Your Policies Locally** for
> the full details, prerequisites, and the plan-cache workflow.

<div align="center">

if you are having trouble with this section please return to [Common Errors](common-errors.md)

</div>

<div align="center">

[⬅️ Previous: policy.rego](policy-rego.md#top) &nbsp;&nbsp;&nbsp; | &nbsp;&nbsp;&nbsp;
[📘 Back to Contents](policy-writing-tutorial.md#top) &nbsp;&nbsp;&nbsp; | &nbsp;&nbsp;&nbsp;
[Next: policy_lint — content-quality rules ➡️](policy-lint.md#top) 

</div>
