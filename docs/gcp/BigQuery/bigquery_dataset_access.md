## 🛡️ Policy Deployment Engine: `bigquery_dataset_access`

This section provides a concise policy evaluation for the `bigquery_dataset_access` resource in GCP.

Reference: [Terraform Registry – bigquery_dataset_access](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/bigquery_dataset_access)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `dataset_id` | A unique ID for this dataset, without the project name. The ID must contain only letters (a-z, A-Z), numbers (0-9), or underscores (_). The maximum length is 1,024 characters. | true | None | None |
| `role` | Describes the rights granted to the user specified by the other member of the access object. Basic, predefined, and custom roles are supported. Predefined roles that have equivalent basic roles are swapped by the API to their basic counterparts, and will show a diff post-create. See [official docs](https://cloud.google.com/bigquery/docs/access-control). | false | None | None |
| `user_by_email` | An email address of a user to grant access to. For example: fred@example.com | false | None | None |
| `group_by_email` | An email address of a Google Group to grant access to. | false | None | None |
| `domain` | A domain to grant access to. Any users signed in with the domain specified will be granted the specified access | false | None | None |
| `special_group` | A special group to grant access to. Possible values include: * `projectOwners`: Owners of the enclosing project. * `projectReaders`: Readers of the enclosing project. * `projectWriters`: Writers of the enclosing project. * `allAuthenticatedUsers`: All authenticated BigQuery users. | false | None | None |
| `iam_member` | Some other type of member that appears in the IAM Policy but isn't a user, group, domain, or special group. For example: `allUsers` | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### view Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `dataset_id` | The ID of the dataset containing this table. | true | None | None |
| `project_id` | The ID of the project containing this table. | true | None | None |
| `table_id` | The ID of the table. The ID must contain only letters (a-z, A-Z), numbers (0-9), or underscores (_). The maximum length is 1,024 characters. | true | None | None |

### dataset Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `dataset` | The dataset this entry applies to Structure is [documented below](#nested_dataset_dataset). | true | None | None |
| `target_types` | Which resources in the dataset this entry applies to. Currently, only views are supported, but additional target types may be added in the future. Possible values: VIEWS | true | None | None |
| `dataset_id` | The ID of the dataset containing this table. | true | None | None |
| `project_id` | The ID of the project containing this table. | true | None | None |

### routine Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `dataset_id` | The ID of the dataset containing this table. | true | None | None |
| `project_id` | The ID of the project containing this table. | true | None | None |
| `routine_id` | The ID of the routine. The ID must contain only letters (a-z, A-Z), numbers (0-9), or underscores (_). The maximum length is 256 characters. | true | None | None |

### condition Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `expression` | Textual representation of an expression in Common Expression Language syntax. | true | None | None |
| `title` | Title for the expression, i.e. a short string describing its purpose. This can be used e.g. in UIs which allow to enter the expression. | false | None | None |
| `description` | Description of the expression. This is a longer text which describes the expression, e.g. when hovered over it in a UI. | false | None | None |
| `location` | String indicating the location of the expression for error reporting, e.g. a file name and a position in the file. | false | None | None |
