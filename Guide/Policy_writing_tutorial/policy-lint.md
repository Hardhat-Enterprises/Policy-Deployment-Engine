<a id="top"></a>
<h1 align="center">policy_lint — content-quality rules</h1>

> `linter.py` (the previous page) checks that `docs/`, `inputs/` and `policies/` **reconcile** —
> every documented argument has a policy, a fixture pair, and the right file names. It says
> nothing about whether the policy you wrote is any good. **`policy_lint.py`** reads the
> `conditions` you declared in your `<argument>.rego` and the `variables` in your `_vars.rego`,
> and reports the smells a reviewer would otherwise have to find by hand — a hard-coded project
> id, a check that only tests presence, a fixture pair that drifted, and so on.

Every rule below has a stable id, so a finding can be quoted, fixed, and the id searched for in
this page.

---

## How to run it

    # One resource
    python3 scripts/linters/policy_lint.py "gcp/<Service>/<resource type>"

    # The whole service
    python3 scripts/linters/policy_lint.py "gcp/<Service>"

    # The whole platform
    python3 scripts/linters/policy_lint.py gcp

    # Machine-readable output
    python3 scripts/linters/policy_lint.py --json "gcp/<Service>/<resource type>"

    # Every rule id and its one-liner
    python3 scripts/linters/policy_lint.py --list-rules

Exit code is `1` when any **error**-severity finding is reported, `0` otherwise — warnings never
fail a run on their own.

