## 🛡️ Policy Deployment Engine: `sourcerepo_repository`

This section provides a concise policy evaluation for the `sourcerepo_repository` resource in GCP.

Reference: [Terraform Registry – sourcerepo_repository](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/sourcerepo_repository)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | Resource name of the repository, of the form `{{repo}}`. The repo name may contain slashes. eg, `name/with/slash` | true | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |
| `create_ignore_already_exists` |  | none | None | None |

### pubsub_configs Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `topic` |  | none | None | None |
| `message_format` | The format of the Cloud Pub/Sub messages. - PROTOBUF: The message payload is a serialized protocol buffer of SourceRepoEvent. - JSON: The message payload is a JSON string of SourceRepoEvent. Possible values are: `PROTOBUF`, `JSON`. | true | None | None |
| `service_account_email` | Email address of the service account used for publishing Cloud Pub/Sub messages. This service account needs to be in the same project as the PubsubConfig. When added, the caller needs to have iam.serviceAccounts.actAs permission on this service account. If unspecified, it defaults to the compute engine default service account. | false | None | None |
