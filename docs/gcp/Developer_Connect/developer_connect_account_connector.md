## 🛡️ Policy Deployment Engine: `developer_connect_account_connector`

This section provides a concise policy evaluation for the `developer_connect_account_connector` resource in GCP.

Reference: [Terraform Registry – developer_connect_account_connector](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/developer_connect_account_connector)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `location` | The location of the resource. | true | None | None |
| `account_connector_id` | Required. The ID to use for the AccountConnector, which will become the final component of the AccountConnector's resource name. Its format should adhere to https://google.aip.dev/122#resource-id-segments Names must be unique per-project per-location. | true | None | None |
| `annotations` | Optional. Allows users to store small amounts of arbitrary data. **Note**: This field is non-authoritative, and will only manage the annotations present in your configuration. Please refer to the field `effective_annotations` for all of the annotations present on the resource. | false | None | None |
| `labels` | Optional. Labels as key value pairs **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### provider_oauth_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `system_provider_id` | List of providers that are owned by Developer Connect. Possible values: GITHUB GITLAB GOOGLE SENTRY ROVO NEW_RELIC DATASTAX | false | None | None |
| `scopes` | Required. User selected scopes to apply to the Oauth config In the event of changing scopes, user records under AccountConnector will be deleted and users will re-auth again. | true | None | None |
