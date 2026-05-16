## 🛡️ Policy Deployment Engine: `spanner_database_iam`

This section provides a concise policy evaluation for the `spanner_database_iam` resource in GCP.

Reference: [Terraform Registry – spanner_database_iam](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/spanner_database_iam)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `database` |  | false | false | None | None | None |
| `instance` |  | false | false | None | None | None |
| `member/members` | Each entry can have one of the following values: * **allUsers**: A special identifier that represents anyone who is on the internet; with or without a Google account. * **allAuthenticatedUsers**: A special identifier that represents anyone who is authenticated with a Google account or a service account. * **user:{emailid}**: An email address that represents a specific Google account. For example, alice@gmail.com or joe@example.com. * **serviceAccount:{emailid}**: An email address that represents a service account. For example, my-other-app@appspot.gserviceaccount.com. * **group:{emailid}**: An email address that represents a Google group. For example, admins@example.com. * **domain:{domain}**: A G Suite domain (primary, instead of alias) name that represents all the users of that domain. For example, google.com or example.com. | false | false | None | None | None |
| `role` | `google_spanner_database_iam_binding` can be used per role. Note that custom roles must be of the format `[projects|organizations]/{parent-name}/roles/{role-name}`. | false | false | None | None | None |
| `policy_data` | a `google_iam_policy` data source. | false | false | None | None | None |
| `project` | is not provided, the provider project is used. | false | false | None | None | None |
| `condition` | Structure is [documented below](#nested_condition). --- | false | false | None | None | None |

### condition Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `expression` |  | false | false | None | None | None |
| `title` |  | false | false | None | None | None |
| `description` | ~> **Warning:** Terraform considers the `role` and condition contents (`title`+`description`+`expression`) as the identifier for the binding. This means that if any part of the condition is changed out-of-band, Terraform will consider it to be an entirely different resource and will treat it as such. | false | false | None | None | None |
