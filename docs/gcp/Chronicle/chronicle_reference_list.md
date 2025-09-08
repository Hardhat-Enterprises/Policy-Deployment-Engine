## 🛡️ Policy Deployment Engine: `chronicle_reference_list`

This section provides a concise policy evaluation for the `chronicle_reference_list` resource in GCP.

Reference: [Terraform Registry – chronicle_reference_list](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/chronicle_reference_list)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `description` | Required. A user-provided description of the reference list. | true | None | None |
| `syntax_type` | Possible values: REFERENCE_LIST_SYNTAX_TYPE_PLAIN_TEXT_STRING REFERENCE_LIST_SYNTAX_TYPE_REGEX REFERENCE_LIST_SYNTAX_TYPE_CIDR | true | None | None |
| `location` | The location of the resource. This is the geographical region where the Chronicle instance resides, such as "us" or "europe-west2". | true | None | None |
| `instance` | The unique identifier for the Chronicle instance, which is the same as the customer ID. | true | None | None |
| `reference_list_id` | Required. The ID to use for the reference list. This is also the display name for the reference list. It must satisfy the following requirements: - Starts with letter. - Contains only letters, numbers and underscore. - Has length < 256. - Must be unique. | true | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### entries Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `value` | Required. The value of the entry. Maximum length is 512 characters. | true | None | None |
