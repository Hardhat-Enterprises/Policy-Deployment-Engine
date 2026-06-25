<a id="top"></a>
<h1 align="center">IAM & Location Policy Templates</h1>

## When to Use These Templates

### 1. IAM Templates

Use an IAM template whenever a GCP resource exposes one of the following resource types:

- `google_*_iam_binding`
- `google_*_iam_member`
- `google_*_iam_policy`

#### The Three IAM Resource Types

Each GCP service that supports IAM exposes three separate Terraform resource types. You must write a separate policy for each one.

| Resource Type | Behaviour |
|---|---|
| `google_*_iam_policy` | **Authoritative.** Sets the full IAM policy and replaces any existing policy already attached to the resource. |
| `google_*_iam_binding` | **Authoritative for a given role.** Updates the IAM policy to grant a role to a list of members. Other roles are preserved. |
| `google_*_iam_member` | **Non-authoritative.** Updates the IAM policy to grant a role to a single new member. Other members for the role are preserved. |

### Example: `For API Gateway Gateway`

- `inputs/gcp/service name/google_*_iam_binding`
- `inputs/gcp/service name/google_*_iam_member`
- `inputs/gcp/service name/google_*_iam_policy`

#### Attributes to Cover

| Resource Type | Attribute | Path |
|---|---|---|
| `_iam_binding` | `role` + `members` | `["members"]` (array) |
| `_iam_member` | `role` + `member` | `["member"]` (singular string) |
| `_iam_policy` | `role` + `policy_data` | `["policy_data"]` (JSON string) |

#### Valid Values for `member` / `members`

| Value | Description |
|---|---|
| `allUsers` | Anyone on the internet, with or without a Google account. |
| `allAuthenticatedUsers` | Anyone authenticated with a Google account or a service account. |
| `user:{emailid}` | A specific Google account (e.g. `alice@gmail.com`). |
| `serviceAccount:{emailid}` | A service account (e.g. `my-app@appspot.gserviceaccount.com`). |
| `group:{emailid}` | A Google group (e.g. `admins@example.com`). |
| `domain:{domain}` | All users of a G Suite domain (e.g. `google.com`). |
| `projectOwner:projectid` | Owners of the given project. |
| `projectEditor:projectid` | Editors of the given project. |
| `projectViewer:projectid` | Viewers of the given project. |

### 2. Location Templates

Use a location template whenever a GCP resource has a geographic placement field. Use only the template that matches your resource's attribute name:

| Attribute Name | Example Resource |
|---|---|
| `location` | `google_alloydb_backup` |
| `region` | `google_sql_database_instance` |
| `zone` | zone-level resources |

### For example: location and region

```hcl
resource "google_alloydb_backup" "default" {
  location = "australia-southeast1"
}
```

```hcl
resource "google_sql_database_instance" "instance" {
  name   = "cloudrun-sql"
  region = "australia-southeast1"
}
```

## Folder Structure

### 1. Copy required files

Copy the fixture files from `templates/gcp` into your **inputs** attribute folder
`inputs/gcp/<Service>/<IAM resource type>/<attribute>/`:

- `compliant.tf`
- `nonCompliant.tf`
- `config.tf`

For the **policies** tree:

- Copy **one** `_vars.rego` into the IAM resource folder
  `policies/gcp/<Service>/<IAM resource type>/`.
- Copy `templates/gcp/policy.rego` into that same folder and **rename it to `<attribute>.rego`**
  (a flat file — there is no per-attribute subfolder).

> **Note:** Each IAM resource type (`_iam_binding`, `_iam_member`, `_iam_policy`) is its own
> resource folder, so you need **3 separate `_vars.rego` files** — one per IAM resource type.

### 2. Rename the folder to match the exact Terraform resource type

Rename each IAM resource folder to match the exact Terraform resource type.

**Before:**
```
GKEHub/
  <resource>_iam_binding/
  <resource>_iam_member/
  <resource>_iam_policy/no_primitive_or_public/
```

**After:**
```
GKEHub/
  google_gke_hub_scope_iam_binding/
  google_gke_hub_scope_iam_member/
  google_gke_hub_scope_iam_policy/
```

## Author Checklist

Complete every item before raising a PR:

- [ ] `package` line updated in `<attribute>.rego`
- [ ] Folder name matches the resource type exactly
- [ ] `_vars.rego` — all 3 fields filled in: `friendly_resource_name`, `resource_type`, `resource_value_name`
- [ ] Condition 1 — `["role"]` confirmed in resource JSON
- [ ] Condition 2 — `attribute_path` confirmed:
  - `_iam_binding` → `["members"]` (array)
  - `_iam_member` → `["member"]` (singular string)
  - `_iam_policy` → `["policy_data"]` (JSON string)
- [ ] Condition 3 — `attribute_path` confirmed (same as condition 2)
- [ ] Valid roles confirmed from resource documentation — pattern whitelist values updated
- [ ] `_iam_policy` values updated to full JSON string patterns matching your resource's valid roles
- [ ] `python3 scripts/auto_test/auto_test.py` run for the resource — policy produces expected pass/fail output

<div align="center">

[⬅️ Previous: Policy Writing](policy-writing.md#top) &nbsp;&nbsp;&nbsp; | &nbsp;&nbsp;&nbsp;
[📘 Back to Contents](policy-writing-tutorial.md#top) &nbsp;&nbsp;&nbsp; | &nbsp;&nbsp;&nbsp;
[Next: compliant.tf & nonCompliant.tf ➡️](c-tf-and-nc-tf.md#top)

</div>
