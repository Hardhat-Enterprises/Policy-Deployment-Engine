<a id="top"></a>
<h1 align="center">Common Errors</h1>

## Your branch is behind the shared harness

The portal will not scan your branch while its copy of `scripts/` differs from the one on `dev`.
It cannot judge your policies against a test harness that is not the harness CI uses, so instead
of scanning it shows a blocker on your stage bar and runs nothing. **Your existing results are
kept** — nothing you have already done is lost.

This is normal whenever the shared tooling changes, and it is not something wrong with your
resource. The fix is one merge.

### Fix

Bring your branch up to date, then run the test harness once:

```bash
git checkout Service/<platform>/<service_slug>/<resource_type>
git fetch origin
git merge origin/dev
python3 scripts/auto_test/auto_test.py "gcp/<Service>/<resource type>"
```

The run may print something like `adopted 1 plan(s) from the pre-move inputs/plan_cache/ layout`.
That is it moving your committed Terraform plan into your own fixture folder, which is where plans
live now — one `<sha>.json` beside the `compliant.tf` / `nonCompliant.tf` it was planned from.
Nothing is re-planned and nothing is lost; the file is only being put where it now belongs.

Commit what the run moved, then push:

```bash
git add inputs
git commit -m "Merge dev and move committed plan into the fixture folder"
git push
```

If the harness printed nothing about adopting a plan, there may be nothing to add — push the merge
on its own and you are done. The portal scans your branch again on the next push.

> If `inputs/plan_cache/` still contains files after all that, they belong to other people's
> fixtures and were picked up by a stray `git add .` at some point. Remove them with
> `git rm -r inputs/plan_cache` and commit that too — see
> [Branch scope](branch-scope.md#legacy-plan-cache).

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
(`compliant.tf`, `nonCompliant.tf`, `config.tf`) and its own flat `<attribute>.rego` in the
resource's **policies** folder:

```
inputs/gcp/<Service>/google_monitoring_notification_channel/
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
