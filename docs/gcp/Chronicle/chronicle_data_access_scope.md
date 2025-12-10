## 🛡️ Policy Deployment Engine: `chronicle_data_access_scope`

This section provides a concise policy evaluation for the `chronicle_data_access_scope` resource in GCP.

Reference: [Terraform Registry – chronicle_data_access_scope](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/chronicle_data_access_scope)

---

## Argument Reference
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `location` | The location of the resource. This is the geographical region where the Chronicle instance resides, such as "us" or "europe-west2". | true | true | Restricting to allowed locations ensures compliance with regional data residency, privacy regulations, and service availability. | australia-southeast1 | Any location not in the approved list, e.g., europe-west3, us-central1, asia-northeast1 |
| `instance` | The unique identifier for the Chronicle instance, which is the same as the customer ID. | true | false | None | None | None |
| `data_access_scope_id` | Required. The user provided scope id which will become the last part of the name of the scope resource. Needs to be compliant with https://google.aip.dev/122 | true | false | None | None | None |
| `allowed_data_access_labels` | The allowed labels for the scope. There has to be at least one label allowed for the scope to be valid. The logical operator for evaluation of the allowed labels is OR. Either allow_all or allowed_data_access_labels needs to be provided. E.g.: A customer with scope with allowed labels A and B will be able to see data with labeled with A or B or (A and B). Structure is [documented below](#nested_allowed_data_access_labels). | true | true | Without any allowed labels or allow_all set to true, the scope becomes ineffective and may lead to incorrect or overly permissive data visibility. | ['Automatic entries', 'APIs', 'Integrations'] | ['Manual entries', 'Empty or missing labels'] |
| `allow_all` | Whether or not the scope allows all labels, allow_all and allowed_data_access_labels are mutually exclusive and one of them must be present. denied_data_access_labels can still be used along with allow_all. When combined with denied_data_access_labels, access will be granted to all data that doesn't have labels mentioned in denied_data_access_labels. E.g.: A customer with scope with denied labels A and B and allow_all will be able to see all data except data labeled with A and data labeled with B and data with labels A and B. | true | true | Improper use of `allow_all = true` may result in overly permissive access to sensitive datasets. It should be used only when necessary and accompanied by denied labels to restrict risky access. | False | True |
| `denied_data_access_labels` | Optional. The denied labels for the scope. The logical operator for evaluation of the denied labels is AND. E.g.: A customer with scope with denied labels A and B won't be able to see data labeled with A and data labeled with B and data with labels A and B. Structure is [documented below](#nested_denied_data_access_labels). | false | false | None | None | None |
| `description` | Optional. A description of the data access scope for a human reader. | false | false | None | None | None |
| `project` | If it is not provided, the provider project is used. | false | false | None | None | None |
| `ingestion_label` |  | false | false | None | None | None |

### allowed_data_access_labels Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `data_access_label` | The name of the data access label. | false | false | None | None | None |
| `log_type` | The name of the log type. | false | false | None | None | None |
| `asset_namespace` | The asset namespace configured in the forwarder of the customer's events. | false | false | None | None | None |
| `ingestion_label` | Representation of an ingestion label type. Structure is [documented below](#nested_allowed_data_access_labels_allowed_data_access_labels_ingestion_label). | false | false | None | None | None |
| `display_name` | (Output) Output only. The display name of the label. Data access label and log types's name will match the display name of the resource. The asset namespace will match the namespace itself. The ingestion key value pair will match the key of the tuple. | false | false | None | None | None |

### denied_data_access_labels Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `display_name` | (Output) Output only. The display name of the label. Data access label and log types's name will match the display name of the resource. The asset namespace will match the namespace itself. The ingestion key value pair will match the key of the tuple. | false | false | None | None | None |
| `data_access_label` | The name of the data access label. | false | false | None | None | None |
| `log_type` | The name of the log type. | false | false | None | None | None |
| `asset_namespace` | The asset namespace configured in the forwarder of the customer's events. | false | false | None | None | None |
| `ingestion_label` | Representation of an ingestion label type. Structure is [documented below](#nested_denied_data_access_labels_denied_data_access_labels_ingestion_label). | false | false | None | None | None |

### ingestion_label Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `ingestion_label_key` | Required. The key of the ingestion label. Always required. | true | false | None | None | None |
| `ingestion_label_value` | Optional. The value of the ingestion label. Optional. An object with no provided value and some key provided would match against the given key and ANY value. | false | false | None | None | None |
