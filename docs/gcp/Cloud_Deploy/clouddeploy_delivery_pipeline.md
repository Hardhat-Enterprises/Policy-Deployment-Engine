## 🛡️ Policy Deployment Engine: `clouddeploy_delivery_pipeline`

This section provides a concise policy evaluation for the `clouddeploy_delivery_pipeline` resource in GCP.

Reference: [Terraform Registry – clouddeploy_delivery_pipeline](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/clouddeploy_delivery_pipeline)

---

## Argument Reference
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `location` | The location for the resource | true | false | Geographic/regional identifier only. Determines where the resource is stored but has no access control implications. | None | None |
| `name` | Name of the `DeliveryPipeline`. Format is `[a-z]([a-z0-9-]{0,61}[a-z0-9])?`. - - - | true | false | Simple string identifier with no security implications. Cannot be used to access resources or execute code. | None | None |
| `annotations` | User annotations. These attributes can only be set and used by the user, and not by Google Cloud Deploy. See https://google.aip.dev/128#annotations for more details such as format and size limitations. **Note**: This field is non-authoritative, and will only manage the annotations present in your configuration. Please refer to the field `effective_annotations` for all of the annotations present on the resource. | false | false | Key-value metadata for user documentation only. Explicitly stated as 'can only be set and used by the user, and not by Cloud Deploy' - no operational impact. | None | None |
| `description` | Description of the `DeliveryPipeline`. Max length is 255 characters. | false | false | Key-value metadata for user documentation only. Explicitly stated as 'can only be set and used by the user, and not by Cloud Deploy' - no operational impact. | None | None |
| `labels` | Labels are attributes that can be set and used by both the user and by Google Cloud Deploy. Labels must meet the following constraints: * Keys and values can contain only lowercase letters, numeric characters, underscores, and dashes. * All characters must use UTF-8 encoding, and international characters are allowed. * Keys must start with a lowercase letter or international character. * Each resource is limited to a maximum of 64 labels. Both keys and values are additionally constrained to be <= 128 bytes. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | false | Metadata tags that could theoretically be used for resource selection, but in this context they're organizational markers with no execution or access control implications. | None | None |
| `project` | The project for the resource | false | false | Specifies resource ownership/billing scope. Access is already controlled by Google Cloud IAM at the project level. | None | None |
| `serial_pipeline` | SerialPipeline defines a sequential set of stages for a `DeliveryPipeline`. | false | false | Pipeline structure configuration - defines stages but doesn't control execution permissions or access external resources. | None | None |
| `suspended` | When suspended, no new releases or rollouts can be created, but in-progress ones will complete. | false | true | Controls whether the pipeline can execute deployments. Can be used to disable deployments in security incidents, but also could be maliciously set to cause denial of service. | False | True |
| `stages` | Configuration for deployment stages. | false | false | Stage configuration container - security impact comes from nested arguments, not the container itself. | None | None |
| `deploy_parameters` | Deploy parameters configuration block | false | false | : Environment-specific deployment parameters are typically configuration values, not security controls. Validation should be handled at the application level | None | None |
| `strategy` | Deployment strategy configuration. | false | false | Container for deployment strategy options - security impact comes from nested custom actions, not strategy type. | None | None |
| `canary` |  | false | false | None | None | None |
| `canary_deployment` |  | false | false | None | None | None |
| `postdeploy` |  | false | false | None | None | None |
| `predeploy` |  | false | false | None | None | None |
| `custom_canary_deployment` |  | false | false | None | None | None |
| `phase_configs` |  | false | false | None | None | None |
| `runtime_config` |  | false | false | None | None | None |
| `cloud_run` |  | false | false | None | None | None |
| `kubernetes` |  | false | false | None | None | None |
| `gateway_service_mesh` |  | false | false | None | None | None |
| `route_destinations` |  | false | false | None | None | None |
| `service_networking` |  | false | false | None | None | None |
| `standard` |  | false | false | None | None | None |

### serial_pipeline Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `stages` | Each stage specifies configuration for a `Target`. The ordering of this list defines the promotion flow. | false | false | Defines deployment stage sequence - organizational configuration with no direct security impact. | None | None |

