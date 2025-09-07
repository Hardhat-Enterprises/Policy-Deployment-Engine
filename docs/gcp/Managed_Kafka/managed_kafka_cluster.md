## 🛡️ Policy Deployment Engine: `managed_kafka_cluster`

This section provides a concise policy evaluation for the `managed_kafka_cluster` resource in GCP.

Reference: [Terraform Registry – managed_kafka_cluster](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/managed_kafka_cluster)

---

## 1. Argument Reference

### `gcp_config`
- Description: (Required) Configuration properties for a Kafka cluster deployed to Google Cloud Platform. Structure is [documented below](#nested_gcp_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `capacity_config`
- Description: (Required) A capacity configuration of a Kafka cluster. Structure is [documented below](#nested_capacity_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Required) ID of the location of the Kafka resource. See https://cloud.google.com/managed-kafka/docs/locations for a list of supported locations.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cluster_id`
- Description: (Required) The ID to use for the cluster, which will become the final component of the cluster's name. The ID must be 1-63 characters long, and match the regular expression `[a-z]([-a-z0-9]*[a-z0-9])?` to comply with RFC 1035. This value is structured like: `my-cluster-id`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) List of label KEY=VALUE pairs to add. Keys must start with a lowercase character and contain only hyphens (-), underscores ( ), lowercase characters, and numbers. Values must contain only hyphens (-), underscores ( ), lowercase characters, and numbers. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `rebalance_config`
- Description: (Optional) Defines rebalancing behavior of a Kafka cluster. Structure is [documented below](#nested_rebalance_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `tls_config`
- Description: (Optional) TLS configuration for the Kafka cluster. This is used to configure mTLS authentication. To clear our a TLS configuration that has been previously set, please explicitly add an empty `tls_config` block. Structure is [documented below](#nested_tls_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_gcp_config"></a>The `gcp_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `access_config`
- Description: (Required) The configuration of access to the Kafka cluster. Structure is [documented below](#nested_gcp_config_access_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `kms_key`
- Description: (Optional) The Cloud KMS Key name to use for encryption. The key must be located in the same region as the cluster and cannot be changed. Must be in the format `projects/PROJECT_ID/locations/LOCATION/keyRings/KEY_RING/cryptoKeys/KEY`. <a name="nested_gcp_config_access_config"></a>The `access_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `network_configs`
- Description: (Required) Virtual Private Cloud (VPC) subnets where IP addresses for the Kafka cluster are allocated. To make the cluster available in a VPC, you must specify at least one `network_configs` block. Max of 10 subnets per cluster. Additional subnets may be specified with additional `network_configs` blocks. Structure is [documented below](#nested_gcp_config_access_config_network_configs). <a name="nested_gcp_config_access_config_network_configs"></a>The `network_configs` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `subnet`
- Description: (Required) Name of the VPC subnet from which the cluster is accessible. Both broker and bootstrap server IP addresses and DNS entries are automatically created in the subnet. There can only be one subnet per network, and the subnet must be located in the same region as the cluster. The project may differ. The name of the subnet must be in the format `projects/PROJECT_ID/regions/REGION/subnetworks/SUBNET`. <a name="nested_capacity_config"></a>The `capacity_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `vcpu_count`
- Description: (Required) The number of vCPUs to provision for the cluster. The minimum is 3.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `memory_bytes`
- Description: (Required) The memory to provision for the cluster in bytes. The value must be between 1 GiB and 8 GiB per vCPU. Ex. 1024Mi, 4Gi. <a name="nested_rebalance_config"></a>The `rebalance_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `mode`
- Description: (Optional) The rebalance behavior for the cluster. When not specified, defaults to `NO_REBALANCE`. Possible values: `MODE_UNSPECIFIED`, `NO_REBALANCE`, `AUTO_REBALANCE_ON_SCALE_UP`. <a name="nested_tls_config"></a>The `tls_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `trust_config`
- Description: (Optional) The configuration of the broker truststore. If specified, clients can use mTLS for authentication. Structure is [documented below](#nested_tls_config_trust_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ssl_principal_mapping_rules`
- Description: (Optional) The rules for mapping mTLS certificate Distinguished Names (DNs) to shortened principal names for Kafka ACLs. This field corresponds exactly to the ssl.principal.mapping.rules broker config and matches the format and syntax defined in the Apache Kafka documentation. Setting or modifying this field will trigger a rolling restart of the Kafka brokers to apply the change. An empty string means that the default Kafka behavior is used. Example: `RULE:^CN=(.?),OU=ServiceUsers.$/$1@example.com/,DEFAULT` <a name="nested_tls_config_trust_config"></a>The `trust_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cas_configs`
- Description: (Optional) Configuration for the Google Certificate Authority Service. To support mTLS, you must specify at least one `cas_configs` block. A maximum of 10 CA pools can be specified. Additional CA pools may be specified with additional `cas_configs` blocks. Structure is [documented below](#nested_tls_config_trust_config_cas_configs). <a name="nested_tls_config_trust_config_cas_configs"></a>The `cas_configs` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ca_pool`
- Description: (Required) The name of the CA pool to pull CA certificates from. The CA pool does not need to be in the same project or location as the Kafka cluster. Must be in the format `projects/PROJECT_ID/locations/LOCATION/caPools/CA_POOL_ID.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
