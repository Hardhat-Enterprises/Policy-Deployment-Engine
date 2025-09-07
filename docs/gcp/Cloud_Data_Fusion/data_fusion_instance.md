## 🛡️ Policy Deployment Engine: `data_fusion_instance`

This section provides a concise policy evaluation for the `data_fusion_instance` resource in GCP.

Reference: [Terraform Registry – data_fusion_instance](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/data_fusion_instance)

---

## 1. Argument Reference

### `name`
- Description: (Required) The ID of the instance or a fully qualified identifier for the instance.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `type`
- Description: (Required) Represents the type of Data Fusion instance. Each type is configured with the default settings for processing and memory. - BASIC: Basic Data Fusion instance. In Basic type, the user will be able to create data pipelines using point and click UI. However, there are certain limitations, such as fewer number of concurrent pipelines, no support for streaming pipelines, etc. - ENTERPRISE: Enterprise Data Fusion instance. In Enterprise type, the user will have more features available, such as support for streaming pipelines, higher number of concurrent pipelines, etc. - DEVELOPER: Developer Data Fusion instance. In Developer type, the user will have all features available but with restrictive capabilities. This is to help enterprises design and develop their data ingestion and integration pipelines at low cost. Possible values are: `BASIC`, `ENTERPRISE`, `DEVELOPER`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) An optional description of the instance.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enable_stackdriver_logging`
- Description: (Optional) Option to enable Stackdriver Logging.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enable_stackdriver_monitoring`
- Description: (Optional) Option to enable Stackdriver Monitoring.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enable_rbac`
- Description: (Optional) Option to enable granular role-based access control.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) The resource labels for instance to use to annotate any related underlying resources, such as Compute Engine VMs. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `options`
- Description: (Optional) Map of additional options used to configure the behavior of Data Fusion instance.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `version`
- Description: (Optional) Current version of the Data Fusion.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `private_instance`
- Description: (Optional) Specifies whether the Data Fusion instance should be private. If set to true, all Data Fusion nodes will have private IP addresses and will not be able to access the public internet.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `dataproc_service_account`
- Description: (Optional) User-managed service account to set on Dataproc when Cloud Data Fusion creates Dataproc to run data processing pipelines.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `network_config`
- Description: (Optional) Network configuration options. These are required when a private Data Fusion instance is to be created. Structure is [documented below](#nested_network_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `zone`
- Description: (Optional) Name of the zone in which the Data Fusion instance will be created. Only DEVELOPER instances use this field.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `display_name`
- Description: (Optional) Display name for an instance.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `crypto_key_config`
- Description: (Optional) The crypto key configuration. This field is used by the Customer-Managed Encryption Keys (CMEK) feature. Structure is [documented below](#nested_crypto_key_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `event_publish_config`
- Description: (Optional) Option to enable and pass metadata for event publishing. Structure is [documented below](#nested_event_publish_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `accelerators`
- Description: (Optional) List of accelerators enabled for this CDF instance. If accelerators are enabled it is possible a permadiff will be created with the Options field. Users will need to either manually update their state file to include these diffed options, or include the field in a [lifecycle ignore changes block](https://developer.hashicorp.com/terraform/language/meta-arguments/lifecycle#ignore_changes). Structure is [documented below](#nested_accelerators).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `tags`
- Description: (Optional) A map of resource manager tags. Resource manager tag keys and values have the same definition as resource manager tags. Keys must be in the format tagKeys/{tag_key_id}, and values are in the format tagValues/{tag_value_id}. The field is ignored (both PUT & PATCH) when empty.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `region`
- Description: (Optional) The region of the Data Fusion instance.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_network_config"></a>The `network_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ip_allocation`
- Description: (Optional) The IP range in CIDR notation to use for the managed Data Fusion instance nodes. This range must not overlap with any other ranges used in the Data Fusion instance network.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `network`
- Description: (Optional) Name of the network in the project with which the tenant project will be peered for executing pipelines. In case of shared VPC where the network resides in another host project the network should specified in the form of projects/{host-project-id}/global/networks/{network}
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `connection_type`
- Description: (Optional) Optional. Type of connection for establishing private IP connectivity between the Data Fusion customer project VPC and the corresponding tenant project from a predefined list of available connection modes. If this field is unspecified for a private instance, VPC peering is used. Possible values are: `VPC_PEERING`, `PRIVATE_SERVICE_CONNECT_INTERFACES`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `private_service_connect_config`
- Description: (Optional) Optional. Configuration for Private Service Connect. This is required only when using connection type PRIVATE_SERVICE_CONNECT_INTERFACES. Structure is [documented below](#nested_network_config_private_service_connect_config). <a name="nested_network_config_private_service_connect_config"></a>The `private_service_connect_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `network_attachment`
- Description: (Optional) Optional. The reference to the network attachment used to establish private connectivity. It will be of the form projects/{project-id}/regions/{region}/networkAttachments/{network-attachment-id}. This is required only when using connection type PRIVATE_SERVICE_CONNECT_INTERFACES.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `unreachable_cidr_block`
- Description: (Optional) Optional. Input only. The CIDR block to which the CDF instance can't route traffic to in the consumer project VPC. The size of this block should be at least /25. This range should not overlap with the primary address range of any subnetwork used by the network attachment. This range can be used for other purposes in the consumer VPC as long as there is no requirement for CDF to reach destinations using these addresses. If this value is not provided, the server chooses a non RFC 1918 address range. The format of this field is governed by RFC 4632.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `effective_unreachable_cidr_block`
- Description: (Output) Output only. The CIDR block to which the CDF instance can't route traffic to in the consumer project VPC. The size of this block is /25. The format of this field is governed by RFC 4632. <a name="nested_crypto_key_config"></a>The `crypto_key_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `key_reference`
- Description: (Required) The name of the key which is used to encrypt/decrypt customer data. For key in Cloud KMS, the key should be in the format of projects/*/locations/*/keyRings/*/cryptoKeys/*. <a name="nested_event_publish_config"></a>The `event_publish_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enabled`
- Description: (Required) Option to enable Event Publishing.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `topic`
- Description: (Required) The resource name of the Pub/Sub topic. Format: projects/{projectId}/topics/{topic_id} <a name="nested_accelerators"></a>The `accelerators` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `accelerator_type`
- Description: (Required) The type of an accelator for a CDF instance. Possible values are: `CDC`, `HEALTHCARE`, `CCAI_INSIGHTS`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `state`
- Description: (Required) The type of an accelator for a CDF instance. Possible values are: `ENABLED`, `DISABLED`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
