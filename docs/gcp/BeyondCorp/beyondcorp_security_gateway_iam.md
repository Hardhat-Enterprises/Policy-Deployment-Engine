## 🛡️ Policy Deployment Engine: `beyondcorp_security_gateway_iam`

This section provides a concise policy evaluation for the `beyondcorp_security_gateway_iam` resource in GCP.

Reference: [Terraform Registry – beyondcorp_security_gateway_iam](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/beyondcorp_security_gateway_iam)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `location` | the value will be parsed from the identifier of the parent resource. If no location is provided in the parent identifier and no location is specified, it is taken from the provider configuration. | false | false | The location is used to scope the BeyondCorp Security Gateway. If not provided, it will default to the provider's location or be inferred from the parent resource. This ensures that resources are created in the intended geographical region, which can have implications for latency, compliance, and data residency. | None | None |
| `security_gateway_id` | The security gateway identifier. Must be unique within the project and location. | true | false | The security gateway ID is required to identify the specific BeyondCorp Security Gateway for which the IAM policy is being managed. | None | None |
| `project` | If it is not provided, the project will be parsed from the identifier of the parent resource. If no project is provided in the parent identifier and no project is specified, the provider project is used. | false | false | The project argument allows for explicit specification of the GCP project in which the BeyondCorp Security Gateway resides, providing flexibility in resource management. | None | None |
| `member/members` | Each entry can have one of the following values: * **allUsers**: A special identifier that represents anyone who is on the internet; with or without a Google account. * **allAuthenticatedUsers**: A special identifier that represents anyone who is authenticated with a Google account or a service account. * **user:{emailid}**: An email address that represents a specific Google account. For example, alice@gmail.com or joe@example.com. * **serviceAccount:{emailid}**: An email address that represents a service account. For example, my-other-app@appspot.gserviceaccount.com. * **group:{emailid}**: An email address that represents a Google group. For example, admins@example.com. * **domain:{domain}**: A G Suite domain (primary, instead of alias) name that represents all the users of that domain. For example, google.com or example.com. * **projectOwner:projectid**: Owners of the given project. For example, "projectOwner:my-example-project" * **projectEditor:projectid**: Editors of the given project. For example, "projectEditor:my-example-project" * **projectViewer:projectid**: Viewers of the given project. For example, "projectViewer:my-example-project" | true | true | The member/members field is crucial for defining who has access to the BeyondCorp Security Gateway, directly impacting security. | user:jane@example.com, user:john@example.com | allAuthenticatedUsers, allUsers |
| `role` | `google_beyondcorp_security_gateway_iam_binding` can be used per role. Note that custom roles must be of the format `[projects|organizations]/{parent-name}/roles/{role-name}`. | true | false | The role field is necessary to specify the permissions being granted to the members. | None | None |
| `policy_data` | The policy data for the BeyondCorp Security Gateway IAM. | true | false | The policy data is required to define the IAM policy being applied to the BeyondCorp Security Gateway. | None | None |
| `condition` | The condition field allows for more granular control over when the IAM policy is applied. | false | false | The condition field allows for more granular control over when the IAM policy is applied. | None | None |

### condition Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `expression` | The expression for the condition. See CEL spec for more details. | true | false | The expression is necessary to define the logic that determines when the IAM policy is applied. | None | None |
| `title` | The title of the condition in which it is used to identify the condition. | true | false | The title is necessary for identifying the condition in various contexts. | None | None |
| `description` | ~> **Warning:** Terraform considers the `role` and condition contents (`title`+`description`+`expression`) as the identifier for the binding. This means that if any part of the condition is changed out-of-band, Terraform will consider it to be an entirely different resource and will treat it as such. | false | false | The description provides additional context about the condition, which can be helpful for understanding its purpose and usage. | None | None |
