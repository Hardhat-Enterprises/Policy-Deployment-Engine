## 🛡️ Policy Deployment Engine: `beyondcorp_app_connector`

This section provides a concise policy evaluation for the `beyondcorp_app_connector` resource in GCP.

Reference: [Terraform Registry – beyondcorp_app_connector](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/beyondcorp_app_connector)

---

## Argument Reference
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `name` | ID of the AppConnector. | true | false | The name field is required to uniquely identify the AppConnector resource within a project and location. | None | None |
| `principal_info` | Principal information about the Identity of the AppConnector. Structure is [documented below](#nested_principal_info). | true | false | This information is required to establish the identity of the AppConnector for authentication and authorization purposes. | None | None |
| `region` | The region of the AppConnector. | false | true | The region field is used to specify the geographical location of the AppConnector, which can have implications for data residency and latency. | australia-southeast1, australia-southeast2 | europe-west1, us-central1 |
| `logging_enabled` | shows logging is enabled or not for the AppConnector. | false | true | Logging is required to provide visibility into connector activity and to support auditing and incident investigation. | true | false |
| `tls_enabled` | Indicating secure TLS connection or not for communications handled by the AppConnector. | false | true | TLS ensures that data exchanged through the connector is encrypted in transit, protecting it from interception or tampering. | true | false |
| `display_name` | An arbitrary user-provided name for the AppConnector. | false | false | Display name is for user convenience and does not impact security. | None | None |
| `labels` | Resource labels to represent user provided metadata. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | false | Labels are used for metadata and do not directly impact security. | None | None |
| `project` | If it is not provided, the provider project is used. | false | false | The project field is used to identify the project resource. Some organisations may have policies that restrict which projects can be used, but this is not inherently a security issue. | None | None |
| `service_account` | ServiceAccount represents a GCP service account. Structure is [documented below](#nested_principal_info_service_account). | true | false | The service account is used to authenticate the AppConnector with GCP services. | None | None |

### principal_info Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `service_account` | ServiceAccount represents a GCP service account. Structure is [documented below](#nested_principal_info_service_account). | true | false | The service account is used to authenticate the AppConnector with GCP services. | None | None |

### service_account Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `email` | Email address of the service account. | true | false | The email address is used to identify the service account. | None | None |
