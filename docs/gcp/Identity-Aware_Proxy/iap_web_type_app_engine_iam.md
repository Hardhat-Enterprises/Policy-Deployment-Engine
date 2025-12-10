## 🛡️ Policy Deployment Engine: `iap_web_type_app_engine_iam`

This section provides a concise policy evaluation for the `iap_web_type_app_engine_iam` resource in GCP.

Reference: [Terraform Registry – iap_web_type_app_engine_iam](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/iap_web_type_app_engine_iam)

---

## Argument Reference
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `app_id` | App Engine application ID used in the IAP resource path (projects/{project}/iap_web/appengine-{app_id}). | true | true | Targets the correct App Engine application for the IAP Web IAM binding; a wrong ID can expose or fail to protect the intended app. | app_id = "my-app" | app_id = "" or an ID that does not exist in the project |
| `project` | If it is not provided, the project will be parsed from the identifier of the parent resource. If no project is provided in the parent identifier and no project is specified, the provider project is used. | false | true | Ensures the binding is applied in the intended tenant; a mismatch can grant access in the wrong project. | project = "my-gcp-project" (aligned with provider/parent) | project = "other-project" while parent/provider point elsewhere |
| `member/members` | Principals to bind. Supported formats: allUsers, allAuthenticatedUsers, user:{email}, serviceAccount:{email}, group:{email}, domain:{domain}, projectOwner:projectid, projectEditor:projectid, projectViewer:projectid. | true | true | Controls who can access the App Engine app via IAP; public or malformed identities overexpose the endpoint. | member = "user:alice@example.com" (for *_member) / members = ["group:engineering@example.com"] (for *_binding) | member = "allUsers" / "allAuthenticatedUsers" / values with whitespace like " user:alice@example.com " |
| `role` | `google_iap_web_type_app_engine_iam_binding` can be used per role. Note that custom roles must be of the format `[projects|organizations]/{parent-name}/roles/{role-name}`. | true | true | Use least privilege for IAP access to HTTPS resources. | role = "roles/iap.httpsResourceAccessor" | role = "roles/owner" / "roles/editor" / "roles/viewer" / "roles/iap.admin" / unrelated custom role |
| `policy_data` | A `google_iam_policy` data source. | false | true | Authoritative replace is only for the `*_policy` resource; not used by *_member or *_binding. | policy_data references data.google_iam_policy with the intended bindings (for *_policy). | policy_data mis-scoped to the wrong resource or missing required bindings. |
| `condition` | Optional IAM Condition to scope the binding (e.g., by request host/path, time, or device context). | false | true | Reduces blast radius by restricting when/where the binding applies. | condition { title = "OfficeHours" description = "Limit access to business hours" expression = "request.time.getHours() >= 8 && request.time.getHours() < 18" } | Empty condition block or empty expression |

### condition Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `expression` | CEL expression that decides when the binding applies. | true | true | Must be specific and non-empty to be effective. | expression = "request.host == 'app.example.com'" | expression = "" |
| `title` | Short descriptive title. | true | false | Improves reviewability and change tracking. | title = "OfficeHours" | title = "" |
| `description` | ~> **Warning:** Terraform considers the `role` and condition contents (`title`+`description`+`expression`) as the identifier for the binding. This means that if any part of the condition is changed out-of-band, Terraform will consider it to be an entirely different resource and will treat it as such. | false | true | Avoids drift surprises; clarifies intent. | description = "Restrict IAP to app.example.com during office hours" | Omitting context when intent is non-obvious |
