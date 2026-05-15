## 🛡️ Policy Deployment Engine: `pubsub_subscription_iam`

This section provides a concise policy evaluation for the `pubsub_subscription_iam` resource in GCP.

Reference: [Terraform Registry – pubsub_subscription_iam](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/pubsub_subscription_iam)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `subscription` |  | false | false | None | None | None |
| `member/members` | Each entry can have one of the following values: * **allUsers**: A special identifier that represents anyone who is on the internet; with or without a Google account. * **allAuthenticatedUsers**: A special identifier that represents anyone who is authenticated with a Google account or a service account. * **user:{emailid}**: An email address that represents a specific Google account. For example, alice@gmail.com or joe@example.com. * **serviceAccount:{emailid}**: An email address that represents a service account. For example, my-other-app@appspot.gserviceaccount.com. * **group:{emailid}**: An email address that represents a Google group. For example, admins@example.com. * **domain:{domain}**: A G Suite domain (primary, instead of alias) name that represents all the users of that domain. For example, google.com or example.com. | false | true | Granting access to `allUsers` or `allAuthenticatedUsers` makes the subscription publicly accessible, exposing message data to anyone on the internet or any authenticated Google account. This can lead to unauthorized message consumption, data exfiltration, and denial-of-service by draining messages before legitimate subscribers can process them. | user:admin@example.com | allUsers |
| `role` | `google_pubsub_subscription_iam_binding` can be used per role. Note that custom roles must be of the format `[projects|organizations]/{parent-name}/roles/{role-name}`. | false | false | None | None | None |
| `policy_data` | a `google_iam_policy` data source. - - - | false | false | None | None | None |
| `project` | is not provided, the provider project is used. | false | false | None | None | None |
