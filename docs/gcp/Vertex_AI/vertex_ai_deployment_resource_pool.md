## 🛡️ Policy Deployment Engine: `vertex_ai_deployment_resource_pool`

This section provides a concise policy evaluation for the `vertex_ai_deployment_resource_pool` resource in GCP.

Reference: [Terraform Registry – vertex_ai_deployment_resource_pool](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/vertex_ai_deployment_resource_pool)

---

## 1. Argument Reference

### `name`
- Description: (Required) The resource name of deployment resource pool. The maximum length is 63 characters, and valid characters are `/^[a-z]([a-z0-9-]{0,61}[a-z0-9])?$/`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `dedicated_resources`
- Description: (Optional) The underlying dedicated resources that the deployment resource pool uses. Structure is [documented below](#nested_dedicated_resources).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `region`
- Description: (Optional) The region of deployment resource pool. eg us-central1
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_dedicated_resources"></a>The `dedicated_resources` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `machine_spec`
- Description: (Required) The specification of a single machine used by the prediction Structure is [documented below](#nested_dedicated_resources_machine_spec).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `min_replica_count`
- Description: (Required) The minimum number of machine replicas this DeployedModel will be always deployed on. This value must be greater than or equal to 1. If traffic against the DeployedModel increases, it may dynamically be deployed onto more replicas, and as traffic decreases, some of these extra replicas may be freed.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `max_replica_count`
- Description: (Optional) The maximum number of replicas this DeployedModel may be deployed on when the traffic against it increases. If the requested value is too large, the deployment will error, but if deployment succeeds then the ability to scale the model to that many replicas is guaranteed (barring service outages). If traffic against the DeployedModel increases beyond what its replicas at maximum may handle, a portion of the traffic will be dropped. If this value is not provided, will use min_replica_count as the default value. The value of this field impacts the charge against Vertex CPU and GPU quotas. Specifically, you will be charged for max_replica_count * number of cores in the selected machine type) and (max_replica_count * number of GPUs per replica in the selected machine type).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `autoscaling_metric_specs`
- Description: (Optional) A list of the metric specifications that overrides a resource utilization metric. Structure is [documented below](#nested_dedicated_resources_autoscaling_metric_specs). <a name="nested_dedicated_resources_machine_spec"></a>The `machine_spec` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `machine_type`
- Description: (Optional) The type of the machine. See the [list of machine types supported for prediction](https://cloud.google.com/vertex-ai/docs/predictions/configure-compute#machine-types).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `accelerator_type`
- Description: (Optional) The type of accelerator(s) that may be attached to the machine as per accelerator_count. See possible values [here](https://cloud.google.com/vertex-ai/docs/reference/rest/v1/MachineSpec#AcceleratorType).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `accelerator_count`
- Description: (Optional) The number of accelerators to attach to the machine. <a name="nested_dedicated_resources_autoscaling_metric_specs"></a>The `autoscaling_metric_specs` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `metric_name`
- Description: (Required) The resource metric name. Supported metrics: For Online Prediction: * `aiplatform.googleapis.com/prediction/online/accelerator/duty_cycle` * `aiplatform.googleapis.com/prediction/online/cpu/utilization`
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `target`
- Description: (Optional) The target resource utilization in percentage (1% - 100%) for the given metric; once the real usage deviates from the target by a certain percentage, the machine replicas change. The default value is 60 (representing 60%) if not provided.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
