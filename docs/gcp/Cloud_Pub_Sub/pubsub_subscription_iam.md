## 🛡️ Policy Deployment Engine: `pubsub_subscription_iam`

This section provides a concise policy evaluation for the `google_pubsub_subscription_iam_binding`, `google_pubsub_subscription_iam_member`, and `google_pubsub_subscription_iam_policy` resources in GCP.

Reference: [Terraform Registry – google_pubsub_subscription_iam](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/pubsub_subscription_iam)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `subscription` | The subscription name or ID to bind the IAM policy to. | true | false | None | None | None |
| `role` | The IAM role to grant. Custom roles must use the format `[projects\|organizations]/{parent-name}/roles/{role-name}`. | true | false | None | None | None |
| `member/members` | Identities granted the role. Can be user, serviceAccount, group, or domain. | true | true | Granting `allUsers` or `allAuthenticatedUsers` access to a subscription allows anyone to pull messages, acknowledge them, or seek the subscription — effectively letting attackers silently consume or delete production messages. Only named, authenticated identities should have subscription access. | serviceAccount:my-sa@my-project.iam.gserviceaccount.com | allAuthenticatedUsers |
| `project` | The project the subscription belongs to. If not provided, it is parsed from the subscription identifier. | false | false | None | None | None |
