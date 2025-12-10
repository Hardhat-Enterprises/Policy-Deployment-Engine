## 🛡️ Policy Deployment Engine: `iap_web_iam`

This section provides a concise policy evaluation for the `iap_web_iam` resource in GCP.

Reference: [Terraform Registry – iap_web_iam](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/iap_web_iam)

---

## Argument Reference
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `project` | If not provided, the project is parsed from the parent identifier; if missing there too, the provider project is used. | false | true | Ensures the binding lands in the intended tenant; a mismatch can grant access in the wrong project. | project = "my-gcp-project" (aligned with provider/parent) | project = "other-project" while parent/provider point elsewhere |
| `member/members` | Principals to bind. Supported: allUsers, allAuthenticatedUsers, user:{email}, serviceAccount:{email}, group:{email}, domain:{domain}, projectOwner:projectid, projectEditor:projectid, projectViewer:projectid. | true | true | Controls who can access IAP-protected web apps; public or malformed identities overexpose endpoints. | member = "user:alice@example.com" (for *_member) / members = ["group:engineering@example.com"] (for *_binding) | member = "allUsers" / "allAuthenticatedUsers" / values with whitespace like " user:alice@example.com " |
| `role` | `google_iap_web_iam_binding`/`..._member` grant a specific role. Custom roles must be `[projects|organizations]/{parent}/roles/{role-name}`. | true | true | Use least privilege for IAP access to HTTPS resources. | role = "roles/iap.httpsResourceAccessor" | role = "roles/owner" / "roles/editor" / "roles/viewer" / "roles/iap.admin" / unrelated custom role |
| `policy_data` | A `google_iam_policy` data source (authoritative when used with the *_policy resource). | false | true | Authoritative replacement of IAM applies to `google_iap_web_iam_policy`; not used by *_member or *_binding. | policy_data references data.google_iam_policy with the intended bindings (for *_policy). | policy_data mis-scoped to the wrong resource or missing required bindings. |
| `condition` | Optional IAM Condition to scope the binding (e.g., by request host/path, time, or device context). | false | true | Reduces blast radius by restricting when/where the binding applies. | condition { title = "OfficeHours" description = "Limit access to business hours" expression = "request.time.getHours() >= 8 && request.time.getHours() < 18" } | Empty condition block or empty expression |

### condition Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `expression` | CEL expression that decides when the binding applies. | true | true | Must be specific and non-empty to be effective. | expression = "request.host == 'app.example.com'" | expression = "" |
| `title` | Short descriptive title. | true | false | Improves reviewability and change tracking. | title = "OfficeHours" | title = "" |
| `description` | ~> Warning: Terraform considers the `role` and condition contents (`title`+`description`+`expression`) as the identifier for the binding. Changing any part out-of-band is treated as a different resource. | false | true | Avoids drift surprises; clarifies intent. | description = "Restrict IAP to app.example.com during office hours" | Omitting context when intent is non-obvious |