You do not need to run it separately as part of your normal workflow: `pre-commit` and the PR
lint job (`run_precommit_linter.py`) both run it automatically, scoped to the resource type(s)
your changed files belong to. See [Testing your policies](testing-policies.md#top) for the rest
of the local test loop.

---

## The rules

Each rule below is its own anchored section (`policy-lint.md#<rule-id>`) — the portal links a
finding straight to it.

## hard-coded-value

A value in `values` is a team-specific literal (project id, email address, bucket/key/folder
URI, org/folder id). These belong to whoever deploys the policy, not to the policy itself —
hard-coding one means the policy only ever passes for your project. Use a `projects/*` pattern
(or a structural check) instead. Location values (`location`, `region`, `zone`, ...) are exempt —
naming a specific location is usually the point of that argument.

Bad:

    {
      "attribute_path": ["labels", "owner"],
      "values": ["projects/my-real-project/locations/us"],
      "policy_type": "whitelist"
    }

Good:

    {
      "attribute_path": ["labels", "owner"],
      "values": ["projects/*/locations/*"],
      "policy_type": "pattern whitelist"
    }

## index-path

`attribute_path` ends in a bare list index (e.g. `["allowed_ips", 0]`). That checks only the
first element of an array and silently ignores the rest — use `element blacklist` (or
`element whitelist`) to check the whole list instead.

Bad:

    {
      "attribute_path": ["allowed_ips", 0],
      "values": ["0.0.0.0/0"],
      "policy_type": "blacklist"
    }

Good:

    {
      "attribute_path": ["allowed_ips"],
      "values": ["0.0.0.0/0"],
      "policy_type": "element blacklist"
    }

A path that only passes *through* an index (e.g. `["rsa", 0, "key"]`) is fine — this rule only
looks at the **last** segment.

## presence-only

`values` is only `null`/`""` under a `blacklist`/`whitelist` `policy_type`: the check tests
nothing but whether the attribute is set at all. That's sometimes genuinely the intent (e.g. "an
override must not be configured") — pair it with a real pattern where you can, or say why
presence alone is the right check in the argument's `rationale` in `docs/`.

Bad:

    {
      "condition": "override is set",
      "attribute_path": ["override"],
      "values": [null],
      "policy_type": "blacklist"
    }

Good — paired with a pattern:

    {
      "condition": "override is set to something other than the approved value",
      "attribute_path": ["override"],
      "values": ["approved-*", [["approved-", "*"]]],
      "policy_type": "pattern blacklist"
    }

## wrong-argument

No condition in `<argument>.rego` reads the argument the file is named after — usually a
copy-paste from another resource's policy where the `attribute_path` never got updated.
`policy_lint` checks each condition group's `attribute_path` against the filename stem, so
`location.rego` must contain at least one condition whose path starts with `location`.

Bad — file is `location.rego`, but the condition reads `region`:

    {
      "attribute_path": ["region"],
      "values": ["australia-southeast1"],
      "policy_type": "whitelist"
    }

Good:

    {
      "attribute_path": ["location"],
      "values": ["australia-southeast1"],
      "policy_type": "whitelist"
    }

## fixture-drift

`compliant.tf` and `nonCompliant.tf` differ on an attribute **other than** the one under test.
The whole point of the pair is to isolate a single variable; drift on anything else means the
test isn't proving what you think it's proving (or the pipeline computed a plan diff that means
something else entirely). Fix it by making every other attribute identical between the two
files — only the tested argument (and expected provider-computed mirrors like `labels`) should
differ.

## fixture-missing-plan

There's no committed plan cache for this fixture pair at `inputs/plan_cache/gcp/<sha>.json`. Run
the test harness locally and commit what it produces:

    python3 scripts/auto_test/auto_test.py "gcp/<Service>/<resource type>"
    git add inputs/plan_cache/

See [Testing your policies](testing-policies.md#top) for the full local test loop.

## vars-resource-type

`_vars.rego`'s `resource_type` doesn't match the directory it lives in. The pipeline matches a
planned Terraform resource to a policy set by exact `resource_type` string — get this wrong and
your policy never runs against anything, and every fixture test passes for the wrong reason (no
resource ever matched).

Bad — directory is `google_bigquery_dataset/`, but:

    variables := {
        "friendly_resource_name": "BigQuery Dataset",
        "resource_type": "google_bigquery_table",
        "resource_value_name": "dataset_id"
    }

Good:

    variables := {
        "friendly_resource_name": "BigQuery Dataset",
        "resource_type": "google_bigquery_dataset",
        "resource_value_name": "dataset_id"
    }

## vars-friendly-name

`friendly_resource_name` is empty, is literally the raw Terraform type (not the name a human
would say), or is already used by a different resource type elsewhere in the platform (violation
messages would then be ambiguous about which resource they're about).

Bad:

    "friendly_resource_name": "google_bigquery_dataset"   # same as resource_type

Good:

    "friendly_resource_name": "BigQuery Dataset"

## trivial-message

`situation_description` is under 20 characters, or `remedies` is empty. Both are shown to the
person whose Terraform failed the policy — a description like `"Bad config"` or an empty
`remedies` list tells them nothing about what to fix.

Bad:

    {"situation_description": "Bad config", "remedies": []}

Good:

    {
      "situation_description": "Dataset location is not the approved region",
      "remedies": ["Set location to australia-southeast1"]
    }

## legacy-assign

`message`, `details` or `summary` assigned with `=` instead of `:=`. Both work in Rego, but `:=`
is the convention this codebase uses everywhere else — a warning only, it never fails a build.

Bad: `message = helpers.get_multi_summary(conditions, vars.variables).message`

Good: `message := helpers.get_multi_summary(conditions, vars.variables).message`

## package-case

The package's service segment isn't lowercase `snake_case`. This is advisory only — plenty of
existing packages use the service folder name verbatim (e.g. `BigQuery`), which this rule flags
but never blocks on.

    package terraform.gcp.security.BigQuery.google_bigquery_dataset.location   # flagged (warn)
    package terraform.gcp.security.big_query.google_bigquery_dataset.location  # preferred

---

## Your branch must not modify the shared harness or linter

`scripts/**` and `policies/_helpers/**` are the shared test harness, linter and Rego helper
library every resource's policy runs against. When the portal scans your branch, it pulls
**those two paths from `dev`**, not from your branch — so editing them locally does nothing to
what the portal actually checks you against, and can make your local run diverge from what CI
sees.

If the portal reports `linter-out-of-date` or `harness-out-of-date`, your branch is behind `dev`
on one of those paths. Fix it by merging `dev` in, not by hand-editing the harness:

    git fetch origin dev
    git merge origin/dev

If you believe the harness or linter itself needs to change (a missing rule, a bug in
`policy_lint.py`), raise it with a senior team member rather than editing it on a resource
branch.

---

## The whole-tree report is for maintainers, not for you

CI also runs `policy_lint.py` over **every** documented `gcp` resource on every push to `dev`
(`Policy lint (whole tree, report only)` in the `ALL` workflow) and publishes the JSON as a build
artifact. That run is `continue-on-error` and exists so maintainers can track the repo-wide
backlog over time — it is not a gate. Pre-existing findings elsewhere on `dev` are never held
against you: your PR only fails on findings inside the `.rego` file (or fixture pair) **you**
changed, exactly like the structural linter on the previous page.

<div align="center">

[⬅️ Previous: Testing your policies](testing-policies.md#top) &nbsp;&nbsp;&nbsp; | &nbsp;&nbsp;&nbsp;
[📘 Back to Contents](policy-writing-tutorial.md#top) &nbsp;&nbsp;&nbsp; | &nbsp;&nbsp;&nbsp;
[Next: Raising a pull request ➡️](raising-pull-request.md#top)

</div>
