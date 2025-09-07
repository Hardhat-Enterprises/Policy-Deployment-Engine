## 🛡️ Policy Deployment Engine: `sourcerepo_repository`

This section provides a concise policy evaluation for the `sourcerepo_repository` resource in GCP.

Reference: [Terraform Registry – sourcerepo_repository](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/sourcerepo_repository)

---

## 1. Argument Reference

### `name`
- Description: (Required) Resource name of the repository, of the form `{{repo}}`. The repo name may contain slashes. eg, `name/with/slash`
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `pubsub_configs`
- Description: (Optional) How this repository publishes a change in the repository through Cloud Pub/Sub. Keyed by the topic names. Structure is [documented below](#nested_pubsub_configs).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `create_ignore_already_exists`
- Description: <a name="nested_pubsub_configs"></a>The `pubsub_configs` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `topic`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `message_format`
- Description: (Required) The format of the Cloud Pub/Sub messages. - PROTOBUF: The message payload is a serialized protocol buffer of SourceRepoEvent. - JSON: The message payload is a JSON string of SourceRepoEvent. Possible values are: `PROTOBUF`, `JSON`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `service_account_email`
- Description: (Optional) Email address of the service account used for publishing Cloud Pub/Sub messages. This service account needs to be in the same project as the PubsubConfig. When added, the caller needs to have iam.serviceAccounts.actAs permission on this service account. If unspecified, it defaults to the compute engine default service account.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
