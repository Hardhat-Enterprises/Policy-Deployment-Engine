## 🛡️ Policy Deployment Engine: `network_services_service_lb_policies`

This section provides a concise policy evaluation for the `network_services_service_lb_policies` resource in GCP.

Reference: [Terraform Registry – network_services_service_lb_policies](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/network_services_service_lb_policies)

---

## 1. Argument Reference

### `name`
- Description: (Required) Name of the ServiceLbPolicy resource. It matches pattern `projects/{project}/locations/{location}/serviceLbPolicies/{service_lb_policy_name}`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Required) The location of the service lb policy.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) Set of label tags associated with the ServiceLbPolicy resource. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) A free-text description of the resource. Max length 1024 characters.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `load_balancing_algorithm`
- Description: (Optional) The type of load balancing algorithm to be used. The default behavior is WATERFALL_BY_REGION. Possible values are: `SPRAY_TO_REGION`, `SPRAY_TO_WORLD`, `WATERFALL_BY_REGION`, `WATERFALL_BY_ZONE`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `auto_capacity_drain`
- Description: (Optional) Option to specify if an unhealthy MIG/NEG should be considered for global load balancing and traffic routing. Structure is [documented below](#nested_auto_capacity_drain).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `failover_config`
- Description: (Optional) Option to specify health based failover behavior. This is not related to Network load balancer FailoverPolicy. Structure is [documented below](#nested_failover_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_auto_capacity_drain"></a>The `auto_capacity_drain` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enable`
- Description: (Optional) Optional. If set to 'True', an unhealthy MIG/NEG will be set as drained. - An MIG/NEG is considered unhealthy if less than 25% of the instances/endpoints in the MIG/NEG are healthy. - This option will never result in draining more than 50% of the configured IGs/NEGs for the Backend Service. <a name="nested_failover_config"></a>The `failover_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `failover_health_threshold`
- Description: (Required) Optional. The percentage threshold that a load balancer will begin to send traffic to failover backends. If the percentage of endpoints in a MIG/NEG is smaller than this value, traffic would be sent to failover backends if possible. This field should be set to a value between 1 and 99. The default value is 50 for Global external HTTP(S) load balancer (classic) and Proxyless service mesh, and 70 for others.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
