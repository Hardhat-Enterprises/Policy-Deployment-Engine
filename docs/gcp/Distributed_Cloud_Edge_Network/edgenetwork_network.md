## 🛡️ Policy Deployment Engine: `edgenetwork_network`

This section provides a concise policy evaluation for the `edgenetwork_network` resource in GCP.

Reference: [Terraform Registry – edgenetwork_network](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/edgenetwork_network)

---

## 1. Argument Reference

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

### `network_id`
- Description: (Required) A unique ID that identifies this network.
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
- Description: (Optional) IP (L3) MTU value of the network. Default value is `1500`. Possible values are: `1500`, `9000`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
