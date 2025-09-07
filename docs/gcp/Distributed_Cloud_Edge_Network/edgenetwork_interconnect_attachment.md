## 🛡️ Policy Deployment Engine: `edgenetwork_interconnect_attachment`

This section provides a concise policy evaluation for the `edgenetwork_interconnect_attachment` resource in GCP.

Reference: [Terraform Registry – edgenetwork_interconnect_attachment](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/edgenetwork_interconnect_attachment)

---

## 1. Argument Reference

### `interconnect`
- Description: (Required) The ID of the underlying interconnect that this attachment's traffic will traverse through.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `network`
- Description: (Required) The ID of the network to which this interconnect attachment belongs. Must be of the form: `projects/{{project}}/locations/{{location}}/zones/{{zone}}/networks/{{network_id}}`
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `vlan_id`
- Description: (Required) VLAN ID provided by user. Must be site-wise unique.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Required) The Google Cloud region to which the target Distributed Cloud Edge zone belongs.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `zone`
- Description: (Required) The name of the target Distributed Cloud Edge zone.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `interconnect_attachment_id`
- Description: (Required) A unique ID that identifies this interconnect attachment.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) Labels associated with this resource. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) A free-text description of the resource. Max length 1024 characters.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `mtu`
- Description: (Optional) IP (L3) MTU value of the virtual edge cloud. Default value is `1500`. Possible values are: `1500`, `9000`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
