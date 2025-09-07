## 🛡️ Policy Deployment Engine: `compute_interconnect_attachment_group`

This section provides a concise policy evaluation for the `compute_interconnect_attachment_group` resource in GCP.

Reference: [Terraform Registry – compute_interconnect_attachment_group](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_interconnect_attachment_group)

---

## 1. Argument Reference

### `name`
- Description: (Required) Name of the resource. Provided by the client when the resource is created. The name must be 1-63 characters long, and comply with RFC1035. Specifically, the name must be 1-63 characters long and match the regular expression `[a-z]([-a-z0-9]*[a-z0-9])?` which means the first character must be a lowercase letter, and all following characters must be a dash, lowercase letter, or digit, except the last character, which cannot be a dash.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `intent`
- Description: (Required) The user's intent for this group. This is the only required field besides the name that must be specified on group creation. Structure is [documented below](#nested_intent).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) An optional description of this resource. Provide this property when you create the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `attachments`
- Description: (Optional) Attachments in the AttachmentGroup. Keys are arbitrary user-specified strings. Users are encouraged, but not required, to use their preferred format for resource links as keys. Note that there are add-members and remove-members methods in gcloud. The size of this map is limited by an "Attachments per group" quota. Structure is [documented below](#nested_attachments).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `interconnect_group`
- Description: (Optional) The URL of an InterconnectGroup that groups these Attachments' Interconnects. Customers do not need to set this unless directed by Google Support.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_intent"></a>The `intent` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `availability_sla`
- Description: (Optional) Which SLA the user intends this group to support. Possible values are: `PRODUCTION_NON_CRITICAL`, `PRODUCTION_CRITICAL`, `NO_SLA`, `AVAILABILITY_SLA_UNSPECIFIED`. <a name="nested_attachments"></a>The `attachments` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `attachment`
- Description: (Optional)
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