### stages Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `deploy_parameters` | Optional. The deploy parameters to use for the target in this stage. | false | true | Can pass arbitrary parameters to deployment processes. Could be used to inject malicious configuration or override security settings. | validated-parameters-only | arbitrary-parameters, security-override-parameters |
| `profiles` | Skaffold profiles to use when rendering the manifest for this stage's `Target`. | false | true | Skaffold profiles can alter deployment behavior and reference external configurations. Malicious profiles could change security settings or deployment targets. | approved-skaffold-profiles | unvalidated-profiles, malicious-profiles |
| `strategy` | Optional. The strategy to use for a `Rollout` to this stage. | false | false | Deployment strategy configuration (canary vs standard) - affects rollout behavior but not security permissions or external access. | None | None |
| `target_id` | The target_id to which this stage points. This field refers exclusively to the last segment of a target name. | false | false | References existing targets within the same location - doesn't create new access paths or execute code. | None | None |

### deploy_parameters Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `match_target_labels` | Optional. Deploy parameters are applied to targets with match labels. If unspecified, deploy parameters are applied to all targets (including child targets of a multi-target). | false | false | Label matching for parameter application - organizational feature with no direct security impact. | None | None |
| `values` | Required. Values are deploy parameters in key-value pairs. | true | false | Arbitrary key-value pairs passed to deployment processes | None | None |

### strategy Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `canary` | Canary deployment strategy provides progressive percentage based deployments to a Target. | false | false | Canary strategy configuration - affects rollout behavior but inherits security concerns from nested actions. | None | None |
| `standard` | Standard deployment strategy executes a single deploy and allows verifying the deployment. | false | false | Standard strategy configuration - affects rollout behavior but inherits security concerns from nested actions. | None | None |

### canary Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `canary_deployment` | Configures the progressive based deployment for a Target. | false | false | None | None | None |
| `custom_canary_deployment` | Configures the progressive based deployment for a Target, but allows customizing at the phase level where a phase represents each of the percentage deployments. | false | false | None | None | None |
| `runtime_config` | Optional. Runtime specific configurations for the deployment strategy. The runtime configuration is used to determine how Cloud Deploy will split traffic to enable a progressive deployment. | false | false | None | None | None |

### canary_deployment Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `percentages` | Required. The percentage based deployments that will occur as a part of a `Rollout`. List is expected in ascending order and each integer n is 0 <= n < 100. | true | false | None | None | None |
| `postdeploy` | Optional. Configuration for the postdeploy job of the last phase. If this is not configured, postdeploy job will not be present. | false | false | None | None | None |
| `predeploy` | Optional. Configuration for the predeploy job of the first phase. If this is not configured, predeploy job will not be present. | false | false | None | None | None |
| `verify` | Whether to run verify tests after each percentage deployment. | false | false | None | None | None |

### postdeploy Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `actions` | Optional. A sequence of skaffold custom actions to invoke during execution of the postdeploy job. | false | false | None | None | None |

### predeploy Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `actions` | Optional. A sequence of skaffold custom actions to invoke during execution of the predeploy job. | false | false | None | None | None |

### custom_canary_deployment Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `phase_configs` | Required. Configuration for each phase in the canary deployment in the order executed. | true | false | None | None | None |

### phase_configs Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `percentage` | Required. Percentage deployment for the phase. | true | false | None | None | None |
| `phase_id` | Required. The ID to assign to the `Rollout` phase. This value must consist of lower-case letters, numbers, and hyphens, start with a letter and end with a letter or a number, and have a max length of 63 characters. In other words, it must match the following regex: `^[a-z]([a-z0-9-]{0,61}[a-z0-9])?$`. | true | false | None | None | None |
| `postdeploy` | Optional. Configuration for the postdeploy job of this phase. If this is not configured, postdeploy job will not be present for this phase. | false | false | None | None | None |
| `predeploy` | Optional. Configuration for the predeploy job of this phase. If this is not configured, predeploy job will not be present for this phase. | false | false | None | None | None |
| `profiles` | Skaffold profiles to use when rendering the manifest for this phase. These are in addition to the profiles list specified in the `DeliveryPipeline` stage. | false | false | None | None | None |
| `verify` | Whether to run verify tests after the deployment. | false | false | None | None | None |

