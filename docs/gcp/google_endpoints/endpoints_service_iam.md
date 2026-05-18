## 🛡️ Policy Deployment Engine: `endpoints_service_iam`

This section provides a concise policy evaluation for the `endpoints_service_iam` resource in GCP.

Reference: [Terraform Registry – endpoints_service_iam](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/endpoints_service_iam)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `service_name` | The name of the Cloud Endpoints service that the IAM policy applies to. | true | true | The service_name identifies which Cloud Endpoints service the IAM binding applies to. Using the correct service name helps prevent IAM permissions from being applied to the wrong endpoint service. | api.endpoints.my-project-123.cloud.goog | api.example.com |
| `member/members` | Each entry can have one of the following values: * **allUsers**: A special identifier that represents anyone who is on the internet; with or without a Google account. * **allAuthenticatedUsers**: A special identifier that represents anyone who is authenticated with a Google account or a service account. * **user:{emailid}**: An email address that represents a specific Google account. For example, alice@gmail.com or joe@example.com. * **serviceAccount:{emailid}**: An email address that represents a service account. For example, my-other-app@appspot.gserviceaccount.com. * **group:{emailid}**: An email address that represents a Google group. For example, admins@example.com. * **domain:{domain}**: A G Suite domain name that represents all users of that domain. For example, google.com or example.com. * **projectOwner:projectid**: Owners of the given project. * **projectEditor:projectid**: Editors of the given project. * **projectViewer:projectid**: Viewers of the given project. | true | true | IAM members define who can access or manage the Cloud Endpoints service. Public principals such as allUsers and allAuthenticatedUsers can expose the service too broadly and should be avoided unless explicitly required. | user:alice@example.com | allUsers |
| `role` | `google_endpoints_service_iam_binding` can be used per role. Custom roles must use the format `[projects|organizations]/{parent-name}/roles/{role-name}`. | true | true | The IAM role controls the permissions granted on the Cloud Endpoints service. Avoiding service agent roles and overly privileged roles helps enforce least privilege. | roles/viewer | roles/endpoints.serviceAgent |
| `policy_data` | A `google_iam_policy` data source used to define IAM policy data. | false | true | Policy data can define broad IAM access. It should be reviewed to ensure only approved roles and principals are included. | IAM policy data grants approved roles to approved principals only. | IAM policy data grants service agent roles, owner roles, or public access to allUsers. |
