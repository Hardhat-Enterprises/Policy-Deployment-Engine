## 🛡️ Policy Deployment Engine: `apigee_nat_address`

This section provides a concise policy evaluation for the `apigee_nat_address` resource in GCP.

Reference: [Terraform Registry – apigee_nat_address](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/apigee_nat_address)

---

## 1. Argument Reference

### `name`
- Description: (Required) Resource ID of the NAT address.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `instance_id`
- Description: (Required) The Apigee instance associated with the Apigee environment, in the format `organizations/{{org_name}}/instances/{{instance_name}}`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `activate`
- Description: (Optional) Flag that specifies whether the reserved NAT address should be activate.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
