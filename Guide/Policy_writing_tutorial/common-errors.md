<a id="top"></a>
<h1 align="center">Common Errors</h1>

<a id="harness-out-of-date"></a>

## "Merge dev into your branch to catch up — nothing is scanned until then"

Once your documentation has been reviewed, this notice replaces everything else on your portal
card:

> Your branch's copy of the shared test harness or linter (scripts/, policies/_helpers/) doesn't
> match dev's. Merge dev into your branch to catch up — nothing is scanned until then.

A shorter version names only the linter (`scripts/linters/`). Older tabs may still show a version
that says you *changed* those files — ignore that wording; you almost certainly did not. It means
your branch was cut before the shared tooling was last updated, which happens to everyone
periodically and is not a problem with your resource.

While the notice is up, the portal scans nothing and shows no other feedback — no per-argument
rows, no linter advice. **Your existing results are kept.** You get them back on your next push
after the steps below.

> If your documentation has not been reviewed yet you will not see this notice at all, because
> the documentation blockers come first — but your branch still needs the same catch-up before
> anything will scan.

### Fix

One merge, one harness run, one commit.

```bash
git checkout Service/<platform>/<service_slug>/<resource_type>
git fetch origin
git merge origin/dev
python3 scripts/auto_test/auto_test.py "gcp/<Service>/<resource type>"
```

> If `git merge origin/dev` gives you hundreds of conflicts, including in files you never touched
> such as `scripts/linters/*.py`, **stop and run `git merge --abort`**. Your branch has a squashed
> copy of dev from a pull request merged on GitHub, and a normal merge can't fix it. Your card in
> the YB IT PDE Portal shows the exact repair commands for your branch. Don't resolve the conflicts
> by hand, and never merge a PR from dev into your own branch on GitHub.

After layout cutover, the harness uses the fixture's effective Terraform files and
writes its committed `<sha>.json` beside `policy.rego`. Commit a regenerated plan
and its stale predecessor's deletion together. It can adopt only historical hash
names proven equivalent under line-ending normalization; it does not migrate a
central cache or the old layout. During restructuring preparation, follow the
[cutover guide](../layout-cutover.md) instead of running against unmigrated data.

---

## Missing required Terraform attributes

![Failed-terraform-plan](images/failed-terraform-plan.PNG)

The error indicates that required Terraform arguments such as `project` or `region` are missing from the `compliant.tf` or `nonCompliant.tf` files.

### Fix

Include all required attributes for the resource.

```hcl
resource "google_cloudfunctions_function" "compliant_example_1" {
  name                = "compliant_example_1"
  runtime             = "Python3.12"
  region              = "google_cloudfunctions_function.function.region"
  project             = "google_cloudfunctions_function.function.project"
  available_memory_mb = 128
}
```

---

### 403 Error
<img src="images/403-error.png" height="420"/>

Your GitHub account does not have write access to the repository.

### Fix

Request repository access from a maintainer or supervisor and ensure your GitHub account has been added to the Policy Deployment Engine repository.

---

## Terraform Plan Conflict — multiple credentials in one block

When writing a policy for a resource that has multiple credential types (for example: `auth_token`, `password`, `service_key`), placing all of them in a single block will cause a Terraform plan error. This is because Terraform only allows one credential type to be set at a time in that block.

### Fix

Split each credential into its own attribute. Each attribute gets its own **inputs** folder
(`compliant.tf`, `nonCompliant.tf`, `config.tf`) and its own flat `<attribute>/policy.rego` in the
resource's **policies** folder:

```
policies/gcp/<Service>/google_monitoring_notification_channel/
  auth_token/
    compliant.tf
    nonCompliant.tf
    config.tf
  password/
    compliant.tf
    nonCompliant.tf
    config.tf
  service_key/
    compliant.tf
    nonCompliant.tf
    config.tf

policies/gcp/<Service>/google_monitoring_notification_channel/
  _vars.rego
  auth_token.rego
  password.rego
  service_key.rego
```

---

## nonCompliant.tf not producing the expected OPA result

If your OPA test is passing when it should be failing (or vice versa), check that your
`nonCompliant.tf` is setting **all** the relevant attributes to their non-compliant values —
not just one.

For example, when writing a policy for `validate_ssl` on an HTTPS uptime check, setting only `validate_ssl = false` is not enough. You also need to set `use_ssl = false`, otherwise the plan may not reflect the non-compliant state correctly.

### Fix

Make sure all related attributes are set consistently in `nonCompliant.tf`:

```hcl
resource "google_monitoring_uptime_check_config" "non_compliant_example_1" {
  display_name = "non_compliant_example_1"
  timeout      = "60s"

  http_check {
    path         = "/"
    use_ssl      = false
    validate_ssl = false
  }

  monitored_resource {
    type = "uptime_url"
    labels = {
      project_id = "my-project"
      host       = "example.com"
    }
  }
}
```

---

<div align="center">

[📘 Back to Contents](policy-writing-tutorial.md#top) &nbsp;&nbsp;&nbsp;  &nbsp;&nbsp;&nbsp;

</div>
