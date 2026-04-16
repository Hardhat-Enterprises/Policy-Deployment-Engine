## 🛡️ Policy Deployment Engine: `artifact_registry_repository_iam`

This section provides a concise policy evaluation for the `artifact_registry_repository_iam` resource in GCP.

Reference: [Terraform Registry – artifact_registry_repository_iam](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/artifact_registry_repository_iam)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `location` | special values for multi-region locations are `asia`, `europe`, and `us`. See [here](https://cloud.google.com/artifact-registry/docs/repositories/repo-locations), or use the [google_artifact_registry_locations](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/artifact_registry_locations) data source for possible values. Used to find the parent resource to bind the IAM policy to. If not specified, the value will be parsed from the identifier of the parent resource. If no location is provided in the parent identifier and no location is specified, it is taken from the provider configuration. | false | false | None | None | None |
| `repository` | Used to find the parent resource to bind the IAM policy to. If not specified, the value will be parsed from the identifier of the parent resource. | true | false | None | None | None |
| `project` | If it is not provided, the project will be parsed from the identifier of the parent resource. If no project is provided in the parent identifier and no project is specified, the provider project is used. | false | false | None | None | None |
| `member/members` | Specifies principals (users, service accounts, groups, domains, or project roles) to bind the IAM role to. Cannot use allUsers or allAuthenticatedUsers. | true | false | Your IAM binding/member policies blacklist allUsers and allAuthenticatedUsers for members/member values. | ['member = "serviceAccount:ci@example-project.iam.gserviceaccount.com"', 'members = ["group:devops@example.com", "user:alice@example.com"]'] | ['member = "allUsers"', 'member = "allAuthenticatedUsers"', 'members = ["allUsers"]'] |
| `role` | `google_artifact_registry_repository_iam_binding` can be used per role. Note that custom roles must be of the format `[projects|organizations]/{parent-name}/roles/{role-name}`. | true | false | Your IAM role policies allow Artifact Registry roles only through a pattern whitelist: roles/artifactregistry.reader, roles/artifactregistry.writer, or roles/artifactregistry.admin. | ['role = "roles/artifactregistry.reader"', 'role = "roles/artifactregistry.writer"', 'role = "roles/artifactregistry.admin"'] | ['role = "roles/owner"', 'role = "roles/editor"', 'role = "roles/viewer"'] |
| `policy_data` | a `google_iam_policy` data source. | false | false | Your IAM policy_data policy expects embedded roles in policy_data to match approved Artifact Registry roles only. | ['policy_data containing roles/artifactregistry.reader', 'policy_data containing roles/artifactregistry.writer'] | ['policy_data containing roles/owner', 'policy_data containing roles/editor'] |
