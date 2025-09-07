## 🛡️ Policy Deployment Engine: `apigee_dns_zone`

This section provides a concise policy evaluation for the `apigee_dns_zone` resource in GCP.

Reference: [Terraform Registry – apigee_dns_zone](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/apigee_dns_zone)

---

## 1. Argument Reference

### `domain`
- Description: (Required) Doamin for the zone.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Required) Description for the zone.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `peering_config`
- Description: (Required) Peering zone config Structure is [documented below](#nested_peering_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `org_id`
- Description: (Required) The Apigee Organization associated with the Apigee instance, in the format `organizations/{{org_name}}`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `dns_zone_id`
- Description: (Required) ID of the dns zone. <a name="nested_peering_config"></a>The `peering_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `target_project_id`
- Description: (Required) The ID of the project that contains the producer VPC network.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `target_network_id`
- Description: (Required) The name of the producer VPC network.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
