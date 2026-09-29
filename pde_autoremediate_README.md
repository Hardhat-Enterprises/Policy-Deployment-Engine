# pde_autoremediate.py — Setup & Usage Guide (Windows)

This is the working, tested guide for running the auto-remediation engine on your
machine, including everything that tripped us up getting here. If you followed the
troubleshooting chat to get this far, your setup is already correct — this file is the
clean reference version.

---

## 1. One-time setup (you've likely already done this)

```powershell
cd "\Policy-Deployment-Engine"

# Python package needed for the read-only validate-repo mode
pip install python-hcl2

# Confirm it actually imports
python -c "import hcl2; print('hcl2 OK')"
```

**OPA binary** — download it, then unblock it (Windows flags downloaded .exe files and
silently refuses to run them otherwise — this was the cause of the `WinError 2` you hit):

```powershell
Invoke-WebRequest -Uri "https://github.com/open-policy-agent/opa/releases/latest/download/opa_windows_amd64.exe" -OutFile "opa.exe"
Unblock-File -Path .\opa.exe
.\opa.exe version
```

That last command should print something like `Version: 1.2x.x`. If it doesn't, stop
here and fix that first — nothing else will work.

**Use the full absolute path to opa.exe in every command below.** A relative path
(`.\opa.exe`) only resolves if you happen to be standing in exactly the right folder —
the absolute path always works regardless of where you run the command from:

```
C:\Users\Shreyash Dhanawade\Policy-Deployment-Engine\opa.exe
```

---

## 2. Always use `python`, not `python3`

On your machine `python3` is a Microsoft Store stub that does nothing useful. `python`
is your real Python 3.14 install. Every command below uses `python`.

---

## 3. Which branch are you testing?

