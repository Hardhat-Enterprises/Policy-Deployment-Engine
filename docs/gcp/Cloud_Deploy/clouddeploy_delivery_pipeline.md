## 🛡️ Policy Deployment Engine: `clouddeploy_delivery_pipeline`

This section provides a concise policy evaluation for the `clouddeploy_delivery_pipeline` resource in GCP.

Reference: [Terraform Registry – clouddeploy_delivery_pipeline](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/clouddeploy_delivery_pipeline)

---

## 1. Argument Reference

### `location`
- Description: (Required) The location for the resource
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Required) Name of the `DeliveryPipeline`. Format is `[a-z]([a-z0-9-]{0,61}[a-z0-9])?`. - - -
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `annotations`
- Description: (Optional) User annotations. These attributes can only be set and used by the user, and not by Google Cloud Deploy. See https://google.aip.dev/128#annotations for more details such as format and size limitations. **Note**: This field is non-authoritative, and will only manage the annotations present in your configuration. Please refer to the field `effective_annotations` for all of the annotations present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) Description of the `DeliveryPipeline`. Max length is 255 characters.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) Labels are attributes that can be set and used by both the user and by Google Cloud Deploy. Labels must meet the following constraints: * Keys and values can contain only lowercase letters, numeric characters, underscores, and dashes. * All characters must use UTF-8 encoding, and international characters are allowed. * Keys must start with a lowercase letter or international character. * Each resource is limited to a maximum of 64 labels. Both keys and values are additionally constrained to be <= 128 bytes. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: (Optional) The project for the resource
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `serial_pipeline`
- Description: (Optional) SerialPipeline defines a sequential set of stages for a `DeliveryPipeline`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `suspended`
- Description: (Optional) When suspended, no new releases or rollouts can be created, but in-progress ones will complete.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

---

## 2. `serial_pipeline` Block

### `stages`
- Description: (Optional) Each stage specifies configuration for a `Target`. The ordering of this list defines the promotion flow.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

---

## 2. `stages` Block

### `deploy_parameters`
- Description: (Optional) Optional. The deploy parameters to use for the target in this stage.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `profiles`
- Description: (Optional) Skaffold profiles to use when rendering the manifest for this stage's `Target`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `strategy`
- Description: (Optional) Optional. The strategy to use for a `Rollout` to this stage.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `target_id`
- Description: (Optional) The target_id to which this stage points. This field refers exclusively to the last segment of a target name. For example, this field would just be `my-target` (rather than `projects/project/locations/location/targets/my-target`). The location of the `Target` is inferred to be the same as the location of the `DeliveryPipeline` that contains this `Stage`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

---

## 2. `deploy_parameters` Block

### `match_target_labels`
- Description: (Optional) Optional. Deploy parameters are applied to targets with match labels. If unspecified, deploy parameters are applied to all targets (including child targets of a multi-target).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `values`
- Description: (Required) Required. Values are deploy parameters in key-value pairs.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

---

## 2. `strategy` Block

### `canary`
- Description: (Optional) Canary deployment strategy provides progressive percentage based deployments to a Target.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `standard`
- Description: (Optional) Standard deployment strategy executes a single deploy and allows verifying the deployment.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

---

## 2. `canary` Block

### `canary_deployment`
- Description: (Optional) Configures the progressive based deployment for a Target.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `custom_canary_deployment`
- Description: (Optional) Configures the progressive based deployment for a Target, but allows customizing at the phase level where a phase represents each of the percentage deployments.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `runtime_config`
- Description: (Optional) Optional. Runtime specific configurations for the deployment strategy. The runtime configuration is used to determine how Cloud Deploy will split traffic to enable a progressive deployment.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

---

## 2. `canary_deployment` Block

### `percentages`
- Description: (Required) Required. The percentage based deployments that will occur as a part of a `Rollout`. List is expected in ascending order and each integer n is 0 <= n < 100.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `postdeploy`
- Description: (Optional) Optional. Configuration for the postdeploy job of the last phase. If this is not configured, postdeploy job will not be present.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `predeploy`
- Description: (Optional) Optional. Configuration for the predeploy job of the first phase. If this is not configured, predeploy job will not be present.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `verify`
- Description: (Optional) Whether to run verify tests after each percentage deployment.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

---

## 2. `postdeploy` Block

### `actions`
- Description: (Optional) Optional. A sequence of skaffold custom actions to invoke during execution of the postdeploy job.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `actions`
- Description: (Optional) Optional. A sequence of skaffold custom actions to invoke during execution of the postdeploy job.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `actions`
- Description: (Optional) Optional. A sequence of skaffold custom actions to invoke during execution of the postdeploy job.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

---

## 2. `predeploy` Block

### `actions`
- Description: (Optional) Optional. A sequence of skaffold custom actions to invoke during execution of the predeploy job.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `actions`
- Description: (Optional) Optional. A sequence of skaffold custom actions to invoke during execution of the predeploy job.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `actions`
- Description: (Optional) Optional. A sequence of skaffold custom actions to invoke during execution of the predeploy job.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

