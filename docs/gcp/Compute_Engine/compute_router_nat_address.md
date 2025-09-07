## 🛡️ Policy Deployment Engine: `compute_router_nat_address`

This section provides a concise policy evaluation for the `compute_router_nat_address` resource in GCP.

Reference: [Terraform Registry – compute_router_nat_address](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_router_nat_address)

---

## 1. Argument Reference

### `nat_ips`
- Description: (Required) Self-links of NAT IPs to be used in a Nat service. Only valid if the referenced RouterNat natIpAllocateOption is set to MANUAL_ONLY.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `router`
- Description: (Required) The name of the Cloud Router in which the referenced NAT service is configured.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `router_nat`
- Description: (Required) The name of the Nat service in which this address will be configured.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `drain_nat_ips`
- Description: (Optional) A list of URLs of the IP resources to be drained. These IPs must be valid static external IPs that have been assigned to the NAT.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `region`
- Description: (Optional) Region where the NAT service reside.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
