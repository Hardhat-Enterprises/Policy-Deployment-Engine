## 🛡️ Policy Deployment Engine: `beyondcorp_app_connector`

This section provides a concise policy evaluation for the `beyondcorp_app_connector` resource in GCP.

Reference: [Terraform Registry – beyondcorp_app_connector](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/beyondcorp_app_connector)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | ID of the AppConnector. | true | None | None |
| `region` | The region of the AppConnector. | false | None | None |
| `display_name` | An arbitrary user-provided name for the AppConnector. | false | None | None |
| `labels` | Resource labels to represent user provided metadata. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### principal_info Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `service_account` | ServiceAccount represents a GCP service account. Structure is [documented below](#nested_principal_info_service_account). | true | None | None |

### service_account Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `email` | Email address of the service account. | true | None | None |
