## 🛡️ Policy Deployment Engine: `chronicle_data_access_label`

This section provides a concise policy evaluation for the `chronicle_data_access_label` resource in GCP.

Reference: [Terraform Registry – chronicle_data_access_label](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/chronicle_data_access_label)

---

## 1. Argument Reference

### `udm_query`
- Description: (Required) A UDM query over event data.
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

### `data_access_label_id`
- Description: (Required) Required. The ID to use for the data access label, which will become the label's display name and the final component of the label's resource name. The maximum number of characters should be 63. Regex pattern is as per AIP: https://google.aip.dev/122#resource-id-segments
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) Optional. A description of the data access label for a human reader.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
