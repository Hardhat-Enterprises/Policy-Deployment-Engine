## 🛡️ Policy Deployment Engine: `iap_tunnel_dest_group_iam`

This section provides a concise policy evaluation for the `iap_tunnel_dest_group_iam` resource in GCP.

Reference: [Terraform Registry – iap_tunnel_dest_group_iam](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/iap_tunnel_dest_group_iam)

---

## Argument Reference
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `region` | Region of the IAP TCP destination group. If omitted, it is parsed from the parent identifier or taken from the provider configuration. | false | true | Ensures the binding is applied in the intended location; a mismatch can grant access in the wrong region. | region = "australia-southeast1" | region = "" or a region that does not match the parent resource |
| `dest_group` | Destination group identifier for IAP TCP forwarding (IAP Tunnel). Typically the dest group ID within the region. | true | true | Scopes the IAM binding to the exact tunnel destination group. | dest_group = "web-admin" | dest_group = "" or a non-existent destination group |
| `project` | If not provided, the project is parsed from the parent identifier; if missing there too, the provider project is used. | false | true | Optional override; a mismatch can apply changes to an unintended project. | project = "my-gcp-project" (matches provider/parent context) | project = "other-project" while parent points elsewhere |
| `member/members` | Principals to bind. Supported formats: allUsers, allAuthenticatedUsers, user:{email}, serviceAccount:{email}, group:{email}, domain:{domain}, projectOwner:projectid, projectEditor:projectid, projectViewer:projectid. | true | true | Defines who receives access to IAP TCP tunnels; public or malformed identities overexpose internal services. | member = "user:alice@example.com" (for *_member) / members = ["group:ops@example.com"] (for *_binding) | member = "allUsers" or " domain:example.com " (whitespace/malformed) |
| `role` | `google_iap_tunnel_dest_group_iam_binding`/`..._member` grant a specific role. Custom roles must be of the form `[projects|organizations]/{parent}/roles/{role-name}`. | true | true | Use least privilege for IAP TCP access. The typical accessor is roles/iap.tunnelResourceAccessor. | role = "roles/iap.tunnelResourceAccessor" | role = "roles/owner" / "roles/editor" / unrelated custom role |
| `policy_data` | A `google_iam_policy` data source (authoritative when used with the *_policy resource). | false | true | Authoritative replacement of IAM is only applicable to `google_iap_tunnel_dest_group_iam_policy`; not used by *_member or *_binding. | policy_data references data.google_iam_policy with intended bindings (for *_policy). | policy_data missing required bindings or mis-scoped to the wrong resource. |
| `condition` | Optional IAM Condition block to scope the binding (for example, by source IP, time, or device attributes when evaluated by the proxy). | false | true | Reduces blast radius by restricting when/where the binding applies. | condition { title = "OfficeHours" expression = "request.time.getHours() >= 8 && request.time.getHours() < 18" description = "Limit tunnel use to office hours" } | condition { } (missing required fields) or an empty expression |

### condition Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `expression` | CEL expression evaluated to determine if the binding applies. | true | true | A non-empty, precise expression is required for the condition to function. | expression = "request.client_ip.startsWith('10.0.')" | expression = "" |
| `title` | Short descriptive title for the condition. | true | false | Improves reviewability and change tracking. | title = "OfficeHours" | title = "" |
| `description` | ~> Warning: Terraform treats `role` + condition (`title`+`description`+`expression`) as the resource identifier. Changing any part out-of-band looks like a different resource to Terraform. | false | true | Avoids drift surprises; clarifies scope and intent for reviewers. | description = "Restrict access during business hours only" | Omitting context when intent is not obvious |