---

## 2. `custom_canary_deployment` Block

### `phase_configs`
- Description: (Required) Required. Configuration for each phase in the canary deployment in the order executed.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

---

## 2. `phase_configs` Block

### `percentage`
- Description: (Required) Required. Percentage deployment for the phase.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `phase_id`
- Description: (Required) Required. The ID to assign to the `Rollout` phase. This value must consist of lower-case letters, numbers, and hyphens, start with a letter and end with a letter or a number, and have a max length of 63 characters. In other words, it must match the following regex: `^[a-z]([a-z0-9-]{0,61}[a-z0-9])?$`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `postdeploy`
- Description: (Optional) Optional. Configuration for the postdeploy job of this phase. If this is not configured, postdeploy job will not be present for this phase.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `predeploy`
- Description: (Optional) Optional. Configuration for the predeploy job of this phase. If this is not configured, predeploy job will not be present for this phase.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `profiles`
- Description: (Optional) Skaffold profiles to use when rendering the manifest for this phase. These are in addition to the profiles list specified in the `DeliveryPipeline` stage.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `verify`
- Description: (Optional) Whether to run verify tests after the deployment.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

---

## 2. `runtime_config` Block

### `cloud_run`
- Description: (Optional) Cloud Run runtime configuration.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `kubernetes`
- Description: (Optional) Kubernetes runtime configuration.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

---

## 2. `cloud_run` Block

### `automatic_traffic_control`
- Description: (Optional) Whether Cloud Deploy should update the traffic stanza in a Cloud Run Service on the user's behalf to facilitate traffic splitting. This is required to be true for CanaryDeployments, but optional for CustomCanaryDeployments.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `canary_revision_tags`
- Description: (Optional) Optional. A list of tags that are added to the canary revision while the canary phase is in progress.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `prior_revision_tags`
- Description: (Optional) Optional. A list of tags that are added to the prior revision while the canary phase is in progress.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `stable_revision_tags`
- Description: (Optional) Optional. A list of tags that are added to the final stable revision when the stable phase is applied.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

---

## 2. `kubernetes` Block

### `gateway_service_mesh`
- Description: (Optional) Kubernetes Gateway API service mesh configuration.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `service_networking`
- Description: (Optional) Kubernetes Service networking configuration.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

---

## 2. `gateway_service_mesh` Block

### `deployment`
- Description: (Required) Required. Name of the Kubernetes Deployment whose traffic is managed by the specified HTTPRoute and Service.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `http_route`
- Description: (Required) Required. Name of the Gateway API HTTPRoute.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `pod_selector_label`
- Description: (Optional) Optional. The label to use when selecting Pods for the Deployment and Service resources. This label must already be present in both resources.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `route_destinations`
- Description: (Optional) Optional. Route destinations allow configuring the Gateway API HTTPRoute to be deployed to additional clusters. This option is available for multi-cluster service mesh set ups that require the route to exist in the clusters that call the service. If unspecified, the HTTPRoute will only be deployed to the Target cluster.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `route_update_wait_time`
- Description: (Optional) Optional. The time to wait for route updates to propagate. The maximum configurable time is 3 hours, in seconds format. If unspecified, there is no wait time.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `service`
- Description: (Required) Required. Name of the Kubernetes Service.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `stable_cutback_duration`
- Description: (Optional) Optional. The amount of time to migrate traffic back from the canary Service to the original Service during the stable phase deployment. If specified, must be between 15s and 3600s. If unspecified, there is no cutback time.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

---

## 2. `route_destinations` Block

### `destination_ids`
- Description: (Required) Required. The clusters where the Gateway API HTTPRoute resource will be deployed to. Valid entries include the associated entities IDs configured in the Target resource and "@self" to include the Target cluster.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `propagate_service`
- Description: (Optional) Optional. Whether to propagate the Kubernetes Service to the route destination clusters. The Service will always be deployed to the Target cluster even if the HTTPRoute is not. This option may be used to facilitiate successful DNS lookup in the route destination clusters. Can only be set to true if destinations are specified.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

---

## 2. `service_networking` Block

### `deployment`
- Description: (Required) Required. Name of the Kubernetes Deployment whose traffic is managed by the specified Service.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `disable_pod_overprovisioning`
- Description: (Optional) Optional. Whether to disable Pod overprovisioning. If Pod overprovisioning is disabled then Cloud Deploy will limit the number of total Pods used for the deployment strategy to the number of Pods the Deployment has on the cluster.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `pod_selector_label`
- Description: (Optional) Optional. The label to use when selecting Pods for the Deployment resource. This label must already be present in the Deployment.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `service`
- Description: (Required) Required. Name of the Kubernetes Service.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

---

## 2. `standard` Block

### `postdeploy`
- Description: (Optional) Optional. Configuration for the postdeploy job. If this is not configured, postdeploy job will not be present.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `predeploy`
- Description: (Optional) Optional. Configuration for the predeploy job. If this is not configured, predeploy job will not be present.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `verify`
- Description: (Optional) Whether to verify a deployment.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
