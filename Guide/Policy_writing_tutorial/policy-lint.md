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

Exit code is `1` when any **error**-severity finding is reported and `0` otherwise — warnings
never fail a run on their own. Exit code `2` means the *target* was wrong: a platform, service
folder or resource type spelled in a way that doesn't exist in the tree. That is a typo in your
command, not a finding about your policy — check the spelling (service folders have spaces and
capitals, e.g. `"gcp/Cloud Storage/google_storage_bucket"`) and run it again.

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
first element of an array and silently ignores the rest. Drop the index and check the whole
list instead — with which `policy_type` depends on which way round the check goes:

- **Allowing a list** — plain **`whitelist`** already handles it. Given an array value it
  requires *every* element to be in your `values` set, so `["allowed_ips"]` under a `whitelist`
  is a complete check. There is **no `element whitelist`**; do not reach for one.
- **Forbidding a list** — use **`element blacklist`**. A plain `blacklist` compares the whole
  array against your `values`, which is almost never what you want, and forbidden things
  usually appear *inside* an element (`"*.googleapis.com"` contains `"*"`) rather than as the
  whole element. `element blacklist` does that substring match per element.

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
nothing but whether the attribute is set at all.

**This is a warning, and it does not fail your build.** Sometimes presence really is the control
(e.g. "an override must not be configured at all"), and sometimes it is a check that gave up
halfway. Which one it is depends on what the argument's `rationale` in `docs/` says the risk is —
a judgement the reviewer makes when reading your policy, not something the linter can settle. So
write the rationale honestly and expect to be asked about it: the finding is surfaced to whoever
reviews the resource, and a clear rationale is what turns it from a question into a decision.

Where the attribute has a *shape* — a prefix, a project path, an approved value — pair the
presence check with a pattern instead. That is a stronger policy in every case.

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
The whole point of the pair is to isolate a single variable: if two things differ and the policy
flags the non-compliant resource, you cannot tell which of the two the policy actually caught.
Fix it by making every other attribute identical between the two files.

Bad — `public_access_prevention.rego`, but `storage_class` moved too:

    # compliant.tf
    resource "google_storage_bucket" "compliant_example_1" {
      name                     = "compliant_example_1"
      location                 = "AU"
      storage_class            = "STANDARD"
      public_access_prevention = "enforced"
    }

    # nonCompliant.tf
    resource "google_storage_bucket" "non_compliant_example_1" {
      name                     = "non_compliant_example_1"
      location                 = "AU"
      storage_class            = "NEARLINE"     # <- unrelated to the policy
      public_access_prevention = "inherited"
    }

Good — only the tested argument differs:

    # nonCompliant.tf
    resource "google_storage_bucket" "non_compliant_example_1" {
      name                     = "non_compliant_example_1"
      location                 = "AU"
      storage_class            = "STANDARD"
      public_access_prevention = "inherited"
    }

Every example is compared, including one that has no same-numbered counterpart on the other
side: an example without a numbered twin is compared against the **lowest-numbered** example
opposite it. Adding a third non-compliant example therefore does not exempt it from this rule.

These keys are expected to differ and are never reported:

- `name` — the example's own label.
- `labels`, and the provider-computed mirrors `effective_labels` and `terraform_labels`, which
  always move with it.
- the argument under test (for a nested argument, its top-level block).
- the attribute named by `resource_value_name` in `_vars.rego` — **but only when it holds the
  example label itself** (`bucket = "compliant_example_1"`). Two genuinely different values there
  (`bucket = "prod-data-bucket"` vs `"dev-scratch-bucket"`) are drift like any other.

## fixture-one-sided

Your fixture has examples on one side only: no `compliant_example_N` at all, or no
`non_compliant_example_N` at all.

That is the one fixture shape the harness cannot say anything about. It checks two things across
your examples — every `non_compliant_example_N` **must** be flagged, and no `compliant_example_N`
may be. With no non-compliant example there is nothing that has to be flagged, so a policy that
matches nothing passes. With no compliant example there is nothing that has to stay unflagged, so
a policy that flags everything passes. Either way the harness goes green and your policy is
untested.

Add the missing side — one example is enough — and run the harness again.

