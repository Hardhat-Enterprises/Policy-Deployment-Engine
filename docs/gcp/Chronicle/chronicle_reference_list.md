## 🛡️ Policy Deployment Engine: `chronicle_reference_list`

This section provides a concise policy evaluation for the `chronicle_reference_list` resource in GCP.

Reference: [Terraform Registry – chronicle_reference_list](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/chronicle_reference_list)

---

## 1. Argument Reference

### `description`
- Description: (Required) Required. A user-provided description of the reference list.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `entries`
- Description: (Required) Required. The entries of the reference list. When listed, they are returned in the order that was specified at creation or update. The combined size of the values of the reference list may not exceed 6MB. This is returned only when the view is REFERENCE_LIST_VIEW_FULL. Structure is [documented below](#nested_entries).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `syntax_type`
- Description: (Required) Possible values: REFERENCE_LIST_SYNTAX_TYPE_PLAIN_TEXT_STRING REFERENCE_LIST_SYNTAX_TYPE_REGEX REFERENCE_LIST_SYNTAX_TYPE_CIDR
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Required) The location of the resource. This is the geographical region where the Chronicle instance resides, such as "us" or "europe-west2".
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `instance`
- Description: (Required) The unique identifier for the Chronicle instance, which is the same as the customer ID.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `reference_list_id`
- Description: (Required) Required. The ID to use for the reference list. This is also the display name for the reference list. It must satisfy the following requirements: - Starts with letter. - Contains only letters, numbers and underscore. - Has length < 256. - Must be unique.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_entries"></a>The `entries` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `value`
- Description: (Required) Required. The value of the entry. Maximum length is 512 characters.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
