## 🛡️ Policy Deployment Engine: `data_fusion_instance`

This section provides a concise policy evaluation for the `data_fusion_instance` resource in GCP.

Reference: [Terraform Registry – data_fusion_instance](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/data_fusion_instance)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | The ID of the instance or a fully qualified identifier for the instance. | true | None | None |
| `type` | Represents the type of Data Fusion instance. Each type is configured with the default settings for processing and memory. - BASIC: Basic Data Fusion instance. In Basic type, the user will be able to create data pipelines using point and click UI. However, there are certain limitations, such as fewer number of concurrent pipelines, no support for streaming pipelines, etc. - ENTERPRISE: Enterprise Data Fusion instance. In Enterprise type, the user will have more features available, such as support for streaming pipelines, higher number of concurrent pipelines, etc. - DEVELOPER: Developer Data Fusion instance. In Developer type, the user will have all features available but with restrictive capabilities. This is to help enterprises design and develop their data ingestion and integration pipelines at low cost. Possible values are: `BASIC`, `ENTERPRISE`, `DEVELOPER`. | true | None | None |
| `description` | An optional description of the instance. | false | None | None |
| `enable_stackdriver_logging` | Option to enable Stackdriver Logging. | false | None | None |
| `enable_stackdriver_monitoring` | Option to enable Stackdriver Monitoring. | false | None | None |
| `enable_rbac` | Option to enable granular role-based access control. | false | None | None |
| `labels` | The resource labels for instance to use to annotate any related underlying resources, such as Compute Engine VMs. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | None | None |
| `options` | Map of additional options used to configure the behavior of Data Fusion instance. | false | None | None |
| `version` | Current version of the Data Fusion. | false | None | None |
| `private_instance` | Specifies whether the Data Fusion instance should be private. If set to true, all Data Fusion nodes will have private IP addresses and will not be able to access the public internet. | false | None | None |
| `dataproc_service_account` | User-managed service account to set on Dataproc when Cloud Data Fusion creates Dataproc to run data processing pipelines. | false | None | None |
| `zone` | Name of the zone in which the Data Fusion instance will be created. Only DEVELOPER instances use this field. | false | None | None |
| `display_name` | Display name for an instance. | false | None | None |
| `tags` | A map of resource manager tags. Resource manager tag keys and values have the same definition as resource manager tags. Keys must be in the format tagKeys/{tag_key_id}, and values are in the format tagValues/{tag_value_id}. The field is ignored (both PUT & PATCH) when empty. | false | None | None |
| `region` | The region of the Data Fusion instance. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### network_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `ip_allocation` | The IP range in CIDR notation to use for the managed Data Fusion instance nodes. This range must not overlap with any other ranges used in the Data Fusion instance network. | false | None | None |
| `network` | Name of the network in the project with which the tenant project will be peered for executing pipelines. In case of shared VPC where the network resides in another host project the network should specified in the form of projects/{host-project-id}/global/networks/{network} | false | None | None |
| `connection_type` | Optional. Type of connection for establishing private IP connectivity between the Data Fusion customer project VPC and the corresponding tenant project from a predefined list of available connection modes. If this field is unspecified for a private instance, VPC peering is used. Possible values are: `VPC_PEERING`, `PRIVATE_SERVICE_CONNECT_INTERFACES`. | false | None | None |
| `private_service_connect_config` | Optional. Configuration for Private Service Connect. This is required only when using connection type PRIVATE_SERVICE_CONNECT_INTERFACES. Structure is [documented below](#nested_network_config_private_service_connect_config). | false | None | None |

### crypto_key_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `key_reference` | The name of the key which is used to encrypt/decrypt customer data. For key in Cloud KMS, the key should be in the format of projects/*/locations/*/keyRings/*/cryptoKeys/*. | true | None | None |

### event_publish_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `enabled` | Option to enable Event Publishing. | true | None | None |
| `topic` | The resource name of the Pub/Sub topic. Format: projects/{projectId}/topics/{topic_id} | true | None | None |

### accelerators Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `accelerator_type` | The type of an accelator for a CDF instance. Possible values are: `CDC`, `HEALTHCARE`, `CCAI_INSIGHTS`. | true | None | None |
| `state` | The type of an accelator for a CDF instance. Possible values are: `ENABLED`, `DISABLED`. | true | None | None |

### private_service_connect_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `network_attachment` | Optional. The reference to the network attachment used to establish private connectivity. It will be of the form projects/{project-id}/regions/{region}/networkAttachments/{network-attachment-id}. This is required only when using connection type PRIVATE_SERVICE_CONNECT_INTERFACES. | false | None | None |
| `unreachable_cidr_block` | Optional. Input only. The CIDR block to which the CDF instance can't route traffic to in the consumer project VPC. The size of this block should be at least /25. This range should not overlap with the primary address range of any subnetwork used by the network attachment. This range can be used for other purposes in the consumer VPC as long as there is no requirement for CDF to reach destinations using these addresses. If this value is not provided, the server chooses a non RFC 1918 address range. The format of this field is governed by RFC 4632. | false | None | None |
| `effective_unreachable_cidr_block` | (Output) Output only. The CIDR block to which the CDF instance can't route traffic to in the consumer project VPC. The size of this block is /25. The format of this field is governed by RFC 4632. | none | None | None |
