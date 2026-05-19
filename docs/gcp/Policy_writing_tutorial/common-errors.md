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



<div align="center">

[📘 Back to Contents](policy-writing-tutorial.md#top) &nbsp;&nbsp;&nbsp;  &nbsp;&nbsp;&nbsp;

</div>