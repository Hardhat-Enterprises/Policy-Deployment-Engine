## 🛡️ Policy Deployment Engine: `pubsub_topic_iam`

This section provides a concise policy evaluation for the `google_pubsub_topic_iam_binding`, `google_pubsub_topic_iam_member`, and `google_pubsub_topic_iam_policy` resources in GCP.

Reference: [Terraform Registry – google_pubsub_topic_iam](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/pubsub_topic_iam)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `topic` | The topic name or ID to bind the IAM policy to. | true | false | None | None | None |
| `role` | The IAM role to grant. Custom roles must use the format `[projects\|organizations]/{parent-name}/roles/{role-name}`. | true | false | None | None | None |
| `member/members` | Identities granted the role. Can be user, serviceAccount, group, or domain. | true | true | Granting access to `allUsers` or `allAuthenticatedUsers` makes the topic publicly accessible, exposing sensitive messages and enabling abuse. Only named, authenticated principals should be permitted — this prevents data leakage and unauthorized message publishing. | serviceAccount:my-sa@my-project.iam.gserviceaccount.com | allUsers |
| `project` | The project the topic belongs to. If not provided, it is parsed from the topic identifier. | false | false | None | None | None |
