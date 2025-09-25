## 🛡️ Policy Deployment Engine: `iap_web_backend_service_iam`

This section provides a concise policy evaluation for the `iap_web_backend_service_iam` resource in GCP.

Reference: [Terraform Registry – iap_web_backend_service_iam](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/iap_web_backend_service_iam)

---

## Argument Reference
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `web_backend_service` | Name of the backend service to bind with IAP Web IAM. | true | true | Scopes the IAM binding to a specific HTTPS backend. Pointing at the wrong service can expose an unintended or sensitive admin surface. | web_backend_service = "orders-edge-iap" | web_backend_service = "grafana" / "kibana" (admin consoles) or empty/typo value |
| `project` | If it is not provided, the project will be parsed from the identifier of the parent resource. If no project is provided in the parent identifier and no project is specified, the provider project is used. | false | true | Makes sure the binding lands in the intended tenant; a mismatch can grant access in the wrong project. | project = "my-gcp-project" (aligned with provider/parent) | project = "other-project" while parent/provider point elsewhere |
| `member/members` | Principals to bind. Supported formats: allUsers, allAuthenticatedUsers, user:{email}, serviceAccount:{email}, group:{email}, domain:{domain}, projectOwner:projectid, projectEditor:projectid, projectViewer:projectid. | true | true | Controls who can access the web backend via IAP. Public or malformed identities overexpose the endpoint. | member = "user:alice@example.com" (for *_member) / members = ["group:engineering@example.com"] (for *_binding) | member = "allUsers" / "allAuthenticatedUsers" / "domain:example.com" for broad access, or values with whitespace like " user:alice@example.com " |
| `role` | `google_iap_web_backend_service_iam_binding` can be used per role. Note that custom roles must be of the format `[projects|organizations]/{parent-name}/roles/{role-name}`. | true | true | Use least privilege for IAP access to HTTPS backends. | role = "roles/iap.httpsResourceAccessor" | role = "roles/owner" / "roles/editor" / "roles/viewer" / "roles/iap.admin" / unrelated custom role |
| `policy_data` | a `google_iam_policy` data source. | false | true | Authoritative replace is only for the `*_policy` resource; not used by *_member or *_binding. | policy_data references data.google_iam_policy with the intended bindings (for *_policy). | policy_data mis-scoped to the wrong resource or missing required bindings. |
| `condition` | Structure is documented below. --- | false | true | IAM Conditions reduce blast radius by scoping access (time, path/host, device context). | condition { title = "OfficeHours" description = "Limit access to business hours" expression = "request.time.getHours() >= 8 && request.time.getHours() < 18" } | Empty condition block or empty expression |

### condition Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `expression` | CEL expression that decides when the binding applies. | true | true | Must be specific and non-empty to be effective. | expression = "request.host == 'app.example.com'" | expression = "" |
| `title` | Short descriptive title. | true | false | Improves reviewability and change tracking. | title = "OfficeHours" | title = "" |
| `description` | ~> **Warning:** Terraform considers the `role` and condition contents (`title`+`description`+`expression`) as the identifier for the binding. This means that if any part of the condition is changed out-of-band, Terraform will consider it to be an entirely different resource and will treat it as such. | false | true | Avoids drift surprises; clarifies intent. | description = "Restrict IAP to app.example.com during office hours" | Omitting context when intent is non-obvious |
