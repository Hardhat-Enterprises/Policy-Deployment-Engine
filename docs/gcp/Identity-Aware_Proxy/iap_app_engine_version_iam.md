## 🛡️ Policy Deployment Engine: `iap_app_engine_version_iam`

This section provides a concise policy evaluation for the `iap_app_engine_version_iam` resource in GCP.

Reference: [Terraform Registry – iap_app_engine_version_iam](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/iap_app_engine_version_iam)

---

## Argument Reference
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `app_id` | App Engine application ID used in the IAP resource path (typically the project ID). Identifies which App Engine app’s **version** IAM is managed. | true | true | Must point to the correct application; mis-scoping could attach IAM to the wrong app. | app_id = "my-gcp-project" | app_id = "" |
| `service` | App Engine service name (for example, "default" or a custom service) whose **version** IAM is managed. | true | true | Scopes the IAM binding to the intended service; a wrong name could leave the target unprotected. | service = "default" | service = "nonexistent" |
| `version_id` | App Engine version identifier within the service (for example, "v1", timestamped version, or GA label). | true | true | Grants are applied at version granularity for this resource; the correct version is required. | version_id = "v1" | version_id = "" or a value that does not exist for the service |
| `project` | If not provided, the project is parsed from the parent resource identifier; if missing there too, the provider project is used. | false | true | Optional override; a mismatch can apply changes to an unintended project. | project = "my-gcp-project" (matches provider/app_id context) | project = "other-project" while app_id/provider point elsewhere |
| `member/members` | Principals to bind. Supported formats: allUsers, allAuthenticatedUsers, user:{email}, serviceAccount:{email}, group:{email}, domain:{domain}, projectOwner:projectid, projectEditor:projectid, projectViewer:projectid. | true | true | Defines who receives access; public or malformed identities overexpose the app. | member = "user:alice@example.com" (for *_member) / members = ["group:dev@example.com"] (for *_binding) | member = "allUsers" or " group:ops@example.com " (whitespace) |
| `role` | `google_iap_app_engine_version_iam_binding`/`..._member` grant a specific role. Custom roles must be of the form `[projects|organizations]/{parent}/roles/{role-name}`. | true | true | Use least privilege. The typical accessor is roles/iap.httpsResourceAccessor. | role = "roles/iap.httpsResourceAccessor" | role = "roles/owner" or another broad/unrelated role |
| `policy_data` | A `google_iam_policy` data source (authoritative when used with the *_policy resource). | false | true | Authoritative replacement of IAM is only applicable to `google_iap_app_engine_version_iam_policy`; not used by *_member or *_binding. | policy_data references data.google_iam_policy with intended bindings (for *_policy). | policy_data missing required bindings or mis-scoped to the wrong resource. |
| `condition` | Optional IAM Condition block to scope the binding (for example, by host/path/time/device). | false | true | Reduces blast radius by restricting when/where the binding applies. | condition { title = "OnlyProd" expression = "request.host == 'app.example.com'" description = "Limit to prod host" } | condition { } (missing required fields) or an empty expression |

### condition Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `expression` | CEL expression evaluated to determine if the binding applies. | true | true | A non-empty, precise expression is required for the condition to function. | expression = "request.host == 'app.example.com'" | expression = "" |
| `title` | Short descriptive title for the condition. | true | false | Improves reviewability and change tracking. | title = "OnlyProdHost" | title = "" |
| `description` | ~> Warning: Terraform treats `role` + condition (`title`+`description`+`expression`) as the resource identifier. Changing any part out-of-band looks like a different resource to Terraform. | false | true | Avoids drift surprises; clarifies scope and intent for reviewers. | description = "Limit to prod host only" | Omitting context when intent is not obvious |
