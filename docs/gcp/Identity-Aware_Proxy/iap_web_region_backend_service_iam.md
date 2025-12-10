## 🛡️ Policy Deployment Engine: `iap_web_region_backend_service_iam`

This section provides a concise policy evaluation for the `iap_web_region_backend_service_iam` resource in GCP.

Reference: [Terraform Registry – iap_web_region_backend_service_iam](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/iap_web_region_backend_service_iam)

---

## Argument Reference
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `region` | Region of the regional backend service. If omitted, it is parsed from the parent identifier; otherwise taken from the provider configuration. | false | true | Must match the backend’s region so the IAM binding targets the correct regional service. | region = "australia-southeast1" | region = "us-east1" while the backend is in "australia-southeast1" |
| `web_region_backend_service` | Name of the regional backend service to bind with IAP Web IAM. | true | true | Scopes access to a specific HTTPS backend; pointing at the wrong service can expose an unintended or sensitive surface. | web_region_backend_service = "orders-edge-iap-au1" | web_region_backend_service = "grafana" / "kibana" (admin consoles) or an empty/typo value |
| `project` | If it is not provided, the project will be parsed from the identifier of the parent resource. If no project is provided in the parent identifier and no project is specified, the provider project is used. | false | true | Ensures the binding lands in the intended tenant; a mismatch can grant access in the wrong project. | project = "my-gcp-project" (aligned with provider/parent) | project = "other-project" while parent/provider point elsewhere |
| `member/members` | Principals to bind. Supported: allUsers, allAuthenticatedUsers, user:{email}, serviceAccount:{email}, group:{email}, domain:{domain}, projectOwner:projectid, projectEditor:projectid, projectViewer:projectid. | true | true | Controls who can access the regional backend through IAP; public or malformed identities overexpose the endpoint. | member = "user:alice@example.com" (for *_member) / members = ["group:engineering@example.com"] (for *_binding) | member = "allUsers" / "allAuthenticatedUsers" / values with whitespace like " user:alice@example.com " |
| `role` | `google_iap_web_region_backend_service_iam_binding` can be used per role. Custom roles must be `[projects|organizations]/{parent-name}/roles/{role-name}`. | true | true | Use least privilege for IAP access to HTTPS resources. | role = "roles/iap.httpsResourceAccessor" | role = "roles/owner" / "roles/editor" / "roles/viewer" / "roles/iap.admin" / unrelated custom role |
| `policy_data` | A `google_iam_policy` data source. | false | true | Authoritative replace is only for the `*_policy` resource; not used by *_member or *_binding. | policy_data references data.google_iam_policy with the intended bindings (for *_policy). | policy_data mis-scoped to the wrong resource or missing required bindings. |
| `condition` | Optional IAM Condition to scope the binding (e.g., by request host/path, time, or device context). | false | true | Reduces blast radius by restricting when/where the binding applies. | condition { title = "OfficeHours" description = "Limit access to business hours" expression = "request.time.getHours() >= 8 && request.time.getHours() < 18" } | Empty condition block or empty expression |

### condition Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `expression` | CEL expression that decides when the binding applies. | true | true | Must be specific and non-empty to be effective. | expression = "request.host == 'app.example.com'" | expression = "" |
| `title` | Short descriptive title. | true | false | Improves reviewability and change tracking. | title = "OfficeHours" | title = "" |
| `description` | ~> **Warning:** Terraform considers the `role` and condition contents (`title`+`description`+`expression`) as the identifier for the binding. Changing any part out-of-band is treated as a different resource by Terraform. | false | true | Avoids drift surprises; clarifies intent. | description = "Restrict IAP to app.example.com during office hours" | Omitting context when intent is non-obvious |
