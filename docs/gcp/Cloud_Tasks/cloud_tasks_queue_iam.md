## 🛡️ Policy Deployment Engine: `cloud_tasks_queue_iam`

This section provides a concise policy evaluation for the `cloud_tasks_queue_iam` resource in GCP.

Reference: [Terraform Registry – cloud_tasks_queue_iam](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloud_tasks_queue_iam)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `location` | The location of the queue. If not specified, the value is taken from the parent resource or provider configuration. | false | false | Location determines where the IAM policy is applied but does not directly control authentication or authorization. | us-central1 | None |
| `name` | The name of the Cloud Tasks queue to which the IAM policy is attached. | true | false | The queue name identifies the target resource but does not directly affect security posture. | secure-cloud-tasks-queue | None |
| `project` | The ID of the project in which the resource belongs. If omitted, the provider project is used. | false | false | Project identifies where the IAM configuration is applied but is not itself a direct security control. | pde-project-vindya | None |
| `member/members` | Identities that will be granted the specified IAM role on the Cloud Tasks queue. | true | true | Public identities such as allUsers or allAuthenticatedUsers may expose the queue to unauthorised access and violate least privilege principles. | user:jane@example.com | allUsers |
| `role` | The IAM role applied to the specified members. | true | true | Overly privileged roles may grant excessive permissions and increase the risk of unauthorised actions on the queue. | roles/viewer | roles/owner |
| `policy_data` | IAM policy data generated from a google_iam_policy data source. | true | true | IAM policy data defines access permissions for the queue. Incorrect policy configuration may expose resources or grant excessive privileges. | Policy grants least-privilege access to authorised identities. | Policy grants public or overly privileged access. |