### runtime_config Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `cloud_run` | Cloud Run runtime configuration. | false | false | None | None | None |
| `kubernetes` | Kubernetes runtime configuration. | false | false | None | None | None |

### cloud_run Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `automatic_traffic_control` | Whether Cloud Deploy should update the traffic stanza in a Cloud Run Service on the user's behalf to facilitate traffic splitting. This is required to be true for CanaryDeployments, but optional for CustomCanaryDeployments. | false | false | None | None | None |
| `canary_revision_tags` | Optional. A list of tags that are added to the canary revision while the canary phase is in progress. | false | false | None | None | None |
| `prior_revision_tags` | Optional. A list of tags that are added to the prior revision while the canary phase is in progress. | false | false | None | None | None |
| `stable_revision_tags` | Optional. A list of tags that are added to the final stable revision when the stable phase is applied. | false | false | None | None | None |

### kubernetes Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `gateway_service_mesh` | Kubernetes Gateway API service mesh configuration. | false | false | None | None | None |
| `service_networking` | Kubernetes Service networking configuration. | false | false | None | None | None |

### gateway_service_mesh Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `deployment` | Required. Name of the Kubernetes Deployment whose traffic is managed by the specified HTTPRoute and Service. | true | false | None | None | None |
| `http_route` | Required. Name of the Gateway API HTTPRoute. | true | false | None | None | None |
| `pod_selector_label` | Optional. The label to use when selecting Pods for the Deployment and Service resources. This label must already be present in both resources. | false | false | None | None | None |
| `route_destinations` | Optional. Route destinations allow configuring the Gateway API HTTPRoute to be deployed to additional clusters. This option is available for multi-cluster service mesh set ups that require the route to exist in the clusters that call the service. If unspecified, the HTTPRoute will only be deployed to the Target cluster. | false | false | None | None | None |
| `route_update_wait_time` | Optional. The time to wait for route updates to propagate. The maximum configurable time is 3 hours, in seconds format. If unspecified, there is no wait time. | false | false | None | None | None |
| `service` | Required. Name of the Kubernetes Service. | true | false | None | None | None |
| `stable_cutback_duration` | Optional. The amount of time to migrate traffic back from the canary Service to the original Service during the stable phase deployment. If specified, must be between 15s and 3600s. If unspecified, there is no cutback time. | false | false | None | None | None |

### route_destinations Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `destination_ids` | Required. The clusters where the Gateway API HTTPRoute resource will be deployed to. Valid entries include the associated entities IDs configured in the Target resource and "@self" to include the Target cluster. | true | false | None | None | None |
| `propagate_service` | Optional. Whether to propagate the Kubernetes Service to the route destination clusters. The Service will always be deployed to the Target cluster even if the HTTPRoute is not. This option may be used to facilitiate successful DNS lookup in the route destination clusters. Can only be set to true if destinations are specified. | false | false | None | None | None |

### service_networking Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `deployment` | Required. Name of the Kubernetes Deployment whose traffic is managed by the specified Service. | true | false | None | None | None |
| `disable_pod_overprovisioning` | Optional. Whether to disable Pod overprovisioning. If Pod overprovisioning is disabled then Cloud Deploy will limit the number of total Pods used for the deployment strategy to the number of Pods the Deployment has on the cluster. | false | false | None | None | None |
| `pod_selector_label` | Optional. The label to use when selecting Pods for the Deployment resource. This label must already be present in the Deployment. | false | false | None | None | None |
| `service` | Required. Name of the Kubernetes Service. | true | false | None | None | None |

### standard Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `postdeploy` | Optional. Configuration for the postdeploy job. If this is not configured, postdeploy job will not be present. | false | false | None | None | None |
| `predeploy` | Optional. Configuration for the predeploy job. If this is not configured, predeploy job will not be present. | false | false | None | None | None |
| `verify` | Whether to verify a deployment. | false | false | None | None | None |
