## 🛡️ Policy Deployment Engine: `pubsub_topic`

This section provides a concise policy evaluation for the `google_pubsub_topic` resource in GCP.

Reference: [Terraform Registry – google_pubsub_topic](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/pubsub_topic)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `name` | Name of the topic. | true | false | None | None | None |
| `kms_key_name` | The resource name of the Cloud KMS CryptoKey to be used to protect access to messages published on this topic. Format: `projects/*/locations/*/keyRings/*/cryptoKeys/*` | false | true | Without CMEK, Pub/Sub topics rely on Google-managed encryption. Specifying a customer-managed key gives full control over encryption, supports compliance requirements, and allows key revocation to immediately block data access. | projects/my-project/locations/global/keyRings/my-ring/cryptoKeys/my-key | None (key not set) |
| `labels` | A set of key/value label pairs to assign to this Topic. | false | false | None | None | None |
| `message_storage_policy` | Policy constraining the set of GCP regions where messages may be stored. | false | false | None | None | None |
| `message_retention_duration` | Minimum duration to retain a message after it is published. Cannot be more than 31 days or less than 10 minutes. | false | false | None | None | None |
| `project` | If it is not provided, the provider project is used. | false | false | None | None | None |
