## 🛡️ Policy Deployment Engine: `iap_web_cloud_run_service_iam`

This section provides a concise policy evaluation for the `iap_web_cloud_run_service_iam` resource in GCP.

Reference: [Terraform Registry – iap_web_cloud_run_service_iam](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/iap_web_cloud_run_service_iam)

---

## Argument Reference
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `location` | Region of the Cloud Run service. If omitted, it is parsed from the parent identifier; otherwise taken from the provider configuration. | false | true | Must match the Cloud Run service’s region so the binding targets the correct resource. | location = "australia-southeast1" | location = "us-east1" while the service is deployed in "australia-southeast1" |
| `cloud_run_service_name` | Cloud Run service name to bind with IAP Web IAM. | true | true | Scopes the IAM binding to a specific HTTPS service; pointing at the wrong name can expose an unintended or sensitive surface. | cloud_run_service_name = "orders-be-prod" | cloud_run_service_name = "grafana" / "kibana" (admin consoles) or an empty/typo value |
| `project` | If it is not provided, the project will be parsed from the identifier of the parent resource. If no project is provided in the parent identifier and no project is specified, the provider project is used. | false | true | Ensures the binding is applied to the intended tenant; mismatches can grant access in the wrong project. | project = "my-gcp-project" (aligned with provider/parent) | project = "other-project" while parent/provider point elsewhere |
| `member/members` | Principals to bind. Supported formats: allUsers, allAuthenticatedUsers, user:{email}, serviceAccount:{email}, group:{email}, domain:{domain}, projectOwner:projectid, projectEditor:projectid, projectViewer:projectid. | true | true | Controls who can access the Cloud Run service via IAP; public or malformed identities overexpose the endpoint. | member = "user:alice@example.com" (for *_member) / members = ["group:engineering@example.com"] (for *_binding) | member = "allUsers" / "allAuthenticatedUsers" / values with whitespace like " user:alice@example.com " |
| `role` | `google_iap_web_cloud_run_service_iam_binding` can be used per role. Note that custom roles must be of the format `[projects|organizations]/{parent-name}/roles/{role-name}`. | true | true | Use least privilege for IAP access to HTTPS services. | role = "roles/iap.httpsResourceAccessor" | role = "roles/owner" / "roles/editor" / "roles/viewer" / "roles/iap.admin" / unrelated custom role |
| `policy_data` | A `google_iam_policy` data source. | false | true | Authoritative replace is only for the `*_policy` resource; not used by *_member or *_binding. | policy_data references data.google_iam_policy with the intended bindings (for *_policy). | policy_data mis-scoped to the wrong resource or missing required bindings. |
| `condition` | Optional IAM Condition to scope the binding (e.g., by request host/path, time, or device context). | false | true | Reduces blast radius by restricting when/where the binding applies. | condition { title = "OfficeHours" description = "Limit access to business hours" expression = "request.time.getHours() >= 8 && request.time.getHours() < 18" } | Empty condition block or empty expression |

### condition Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `expression` | CEL expression that decides when the binding applies. | true | true | Must be specific and non-empty to be effective. | expression = "request.host == 'app.example.com'" | expression = "" |
| `title` | Short descriptive title. | true | false | Improves reviewability and change tracking. | title = "OfficeHours" | title = "" |
| `description` | ~> **Warning:** Terraform considers the `role` and condition contents (`title`+`description`+`expression`) as the identifier for the binding. Changing any part out-of-band is treated as a different resource by Terraform. | false | true | Avoids drift surprises; clarifies intent. | description = "Restrict IAP to app.example.com during office hours" | Omitting context when intent is non-obvious |
