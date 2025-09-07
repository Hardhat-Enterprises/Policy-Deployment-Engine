## 🛡️ Policy Deployment Engine: `managed_kafka_connect_cluster`

This section provides a concise policy evaluation for the `managed_kafka_connect_cluster` resource in GCP.

Reference: [Terraform Registry – managed_kafka_connect_cluster](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/managed_kafka_connect_cluster)

---

## 1. Argument Reference

### `kafka_cluster`
- Description: (Required) The name of the Kafka cluster this Kafka Connect cluster is attached to. Structured like: `projects/PROJECT_ID/locations/LOCATION/clusters/CLUSTER_ID`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `capacity_config`
- Description: (Required) A capacity configuration of a Kafka cluster. Structure is [documented below](#nested_capacity_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `gcp_config`
- Description: (Required) Configuration properties for a Kafka Connect cluster deployed to Google Cloud Platform. Structure is [documented below](#nested_gcp_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Required) ID of the location of the Kafka Connect resource. See https://cloud.google.com/managed-kafka/docs/locations for a list of supported locations.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `connect_cluster_id`
- Description: (Required) The ID to use for the Connect Cluster, which will become the final component of the connect cluster's name. This value is structured like: `my-connect-cluster-id`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) List of label KEY=VALUE pairs to add. Keys must start with a lowercase character and contain only hyphens (-), underscores ( ), lowercase characters, and numbers. Values must contain only hyphens (-), underscores ( ), lowercase characters, and numbers. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_capacity_config"></a>The `capacity_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `vcpu_count`
- Description: (Required) The number of vCPUs to provision for the cluster. The minimum is 3.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `memory_bytes`
- Description: (Required) The memory to provision for the cluster in bytes. The CPU:memory ratio (vCPU:GiB) must be between 1:1 and 1:8. Minimum: 3221225472 (3 GiB). <a name="nested_gcp_config"></a>The `gcp_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `access_config`
- Description: (Required) The configuration of access to the Kafka Connect cluster. Structure is [documented below](#nested_gcp_config_access_config). <a name="nested_gcp_config_access_config"></a>The `access_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `network_configs`
- Description: (Required) Virtual Private Cloud (VPC) subnets where IP addresses for the Kafka Connect cluster are allocated. To make the connect cluster available in a VPC, you must specify at least one subnet per network. You must specify between 1 and 10 subnets. Additional subnets may be specified with additional `network_configs` blocks. Structure is [documented below](#nested_gcp_config_access_config_network_configs). <a name="nested_gcp_config_access_config_network_configs"></a>The `network_configs` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `primary_subnet`
- Description: (Required) VPC subnet to make available to the Kafka Connect cluster. Structured like: projects/{project}/regions/{region}/subnetworks/{subnet_id}. It is used to create a Private Service Connect (PSC) interface for the Kafka Connect workers. It must be located in the same region as the Kafka Connect cluster. The CIDR range of the subnet must be within the IPv4 address ranges for private networks, as specified in RFC 1918. The primary subnet CIDR range must have a minimum size of /22 (1024 addresses).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `additional_subnets`
- Description: (Optional) Additional subnets may be specified. They may be in another region, but must be in the same VPC network. The Connect workers can communicate with network endpoints in either the primary or additional subnets.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `dns_domain_names`
- Description: (Optional) Additional DNS domain names from the subnet's network to be made visible to the Connect Cluster. When using MirrorMaker2, it's necessary to add the bootstrap address's dns domain name of the target cluster to make it visible to the connector. For example: my-kafka-cluster.us-central1.managedkafka.my-project.cloud.goog
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
