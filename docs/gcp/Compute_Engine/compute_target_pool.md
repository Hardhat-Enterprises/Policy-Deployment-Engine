## 🛡️ Policy Deployment Engine: `compute_target_pool`

This section provides a concise policy evaluation for the `compute_target_pool` resource in GCP.

Reference: [Terraform Registry – compute_target_pool](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_target_pool)

---

## 1. Argument Reference

### `name`
- Description: this forces a new resource to be created. - - -
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `backup_pool`
- Description: failover_ratio.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `failover_ratio`
- Description: backup pool (which must also be set).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `health_checks`
- Description: legacy `google_compute_http_health_check` is supported.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `instances`
- Description: URLs, or in the form of "zone/name". Note that the instances need not exist at the time of target pool creation, so there is no need to use the Terraform interpolators to create a dependency on the instances from the target pool.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: is not provided, the provider project is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `region`
- Description: region.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `session_affinity`
- Description: affinity). "CLIENT_IP" (hash of the source/dest addresses / ports), and "CLIENT_IP_PROTO" also includes the protocol (default "NONE").
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `security_policy`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
