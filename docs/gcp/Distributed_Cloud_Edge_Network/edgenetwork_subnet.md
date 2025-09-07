## 🛡️ Policy Deployment Engine: `edgenetwork_subnet`

This section provides a concise policy evaluation for the `edgenetwork_subnet` resource in GCP.

Reference: [Terraform Registry – edgenetwork_subnet](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/edgenetwork_subnet)

---

## 1. Argument Reference

### `network`
- Description: (Required) The ID of the network to which this router belongs. Must be of the form: `projects/{{project}}/locations/{{location}}/zones/{{zone}}/networks/{{network_id}}`
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

### `subnet_id`
- Description: (Required) A unique ID that identifies this subnet.
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

### `ipv4_cidr`
- Description: (Optional) The ranges of ipv4 addresses that are owned by this subnetwork, in CIDR format.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ipv6_cidr`
- Description: (Optional) The ranges of ipv6 addresses that are owned by this subnetwork, in CIDR format.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `vlan_id`
- Description: (Optional) VLAN ID for this subnetwork. If not specified, one is assigned automatically.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
