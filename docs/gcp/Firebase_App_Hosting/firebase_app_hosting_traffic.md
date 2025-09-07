## 🛡️ Policy Deployment Engine: `firebase_app_hosting_traffic`

This section provides a concise policy evaluation for the `firebase_app_hosting_traffic` resource in GCP.

Reference: [Terraform Registry – firebase_app_hosting_traffic](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/firebase_app_hosting_traffic)

---

## 1. Argument Reference

### `location`
- Description: (Required) The location the Backend that this Traffic config applies to
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `backend`
- Description: (Required) Id of the backend that this Traffic config applies to
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `target`
- Description: (Optional) Set to manually control the desired traffic for the backend. This will cause current to eventually match this value. The percentages must add up to 100. Structure is [documented below](#nested_target).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `rollout_policy`
- Description: (Optional) The policy for how builds and rollouts are triggered and rolled out. Structure is [documented below](#nested_rollout_policy).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_target"></a>The `target` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `splits`
- Description: (Required) A list of traffic splits that together represent where traffic is being routed. Structure is [documented below](#nested_target_splits). <a name="nested_target_splits"></a>The `splits` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `build`
- Description: (Required) The build that traffic is being routed to.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `percent`
- Description: (Required) The percentage of traffic to send to the build. Currently must be 100 or 0. <a name="nested_rollout_policy"></a>The `rollout_policy` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `disabled`
- Description: (Optional) A flag that, if true, prevents rollouts from being created via this RolloutPolicy.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `disabled_time`
- Description: (Output) If disabled is set, the time at which the rollouts were disabled.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `codebase_branch`
- Description: (Optional) Specifies a branch that triggers a new build to be started with this policy. If not set, no automatic rollouts will happen.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
