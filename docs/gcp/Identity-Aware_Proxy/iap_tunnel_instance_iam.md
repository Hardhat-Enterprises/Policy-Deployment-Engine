## 🛡️ Policy Deployment Engine: `iap_tunnel_instance_iam`

This section provides a concise policy evaluation for the `iap_tunnel_instance_iam` resource in GCP.

Reference: [Terraform Registry – iap_tunnel_instance_iam](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/iap_tunnel_instance_iam)

---

## Argument Reference
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `zone` | Zone of the Compute Engine instance. If omitted, parsed from the parent identifier; otherwise taken from the provider configuration. | false | true | Must match the instance’s actual zone so the binding targets the correct resource. | zone = "australia-southeast1-b" | zone = "us-central1-a" while the instance is in "australia-southeast1-b" |
| `instance` | Compute Engine instance name to bind IAP Tunnel IAM on. | true | true | Scopes tunnel access to a specific VM; a wrong name can expose the wrong host or fail to protect the intended one. | instance = "bastion-01" | instance = "" or a name that does not exist in the project/zone |
| `project` | If not provided, the project is parsed from the parent identifier; if missing there too, the provider project is used. | false | true | Ensures the binding is applied to the intended tenant; mismatches can grant access in the wrong project. | project = "my-gcp-project" (matches provider/parent context) | project = "other-project" while parent/provider point elsewhere |
| `member/members` | Principals to bind. Supported formats: allUsers, allAuthenticatedUsers, user:{email}, serviceAccount:{email}, group:{email}, domain:{domain}, projectOwner:projectid, projectEditor:projectid, projectViewer:projectid. | true | true | Controls who can initiate IAP TCP tunnels to the instance; public or malformed identities overexpose internal services. | member = "user:alice@example.com" (for *_member) / members = ["group:ops@example.com"] (for *_binding) | member = "allUsers" / "allAuthenticatedUsers" / " group:ops@example.com " (whitespace) |
| `role` | `google_iap_tunnel_instance_iam_binding`/`..._member` grant a specific role. Custom roles must be of the form `[projects|organizations]/{parent}/roles/{role-name}`. | true | true | Use least privilege for IAP TCP access. The standard accessor role is roles/iap.tunnelResourceAccessor. | role = "roles/iap.tunnelResourceAccessor" | role = "roles/owner" / "roles/editor" / unrelated custom role |
| `policy_data` | A `google_iam_policy` data source (authoritative when used with the *_policy resource). | false | true | Authoritative replacement of IAM applies to `google_iap_tunnel_instance_iam_policy`; not used by *_member or *_binding. | policy_data references data.google_iam_policy with intended bindings (for *_policy). | policy_data missing required bindings or mis-scoped to the wrong resource. |
| `condition` | Optional IAM Condition to scope the binding (e.g., by source IP, time, or device attributes when evaluated). | false | true | Reduces blast radius by restricting when/where the binding applies. | condition { title = "OfficeHours" expression = "request.time.getHours() >= 8 && request.time.getHours() < 18" description = "Restrict tunnel use to office hours" } | condition { } (missing required fields) or an empty expression |

### condition Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `expression` | CEL expression evaluated to determine if the binding applies. | true | true | A non-empty, precise expression is required for the condition to function. | expression = "request.client_ip.startsWith('10.0.')" | expression = "" |
| `title` | Short descriptive title for the condition. | true | false | Improves reviewability and change tracking. | title = "OfficeHours" | title = "" |
| `description` | ~> Warning: Terraform treats `role` + condition (`title`+`description`+`expression`) as the resource identifier. Changing any part out-of-band looks like a different resource to Terraform. | false | true | Avoids drift surprises; clarifies scope and intent for reviewers. | description = "Restrict access during business hours only" | Omitting context when intent is not obvious |
