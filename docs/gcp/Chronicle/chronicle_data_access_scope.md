## 🛡️ Policy Deployment Engine: `chronicle_data_access_scope`

This section provides a concise policy evaluation for the `chronicle_data_access_scope` resource in GCP.

Reference: [Terraform Registry – chronicle_data_access_scope](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/chronicle_data_access_scope)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `location` | The location of the resource. This is the geographical region where the Chronicle instance resides, such as "us" or "europe-west2". | true | None | None |
| `instance` | The unique identifier for the Chronicle instance, which is the same as the customer ID. | true | None | None |
| `data_access_scope_id` | Required. The user provided scope id which will become the last part of the name of the scope resource. Needs to be compliant with https://google.aip.dev/122 | true | None | None |
| `allow_all` | Optional. Whether or not the scope allows all labels, allow_all and allowed_data_access_labels are mutually exclusive and one of them must be present. denied_data_access_labels can still be used along with allow_all. When combined with denied_data_access_labels, access will be granted to all data that doesn't have labels mentioned in denied_data_access_labels. E.g.: A customer with scope with denied labels A and B and allow_all will be able to see all data except data labeled with A and data labeled with B and data with labels A and B. | false | None | None |
| `description` | Optional. A description of the data access scope for a human reader. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### allowed_data_access_labels Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `data_access_label` | The name of the data access label. | false | None | None |
| `log_type` | The name of the log type. | false | None | None |
| `asset_namespace` | The asset namespace configured in the forwarder of the customer's events. | false | None | None |
| `ingestion_label` | Representation of an ingestion label type. Structure is [documented below](#nested_allowed_data_access_labels_allowed_data_access_labels_ingestion_label). | false | None | None |
| `display_name` | (Output) Output only. The display name of the label. Data access label and log types's name will match the display name of the resource. The asset namespace will match the namespace itself. The ingestion key value pair will match the key of the tuple. | none | None | None |

### denied_data_access_labels Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `display_name` | (Output) Output only. The display name of the label. Data access label and log types's name will match the display name of the resource. The asset namespace will match the namespace itself. The ingestion key value pair will match the key of the tuple. | none | None | None |
| `data_access_label` | The name of the data access label. | false | None | None |
| `log_type` | The name of the log type. | false | None | None |
| `asset_namespace` | The asset namespace configured in the forwarder of the customer's events. | false | None | None |
| `ingestion_label` | Representation of an ingestion label type. Structure is [documented below](#nested_denied_data_access_labels_denied_data_access_labels_ingestion_label). | false | None | None |

### ingestion_label Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `ingestion_label_key` | Required. The key of the ingestion label. Always required. | true | None | None |
| `ingestion_label_value` | Optional. The value of the ingestion label. Optional. An object with no provided value and some key provided would match against the given key and ANY value. | false | None | None |