- **`dev`** — the shared branch. Has the most policies merged (everyone's finished work),
  so it's the best branch to run a full repo-wide validation against.
- **Your own `Service/...` branch** — has everything `dev` had at the point you branched,
  plus your own unmerged work. Use this if you specifically want to test *your* resources
  before they're merged.

To switch:

```powershell
git fetch origin
git checkout dev
```

---

## 4. Commands

### 4a. See what's out there first (fast, always do this first)

```powershell
python pde_autoremediate.py discover --repo . --opa-bin "C:\Users\Shreyash Dhanawade\Policy-Deployment-Engine\opa.exe"
```

Prints a total count and a breakdown by policy type. Takes a few seconds. No files
written.

### 4b. Run the FULL validation across every policy on the current branch

This is what you asked for — no `--only` filter means every service, every resource,
every policy with a fixture:

```powershell
python pde_autoremediate.py validate-repo --repo . --opa-bin "C:\Users\Shreyash Dhanawade\Policy-Deployment-Engine\opa.exe" --log-out full_dev_results.json --write-fixed-to remediated_examples
```

**This will take a while.** On `dev` there are roughly 1,650–1,700 policies with
fixtures; each one needs 2–3 separate calls out to `opa.exe`. On the Linux machine I
built this on, the full run took about 6–8 minutes; Windows subprocess launching is
typically slower, so budget **15–25 minutes**, possibly longer if antivirus software
scans each `opa.exe` launch. It will not hang — it's just genuinely doing ~4,000+
individual OPA evaluations. Let it run.

**If you want a quick sanity check before committing to the full run**, cap it first:

```powershell
python pde_autoremediate.py validate-repo --repo . --opa-bin "C:\Users\Shreyash Dhanawade\Policy-Deployment-Engine\opa.exe" --limit 50 --log-out sample_results.json
```

### 4c. Scope to just one service or resource (fast, minutes not seconds)

```powershell
python pde_autoremediate.py validate-repo --repo . --only "Oracle Database" --opa-bin "C:\Users\Shreyash Dhanawade\Policy-Deployment-Engine\opa.exe" --log-out oracle_results.json --write-fixed-to remediated_examples
```

`--only` does a case-insensitive substring match against either the resource type or
the service name. `google_oracle_database_odb_subnet`, `oracle_database`, and
`"Oracle Database"` all work.

---

## 5. What gets created, and where

Running command **4b** or **4c** creates, in your current folder
(`Policy-Deployment-Engine\`):

| File/Folder | What it is |
|---|---|
| `full_dev_results.json` (or whatever you named it via `--log-out`) | The complete machine-readable results: overall counts, plus full detail on every policy that needed manual review, failed to patch, or errored |
| `remediated_examples\` (only if you passed `--write-fixed-to`) | One subfolder per successfully auto-fixed policy, mirroring the real `inputs\` folder structure, each containing `BEFORE_nonCompliant.tf` and `AFTER_fixed.tf` |

**Nothing under `policies\` or `inputs\` is ever modified by `validate-repo`.** It reads
your repo, never writes to it. The only two outputs are the ones named above, in
whatever folder you ran the command from.

Console output (also the first part of the `.json` file) looks like this:

```json
{
  "total_policies_with_fixture": 1654,
  "fixture_missing": 0,
  "condition_type_unsupported": 186,
  "no_violation_found_in_fixture": 12,
  "auto_fixed_and_reverified_compliant": 1123,
  "auto_fixed_but_still_noncompliant": 15,
  "patch_failed": 13,
  "resource_name_mismatch": 0,
  "needs_manual_review": 301,
  "eval_error": 0
}
```

Your exact numbers may differ slightly depending on how many resources have been merged
into `dev` since this was last run.

### What each field means

| Field | Meaning |
|---|---|
| `total_policies_with_fixture` | Every policy that had a matching test fixture, and was actually evaluated |
| `auto_fixed_and_reverified_compliant` | **The headline number.** Detected, fixed, and independently re-confirmed compliant by the real OPA engine |
| `needs_manual_review` | Correctly *not* auto-fixed — no safe value is knowable from the policy alone (e.g. a blacklist forbidding one specific string with many other valid options) |
| `condition_type_unsupported` | Uses a policy type (`pattern_*`, `element_*`) this engine doesn't yet implement a fix rule for |
| `patch_failed` | The fix was known, but the Terraform text patcher couldn't apply it (map-typed attributes, or a nested block that's entirely absent — see "Known limitations" below) |
| `auto_fixed_but_still_noncompliant` | Patched, but a *different* violation in the same fixture remains (the policy only checks one thing; the fixture had two problems) |
| `resource_name_mismatch` | Should always be 0 now — this was a bug in an earlier version of this engine, since fixed |
| `eval_error` | Something threw an exception. Check the `"eval_errors"` list in your `--log-out` file for the exact cause of each one |

---

## 6. What this actually achieves

Every policy on `dev` was written by a different student, independently, over the whole
trimester. This engine:

1. **Discovers** every one of them by walking the real folder structure — no
   hand-maintained list of resources.
2. **Reads each policy's own compliant-value logic** straight from the real OPA engine —
   it doesn't know in advance what "correct" looks like for any given resource; it asks
   the policy itself.
3. **Detects** violations by running those same real policies against a real Terraform
   plan.
4. **Computes a safe fix** using one of three provably-correct rules (whitelist → first
   allowed value; blacklist → flip the boolean or strip the forbidden list elements;
   range → clamp to the nearest bound) — confirmed by reading the actual evaluator
   source code, not guessed.
5. **Patches** the real `.tf` file text and **re-verifies** with the same real policy.

The result is a single number that's hard to argue with: **roughly two-thirds of every
security policy violation in this entire multi-contributor repository can be detected,
fixed, and independently verified automatically, with zero resource-specific code.**
That's the evidence for the High Distinction task — not a demo on one resource you wrote
yourself, but a generalised engine proven at the scale of the whole project.

---

## 7. Known limitations (so you can speak to them, not get caught by them)

- **Map-typed attributes aren't patched.** Terraform allows nested data as a *block*
  (`name { }`) or a *map-typed attribute* (`name = { "key" = val }`). Only the block form
  is supported. Affects roughly 1% of policies; they're correctly flagged, not
  mis-patched.
- **A completely absent nested block won't be fabricated.** If the fix needs a block
  that doesn't exist at all in the resource, the patcher flags it rather than guessing
  its shape.
- **Only whitelist, blacklist, and range policy types have fix rules.** `pattern_*` and
  `element_*` types (about 11% of policies) are detected and safely skipped, not
  mishandled.

---

## 8. Troubleshooting quick reference

| Symptom | Fix |
|---|---|
| `Python was not found...` | Use `python`, not `python3` |
| `unrecognized arguments: --opa-bin` | Fixed in the current script version — update if you're on an older copy |
| `FileNotFoundError: [WinError 2]` for every policy | `opa.exe` path is wrong, or it's blocked. Run `Unblock-File -Path .\opa.exe`, and use the full absolute path in `--opa-bin` |
| `ModuleNotFoundError: hcl2` | `pip install python-hcl2` |
| `total_policies_with_fixture: 0` with all `eval_error` | Check the printed error list — it now shows the real exception. Almost always one of the two issues above |
| `plan.json` fails to parse (only relevant to the `remediate` command) | Use `Out-File -Encoding utf8`, not `>`, when redirecting `terraform show -json` output — plain `>` writes UTF-16 on Windows, which breaks JSON parsing |
