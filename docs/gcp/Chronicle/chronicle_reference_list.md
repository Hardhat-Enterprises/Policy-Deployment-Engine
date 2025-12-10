## 🛡️ Policy Deployment Engine: `chronicle_reference_list`

This section provides a concise policy evaluation for the `chronicle_reference_list` resource in GCP.

Reference: [Terraform Registry – chronicle_reference_list](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/chronicle_reference_list)

---

## Argument Reference
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `description` | Required. A user-provided description of the reference list. | true | false | None | None | None |
| `entries` | Required. The entries of the reference list. When listed, they are returned in the order that was specified at creation or update. The combined size of the values of the reference list may not exceed 6MB. This is returned only when the view is REFERENCE_LIST_VIEW_FULL. Structure is [documented below](#nested_entries). | true | false | None | None | None |
| `syntax_type` | Possible values: REFERENCE_LIST_SYNTAX_TYPE_PLAIN_TEXT_STRING REFERENCE_LIST_SYNTAX_TYPE_REGEX REFERENCE_LIST_SYNTAX_TYPE_CIDR | true | false | None | None | None |
| `location` | The location of the resource. This is the geographical region where the Chronicle instance resides, such as "us" or "europe-west2". | true | true | Restricting Chronicle resources to approved regions ensures compliance with data residency and service availability requirements. | australia-southeast1 | Any location other than 'australia-southeast1', such as 'europe-west3', is considered non-compliant. |
| `instance` | The unique identifier for the Chronicle instance, which is the same as the customer ID. | true | false | None | None | None |
| `reference_list_id` | Required. The ID to use for the reference list. This is also the display name for the reference list. It must satisfy the following requirements: - Starts with letter. - Contains only letters, numbers and underscore. - Has length < 256. - Must be unique. | true | false | None | None | None |
| `project` | If it is not provided, the provider project is used. | false | false | None | None | None |

### entries Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `value` | Required. The value of the entry. Maximum length is 512 characters. | true | false | None | None | None |
