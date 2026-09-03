<a id="top"></a>
<h1 align="center">branch_scope — stay inside your own resource</h1>

> The previous two pages check the files you *meant* to change. This one checks the files you
> **didn't** mean to change. Your branch is named
> `Service/<platform>/<service_slug>/<resource_type>`, and that name says exactly which resource
> you are working on — so it also says exactly which files are yours. Anything else in the repo
> belongs to another contributor or is shared by everybody, and `branch_scope.py` fails your PR
> if your branch touches it.

Every rule below has a stable id, so a finding can be quoted, fixed, and the id searched for in
this page.

---

## What your branch owns

For a branch named `Service/gcp/cloud_storage/google_storage_bucket`, these are yours:

| Path | What it is | Allowed |
|---|---|---|
| `docs/gcp/Cloud Storage/google_storage_bucket.json` | your documentation | add or edit |
| `inputs/gcp/Cloud Storage/google_storage_bucket/**` | your `compliant.tf` / `config.tf` / `nonCompliant.tf`, and the `<sha>.json` plan the harness writes beside them | add or edit |
| `policies/gcp/Cloud Storage/google_storage_bucket/**` | your `_vars.rego` and `<argument>.rego` | add or edit |

Nothing else. Not another resource type in your own service folder, not the shared harness, not
the workflow files, and **no deletions anywhere** — not even inside your own folder. The one
exception is a `<sha>.json` plan inside your own fixtures: editing a fixture changes its sha, so
the harness deletes the plan of the old version as it writes the new one. Commit that deletion
along with the new file.

Note that the service in the branch name is a **slug**: docs folder names contain spaces and
brackets that are illegal in a git branch name, so `docs/gcp/Cloud Run (v2 API)/` is written
`cloud_run_v2_api` in the branch. The check resolves the slug back to the real folder for you —
you never have to spell the folder name in the branch.

---

## How to run it

    # Check what you are about to commit (this is what the pre-commit hook runs)
    python3 scripts/linters/branch_scope.py --staged

    # Check everything your branch has changed so far, against dev
    python3 scripts/linters/branch_scope.py --base origin/dev

    # Machine-readable output
    python3 scripts/linters/branch_scope.py --json

    # Every rule id and its one-liner
    python3 scripts/linters/branch_scope.py --list-rules

Exit code is `1` when the branch changed something outside its scope and `0` when it is clean —
or when you are not on a `Service/` branch at all, since `feature/` branches are not scoped this
way. Exit code `2` means the check could not run: usually the service slug in your branch name
doesn't match any docs folder, which is a **branch-name** problem —
`python3 scripts/linters/check_branch_name.py` explains that one properly.

You do not need to run it by hand. `pre-commit` runs it on every commit, and the `Branch scope`
job runs it on every pull request from a `Service/` branch.

**Only your own changes are counted.** The comparison starts from the point where your branch
left `dev`, so merging `dev` into your branch to catch up never counts as your edit. If you are
behind, `git merge origin/dev` freely — it cannot make this check fail.

---

## The rules

## out-of-scope-file

The file isn't part of your resource type. Most often this is **another contributor's resource in
your own service folder** — the two commonest ways it happens are a `git add .` that swept up
files you were only looking at, and resolving a merge conflict by keeping a whole file that
wasn't yours. Watch out for near-identical neighbours: `google_compute_target_http_proxy` is not
`google_compute_target_https_proxy`, and `google_access_context_manager_service_perimeter` is not
`..._service_perimeters`.

It also covers stray files that were never meant to be committed at all — a downloaded `opa.exe`,
a screenshot, a scratch `commits.txt`, an edit to `.gitignore` or to a workflow in `.github/`.

Fix it by putting the file back the way `dev` has it:

    git checkout origin/dev -- 'docs/gcp/Compute Engine/google_compute_image.json'

or, if it is a file you created by accident, delete it from your branch and commit that.

Then commit only your own paths, rather than everything:

    git add "docs/gcp/<Service>/<resource type>.json" \
            "inputs/gcp/<Service>/<resource type>" \
            "policies/gcp/<Service>/<resource type>"

## deleted-file

Your branch removes a file. Writing a policy only ever **adds** files, so a deletion is nearly
always an accident — a bad merge resolution, or a "clean up and start again" that took real work
with it. This applies inside your own folder too: deleting your own `<argument>.rego` and its
fixture directory silently removes an argument you had already been credited for.

Put it back:

    git checkout origin/dev -- '<the path in the message>'

If you are renaming something you added earlier on this branch, add the new name and leave the
old file alone. If a file genuinely does need to go, ask a senior team member first.

## shared-harness-edit

`scripts/**`, `policies/_helpers/**`, `tests/**` and `templates/**` are shared by every resource
in the repo — the test harness, the Rego helper library, the helper tests, and the starter
templates.

Editing them from a resource branch does not do what you want. When the PDE Portal scans your
branch it takes `scripts/` and `policies/_helpers/` **from `dev`**, not from your branch, so your
edit changes nothing about what you are actually assessed against — it only makes your local run
disagree with CI. Worse, it makes the portal's drift check refuse to scan your branch at all, so
your progress silently stops updating. See
[Your branch must not modify the shared harness or linter](policy-lint.md#top) for the whole
story.

    git checkout origin/dev -- scripts policies/_helpers tests templates

If you think the harness or a template really is wrong — a missing rule, a bug in
`policy_lint.py` — raise it with a senior team member so it can go in on its own `feature/`
branch, where it will be reviewed as a change to everybody's tooling.

## legacy-plan-cache

Committed terraform plans used to live in one shared tree, `inputs/plan_cache/`. They now live
inside the fixture directory they were planned from, as `<sha>.json`. That tree is gone, and a
branch that adds files back into it is working from a checkout older than the move — usually
because a local run on an old branch re-created it.

Delete it and pick up the current layout:

    git rm -r --cached inputs/plan_cache
    git merge origin/dev

Then re-run your tests. The plan for your own fixture is written beside it; commit that.

---

## Why this is a gate and not just advice

The two mistakes this catches are both **silent on the branch that causes them**. Editing the
harness doesn't break your tests — it stops the portal scanning you, days later, with no failing
check to point at. Wiping the plan cache doesn't break your resource — it breaks everybody
else's next CI run. Neither one shows up in the OPA or Terraform checks, which is why the scope
check runs on its own, on every push, on the branch that introduced the problem.

<div align="center">

[⬅️ Previous: policy_lint — content-quality rules](policy-lint.md#top) &nbsp;&nbsp;&nbsp; | &nbsp;&nbsp;&nbsp;
[📘 Back to Contents](policy-writing-tutorial.md#top) &nbsp;&nbsp;&nbsp; | &nbsp;&nbsp;&nbsp;
[Next: Raising a pull request ➡️](raising-pull-request.md#top)

</div>
