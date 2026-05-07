## 🛡️ Policy Deployment Engine: `discovery_engine_data_connector`

This section provides a concise policy evaluation for the `discovery_engine_data_connector` resource in GCP.

Reference: [Terraform Registry – discovery_engine_data_connector](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/discovery_engine_data_connector)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `data_source` |  The full resource name of the associated data store for the source entity | true | true | The source of the data may be confidential or set incorrectly | c-datasource, salesforce, jira, confluence, bigquery | Invalid data source |
| `location` | The geographic location where the data store should reside. The value can only be one of "global", "us" and "eu". | true | true | data residencey laws | us, eu, global | Us-West |
| `refresh_interval` | The refresh interval for data sync. | true | false | None | None | None |
| `collection_id` | The ID to use for the Collection. | true | false | IDs | None | None |
| `collection_display_name` | The display name of the Collection. | true | false | Names | None | None |
| `params` | Params needed to access the source in the format of String-to-String (Key, Value) pairs. | false | true | formating of keys to access the data. | Valid parameters | Invalid parameters |
| `json_params` | Params needed to access the source in the format of json string. | false | true | Has to be a valid string or else Json data could be leaked. | Valid string | Invalid string |
| `project` | If it is not provided, the provider project is used. | true | false | None | None | None |
