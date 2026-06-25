<a id="top"></a>
<h1 align="center">Common Errors</h1>

## Missing required Terraform attributes

![Failed-terraform-plan](images/failed-terraform-plan.PNG)

The error indicates that required Terraform arguments such as `project` or `region` are missing from the `c.tf` or `nc.tf` files.

### Fix

Include all required attributes for the resource.

```rego
resource "google_cloudfunctions_function" "c" {
  name                = "c"
  runtime             = "nodejs20"
  region              = "google_cloudfunctions_function.function.region"
  project             = "google_cloudfunctions_function.function.project"
  available_memory_mb = 128
}
```

---

### 403 Error
<img src="images/403-error.PNG" height="420"/>

Your GitHub account does not have write access to the repository.

### Fix

Request repository access from a maintainer or supervisor and ensure your GitHub account has been added to the Policy Deployment Engine repository.

---

## Terraform Plan Conflict, Multiple credentials in one policy block

When writing a policy for a resource that has multiple credential types (for example: `auth_token`, `password`, `service_key`), placing all of them in a single policy block will cause a Terraform plan error. This is because Terraform only allows one credential type to be set at a time in that block.

### Fix

Split each credential into its own separate policy folder. Each folder gets its own `c.tf`, `nc.tf`, and `policy.rego`.

```
google_monitoring_notification_channel/
  auth_token/
    c.tf
    nc.tf
    policy.rego
  password/
    c.tf
    nc.tf
    policy.rego
  service_key/
    c.tf
    nc.tf
    policy.rego
```

---

## nc.tf not producing the expected OPA result

If your OPA test is passing when it should be failing or vice versa, check that your `nc.tf` is setting **all** the relevant attributes to their non-compliant values — not just one.

For example, when writing a policy for `validate_ssl` on an HTTPS uptime check, setting only `validate_ssl = false` is not enough. You also need to set `use_ssl = false`, otherwise the plan may not reflect the non-compliant state correctly.

### Fix

Make sure all related attributes are set consistently in `nc.tf`:

```rego
resource "google_monitoring_uptime_check_config" "nc" {
  display_name = "nc"
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