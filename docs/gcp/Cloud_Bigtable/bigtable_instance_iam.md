## 🛡️ Policy Deployment Engine: `bigtable_instance_iam`

This section provides a concise policy evaluation for the `bigtable_instance_iam` resource in GCP.

Reference: [Terraform Registry – bigtable_instance_iam](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/bigtable_instance_iam)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `project` | is not provided, Terraform will use the provider default. | true | false | This argument can affect security posture or operational safety and should align with organizational policy. | None | None |
| `instance` | For `google_bigtable_instance_iam_member` or `google_bigtable_instance_iam_binding`: | false | false | This argument is primarily operational and should follow platform standards. | None | None |
| `member/members` | Each entry can have one of the following values: * **allUsers**: A special identifier that represents anyone who is on the internet; with or without a Google account. * **allAuthenticatedUsers**: A special identifier that represents anyone who is authenticated with a Google account or a service account. * **user:{emailid}**: An email address that represents a specific Google account. For example, alice@gmail.com or joe@example.com. * **serviceAccount:{emailid}**: An email address that represents a service account. For example, my-other-app@appspot.gserviceaccount.com. * **group:{emailid}**: An email address that represents a Google group. For example, admins@example.com. * **domain:{domain}**: A G Suite domain (primary, instead of alias) name that represents all the users of that domain. For example, google.com or example.com. | false | true | Public principals expose data-plane permissions broadly and violate least privilege. | "serviceAccount:bt-reader@pde.iam.gserviceaccount.com" | "allUsers" or "allAuthenticatedUsers" |
| `role` | `google_bigtable_instance_iam_binding` can be used per role. Note that custom roles must be of the format `[projects|organizations]/{parent-name}/roles/{role-name}`. Read more about roles [here](https://cloud.google.com/bigtable/docs/access-control#roles). | true | false | This argument can affect security posture or operational safety and should align with organizational policy. | None | None |
| `condition` | Configuration for condition on this Cloud Bigtable resource. | false | false | This argument can affect security posture or operational safety and should align with organizational policy. | None | None |

### condition Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `expression` | Configuration for expression on this Cloud Bigtable resource. | false | false | This argument is primarily operational and should follow platform standards. | None | None |
| `title` | Configuration for title on this Cloud Bigtable resource. | false | false | This argument is primarily operational and should follow platform standards. | None | None |
| `description` | For `google_bigtable_instance_iam_policy` only: | false | false | This argument is primarily operational and should follow platform standards. | None | None |
| `policy_data` | Configuration for policy_data on this Cloud Bigtable resource. | false | false | This argument is primarily operational and should follow platform standards. | None | None |
