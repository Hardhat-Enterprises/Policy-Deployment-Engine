## 🛡️ Policy Deployment Engine: `data_fusion_instance`

This section provides a concise policy evaluation for the `data_fusion_instance` resource in GCP.

Reference: [Terraform Registry – data_fusion_instance](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/data_fusion_instance)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `name` | The ID of the instance or a fully qualified identifier for the instance. | true | false | The 'name' attribute has no security impact on this specific resource | None | None |
| `type` | Represents the type of Data Fusion instance. Each type is configured with the default settings for processing and memory. - BASIC: Basic Data Fusion instance. In Basic type, the user will be able to create data pipelines using point and click UI. However, there are certain limitations, such as fewer number of concurrent pipelines, no support for streaming pipelines, etc. - ENTERPRISE: Enterprise Data Fusion instance. In Enterprise type, the user will have more features available, such as support for streaming pipelines, higher number of concurrent pipelines, etc. - DEVELOPER: Developer Data Fusion instance. In Developer type, the user will have all features available but with restrictive capabilities. This is to help enterprises design and develop their data ingestion and integration pipelines at low cost. Possible values are: `BASIC`, `ENTERPRISE`, `DEVELOPER`. | true | true | Mandating instance types ensures Hardhat Enterprises only pays for the security features required by the specific environment while preventing budget overruns. | BASIC | ENTERPRISE |
| `description` | An optional description of the instance. | false | false | A description of the instance is optional and poses no security impact for the resource type | None | None |
| `enable_stackdriver_logging` | Option to enable Stackdriver Logging. | false | true | Mandating Stackdriver logging ensures all pipeline activities are auditable and to provide the visibility required for rapid troubleshooting and security forensics | true | false |
| `enable_stackdriver_monitoring` | Option to enable Stackdriver Monitoring. | false | true | Provides real-time performance visibility and automated alerting to prevent pipeline downtime and ensure system health | true | false |
| `enable_rbac` | Option to enable granular role-based access control. | false | true | Preventing unauthorized users from accessing or modifying sensitive data pipelines within shared namespaces, through principle of least privilege | true | false |
| `labels` | The resource labels for instance to use to annotate any related underlying resources, such as Compute Engine VMs. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | true | To enable precise cost tracking and resource ownership, ensuring all cloud assets can be accurately attributed to specific departments or project budgets | env = dev | team = data-eng |
| `options` | Map of additional options used to configure the behavior of Data Fusion instance. | false | false | Maintains a standardized environment preventing engineers from bypassing security guardrails through custom unvetted settings | None | None |
| `version` | Current version of the Data Fusion. | false | false | Allow to leverage the latest patch releases and service updates without being blocked by rigid & hardcoded constraints in the PDE | None | None |
| `private_instance` | Specifies whether the Data Fusion instance should be private. If set to true, all Data Fusion nodes will have private IP addresses and will not be able to access the public internet. | false | true | Data traffic remains entirely off the public internet, protecting sensitive pipelines from external threats and ensuring secure internal connectivity | true | false |
| `dataproc_service_account` | User-managed service account to set on Dataproc when Cloud Data Fusion creates Dataproc to run data processing pipelines. | false | true | Dataproc service account ensures HH follows the principle of least privilege by isolating pipeline permissions from the default compute engine account | cdf-runner@hardhat-prod-project.iam.gserviceaccount.com | 123456789-compute@developer.gserviceaccount.com |
| `network_config` | Network configuration options. These are required when a private Data Fusion instance is to be created. Structure is [documented below](#nested_network_config). | false | true | Strictly control traffic flow and peering which prevents unauthorized network exposure and ensure consistent connectivity across the corporate VPC | None | None |
| `zone` | Name of the zone in which the Data Fusion instance will be created. Only DEVELOPER instances use this field. | false | false | To allow Google Cloud's scheduler to automatically place resources in the most available area within a region | None | None |
| `display_name` | Display name for an instance. | false | false | Display name does not pose risks to security impact | None | None |
| `crypto_key_config` | The crypto key configuration. This field is used by the Customer-Managed Encryption Keys (CMEK) feature. Structure is [documented below](#nested_crypto_key_config). | false | true | To ensure that data at rest is protected by Customer-Managed Encryption Keys (CMEK) | None | None |
| `event_publish_config` | Option to enable and pass metadata for event publishing. Structure is [documented below](#nested_event_publish_config). | false | true | enable real-time observability and automation ensuring that lifecycle events from Data Fusion are automatically broadcast to Pub/Sub topics for immediate downstream processing or security auditing | None | None |
| `accelerators` | List of accelerators enabled for this CDF instance. If accelerators are enabled it is possible a permadiff will be created with the Options field. Users will need to either manually update their state file to include these diffed options, or include the field in a [lifecycle ignore changes block](https://developer.hashicorp.com/terraform/language/meta-arguments/lifecycle#ignore_changes). Structure is [documented below](#nested_accelerators). | false | false | Maintain a standardized cost-effective environment for general purpose workloads | None | None |
| `tags` | A map of resource manager tags. Resource manager tag keys and values have the same definition as resource manager tags. Keys must be in the format tagKeys/{tag_key_id}, and values are in the format tagValues/{tag_value_id}. The field is ignored (both PUT & PATCH) when empty. | false | false | To prevent tag bloat and maintain a centralized governance model | None | None |
| `region` | The region of the Data Fusion instance. | false | false |  | None | None |
| `project` | If it is not provided, the provider project is used. | false | false | Project in this resource type does not pose security risks | None | None |
| `private_service_connect_config` |  | false | false | To maintain a simplified network architecture centered on VPC Peering | None | None |

### network_config Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `ip_allocation` | The IP range in CIDR notation to use for the managed Data Fusion instance nodes. This range must not overlap with any other ranges used in the Data Fusion instance network. | false | false | to let the network layer handle addressing dynamically, which prevents manual configuration errors and ensures the system can scale without hitting hardcoded IP limits | None | None |
| `network` | Name of the network in the project with which the tenant project will be peered for executing pipelines. In case of shared VPC where the network resides in another host project the network should specified in the form of projects/{host-project-id}/global/networks/{network} | false | false | To ensure consistency across the environment without requiring manual & redundant definitions for every instance | None | None |
| `connection_type` | Optional. Type of connection for establishing private IP connectivity between the Data Fusion customer project VPC and the corresponding tenant project from a predefined list of available connection modes. If this field is unspecified for a private instance, VPC peering is used. Possible values are: `VPC_PEERING`, `PRIVATE_SERVICE_CONNECT_INTERFACES`. | false | true | Forces data traffic to remain within the internal network rather than traversing the public internet, by utilising VPC peering | VPC_PEERING | null |
| `private_service_connect_config` | Optional. Configuration for Private Service Connect. This is required only when using connection type PRIVATE_SERVICE_CONNECT_INTERFACES. Structure is [documented below](#nested_network_config_private_service_connect_config). | false | false | to prioritize VPC peering as the standardized connectivity method voiding the added architectural complexity and management overhead. | None | None |

### crypto_key_config Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `key_reference` | The name of the key which is used to encrypt/decrypt customer data. For key in Cloud KMS, the key should be in the format of projects/*/locations/*/keyRings/*/cryptoKeys/*. | true | true | explicitly link the data instance to a specific KMS (Key Management Service) key ensuring that the encryption process is audit-ready and that only authorized cryptographic keys are used to secure sensitive project data. | projects/hardhat-prod/locations/us-central1/keyRings/hardhat-ring/cryptoKeys/cdf-key | projects/wrong-project/locations/us-central1/keyRings/hardhat-ring/cryptoKeys/cdf-key |

### event_publish_config Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `enabled` | Option to enable Event Publishing. | true | true | To explicitly activate event broadcasting. | true | false |
| `topic` | The resource name of the Pub/Sub topic. Format: projects/{projectId}/topics/{topic_id} | true | true | Ensure that all event notifications are routed to a specific pre-approved Pub/Sub topic preventing data from being lost in a generic stream and allowing security teams to maintain a clear audit trail of all pipeline activities. | projects/hardhat-prod/topics/certain-topic | projects/unauthorized-sandbox/topics/invalid |

### accelerators Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `accelerator_type` | The type of an accelator for a CDF instance. Possible values are: `CDC`, `HEALTHCARE`, `CCAI_INSIGHTS`. | true | false | None | None | None |
| `state` | The type of an accelator for a CDF instance. Possible values are: `ENABLED`, `DISABLED`. | true | false | None | None | None |

### private_service_connect_config Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `network_attachment` | Optional. The reference to the network attachment used to establish private connectivity. It will be of the form projects/{project-id}/regions/{region}/networkAttachments/{network-attachment-id}. This is required only when using connection type PRIVATE_SERVICE_CONNECT_INTERFACES. | false | false | None | None | None |
| `unreachable_cidr_block` | Optional. Input only. The CIDR block to which the CDF instance can't route traffic to in the consumer project VPC. The size of this block should be at least /25. This range should not overlap with the primary address range of any subnetwork used by the network attachment. This range can be used for other purposes in the consumer VPC as long as there is no requirement for CDF to reach destinations using these addresses. If this value is not provided, the server chooses a non RFC 1918 address range. The format of this field is governed by RFC 4632. | false | false | None | None | None |
| `effective_unreachable_cidr_block` | (Output) Output only. The CIDR block to which the CDF instance can't route traffic to in the consumer project VPC. The size of this block is /25. The format of this field is governed by RFC 4632. | false | false | None | None | None |
