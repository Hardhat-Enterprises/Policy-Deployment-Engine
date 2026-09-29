<a id="top"></a>
<h1 align="center">Terraform inputs</h1>

After cutover, fixtures and `policy.rego` share the argument directory:
`policies/gcp/<Service>/<resource>/<attribute>/`.

### 1. Generate the committed plan

From the repository root:

```bash
python scripts/auto_test/auto_test.py "gcp/<Service>/<resource>"
```

The harness copies the effective Terraform files into a short temporary workspace.
It selects the argument's local `config.tf` if present, otherwise the shared
`policies/gcp/config.tf`. These configurations are never combined. It runs Terraform
there and atomically writes `<fixture-sha>.json` beside the fixtures. The policy
may still fail while you are writing it; inspect the generated plan to determine
your attribute path, finish the policy, and rerun the command.

### 2. Inspect and commit

Open the argument directory's hash-named JSON plan to inspect `planned_values`.
Commit that plan with the policy and fixtures, including deletion of its stale
predecessor. Do not commit manual `plan.json`, binary plans or Terraform state.
Running Terraform directly inside the argument directory does not inherit the
shared config; use the harness to assemble the correct workspace.

### 3. Verify without rebuilding

```bash
python scripts/auto_test/auto_test.py "gcp/<Service>/<resource>" --verify-plan-cache
```

This is read-only and rejects missing, invalid or stale plans. During preparation,
production data is still unmigrated; follow the [cutover guide](../layout-cutover.md).

<div align="center">

if you are having trouble with this section please visit [Common Errors](common-errors.md)

</div>

<div align="center">

[⬅️ Previous: compliant.tf and nonCompliant.tf](c-tf-and-nc-tf.md#top) &nbsp;&nbsp;&nbsp; | &nbsp;&nbsp;&nbsp;
[📘 Back to Contents](policy-writing-tutorial.md#top) &nbsp;&nbsp;&nbsp; | &nbsp;&nbsp;&nbsp;
[Next: _vars.rego ➡️](vars-rego.md#top) 
</div>