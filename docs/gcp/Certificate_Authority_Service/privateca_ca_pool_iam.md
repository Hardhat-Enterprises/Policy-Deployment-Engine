## 🛡️ Policy Deployment Engine: `privateca_ca_pool_iam`

This section provides a concise policy evaluation for the `privateca_ca_pool_iam` resource in GCP.

Reference: [Terraform Registry – privateca_ca_pool_iam](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/privateca_ca_pool_iam)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `location` | running `gcloud privateca locations list`. Used to find the parent resource to bind the IAM policy to. If not specified, the value will be parsed from the identifier of the parent resource. If no location is provided in the parent identifier and no location is specified, it is taken from the provider configuration. | false | false | Deployment region used to locate the parent resource; no security-enforceable constraint on location choice. | None | None |
| `ca_pool` |  | false | false | Reference to the CA pool resource being bound; does not configure a security-enforceable property. | None | None |
| `project` | If it is not provided, the project will be parsed from the identifier of the parent resource. If no project is provided in the parent identifier and no project is specified, the provider project is used. | false | false | GCP project reference; no security-enforceable constraint. | None | None |
| `member/members` | Each entry can have one of the following values: * **allUsers**: A special identifier that represents anyone who is on the internet; with or without a Google account. * **allAuthenticatedUsers**: A special identifier that represents anyone who is authenticated with a Google account or a service account. * **user:{emailid}**: An email address that represents a specific Google account. For example, alice@gmail.com or joe@example.com. * **serviceAccount:{emailid}**: An email address that represents a service account. For example, my-other-app@appspot.gserviceaccount.com. * **group:{emailid}**: An email address that represents a Google group. For example, admins@example.com. * **domain:{domain}**: A G Suite domain (primary, instead of alias) name that represents all the users of that domain. For example, google.com or example.com. * **projectOwner:projectid**: Owners of the given project. For example, "projectOwner:my-example-project" * **projectEditor:projectid**: Editors of the given project. For example, "projectEditor:my-example-project" * **projectViewer:projectid**: Viewers of the given project. For example, "projectViewer:my-example-project" | false | false | IAM principal assignment; the specific member value is deployment-specific and no policy constraint is mandated on the member identity. | None | None |
| `role` | `google_privateca_ca_pool_iam_binding` can be used per role. Note that custom roles must be of the format `[projects|organizations]/{parent-name}/roles/{role-name}`. | false | false | IAM role binding; the appropriate role is deployment-specific and no specific role value is mandated by policy. | None | None |
| `policy_data` | a `google_iam_policy` data source. | false | false | Raw IAM policy data from a data source; evaluated at the IAM policy level rather than the binding level. | None | None |
| `condition` | Structure is documented below. --- | false | false | Container block for an optional IAM condition; security evaluation applies to child arguments individually. | None | None |

### condition Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `expression` |  | false | false | CEL expression scoping the IAM binding; content is deployment-specific and no specific expression is mandated. | None | None |
| `title` |  | false | false | Human-readable label for the IAM condition; no security impact. | None | None |
| `description` | ~> **Warning:** Terraform considers the `role` and condition contents (`title`+`description`+`expression`) as the identifier for the binding. This means that if any part of the condition is changed out-of-band, Terraform will consider it to be an entirely different resource and will treat it as such. | false | false | Human-readable description of the IAM condition; no security impact. | None | None |
