## 🛡️ Policy Deployment Engine: `datastream_private_connection`

This section provides a concise policy evaluation for the `datastream_private_connection` resource in GCP.

Reference: [Terraform Registry – datastream_private_connection](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/datastream_private_connection)

---

## 1. Argument Reference

### `display_name`
- Description: (Required) Display name.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `private_connection_id`
- Description: (Required) The private connectivity identifier.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Required) The name of the location this private connection is located in.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) Labels. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `vpc_peering_config`
- Description: (Optional) The VPC Peering configuration is used to create VPC peering between Datastream and the consumer's VPC. Structure is [documented below](#nested_vpc_peering_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `psc_interface_config`
- Description: (Optional) The PSC Interface configuration is used to create PSC Interface between Datastream and the consumer's PSC. Structure is [documented below](#nested_psc_interface_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `create_without_validation`
- Description: (Optional) If set to true, will skip validations.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_vpc_peering_config"></a>The `vpc_peering_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `vpc`
- Description: (Required) Fully qualified name of the VPC that Datastream will peer to. Format: projects/{project}/global/{networks}/{name}
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `subnet`
- Description: (Required) A free subnet for peering. (CIDR of /29) <a name="nested_psc_interface_config"></a>The `psc_interface_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `network_attachment`
- Description: (Required) Fully qualified name of the network attachment that Datastream will connect to. Format: projects/{project}/regions/{region}/networkAttachments/{name} To get Datastream project for the accepted list: `gcloud datastream private-connections create [PC ID] --location=[LOCATION] --network-attachment=[NA URI] --validate-only --display-name=[ANY STRING]` Add Datastream project to the attachment accepted list: `gcloud compute network-attachments update [NA URI] --region=[NA region] --producer-accept-list=[TP from prev command]`
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