**You do not need the same number of each.** The harness matches examples by their *label*, not by
their number: a `non_compliant_example_3` with no `compliant_example_3` is evaluated exactly like
every other non-compliant example. One compliant baseline tested against several non-compliant
examples, each breaking the rule a different way, is a good fixture — several resource types in
this repo are written that way deliberately, and none of them is a finding.

Numbering is still required — sequential from 1, checked by `linter.py` — but
the two files are numbered independently of each other:

    # compliant.tf                        # nonCompliant.tf
    ..."compliant_example_1" { ... }      ..."non_compliant_example_1" { ... }   # not set
                                          ..."non_compliant_example_2" { ... }   # wrong value
                                          ..."non_compliant_example_3" { ... }   # wrong shape

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

## repeated-helper-call

The same helper is called twice with the same arguments, so the same work is done twice. The
usual shape is `message` and `details` each writing the `helpers.get_multi_summary(...)` call out
again — OPA then evaluates the whole `conditions` list once per field. Call it once, give the
result a name, and read the fields off that name.

**This one fails the build.** Only the files your branch changed are checked, so an older policy
elsewhere in the tree is never held against you — but a file you touch has to be clean.

Bad:

    message := helpers.get_multi_summary(conditions, vars.variables).message
    details := helpers.get_multi_summary(conditions, vars.variables).details

Good:

    result := helpers.get_multi_summary(conditions, vars.variables)

    message := result.message
    details := result.details

`result` is the name most of the tree already uses, so prefer it unless the file has a reason not
to. The rule is not specific to `get_multi_summary` — any helper called twice with identical
arguments is reported, including inside a single rule body.

Two calls with **different** arguments are never flagged: they compute different things, and
there is nothing to share.

    result := helpers.get_multi_summary(conditions, vars.variables)         # not flagged —
    other  := helpers.get_multi_summary(other_conditions, vars.variables)   # different arguments

Neither are two identical calls that sit in different rules over each rule's own local variables
(a function parameter, a comprehension variable). The text matches, but the values do not, so
there is nothing to hoist:

    _first_value(resource, attribute_path) := shared.get_attribute_value(resource, attribute_path)
    _second_value(resource, attribute_path) := shared.get_attribute_value(resource, attribute_path)

## lint-error

The linter could not evaluate this policy at all — the file failed to parse, or it declares no
`conditions` list for the linter to read. Every other rule needs those conditions, so this
finding means the policy was **not checked**, not that it passed.

The message carries the reason OPA gave. Run `opa check` on the file to see it in full:

    opa check policies/_helpers "policies/gcp/<Service>/<resource type>/<argument>.rego"

Fix the parse error (or add the missing `conditions := [...]`) and re-run the linter. If the file
looks fine to you and the error persists, ask in the unit channel before changing anything else —
this one is usually a stray bracket or a missing `:=`, and it is much easier to spot with a
second pair of eyes than to guess at.

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
against you, exactly like the structural linter on the previous page.

Nor are the pre-existing findings **inside** a file you touched. The PR lint job lints the
resource types your change reaches twice — once on your branch, once on the base branch you
started from — and fails only on findings that are not in the base result. So editing one
argument in a resource type somebody else left messy does not hand you their backlog, and a
change that *removes* findings can never fail. What you touched but did not break is printed
under a `[NOTE]` line, so you can still see the file has known problems:

    [NOTE] 3 pre-existing policy_lint error(s) in the file(s) you touched — not attributed
    to you: hard-coded-value x2, index-path x1

A finding counts as yours when its `(rule, service, resource type, argument)` appears more times
on your branch than on the base — so introducing a *second* hard-coded value into a file that
already had one does fail, and re-wording the message of an existing one does not.

<div align="center">

[⬅️ Previous: Testing your policies](testing-policies.md#top) &nbsp;&nbsp;&nbsp; | &nbsp;&nbsp;&nbsp;
[📘 Back to Contents](policy-writing-tutorial.md#top) &nbsp;&nbsp;&nbsp; | &nbsp;&nbsp;&nbsp;
[Next: branch_scope — stay inside your own resource ➡️](branch-scope.md#top)

</div>
