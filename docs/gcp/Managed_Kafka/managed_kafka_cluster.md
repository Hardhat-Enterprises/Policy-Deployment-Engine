## 🛡️ Policy Deployment Engine: `managed_kafka_cluster`

This section provides a concise policy evaluation for the `managed_kafka_cluster` resource in GCP.

Reference: [Terraform Registry – managed_kafka_cluster](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/managed_kafka_cluster)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `location` | ID of the location of the Kafka resource. See https://cloud.google.com/managed-kafka/docs/locations for a list of supported locations. | true | None | None |
| `cluster_id` | The ID to use for the cluster, which will become the final component of the cluster's name. The ID must be 1-63 characters long, and match the regular expression `[a-z]([-a-z0-9]*[a-z0-9])?` to comply with RFC 1035. This value is structured like: `my-cluster-id`. | true | None | None |
| `labels` | List of label KEY=VALUE pairs to add. Keys must start with a lowercase character and contain only hyphens (-), underscores ( ), lowercase characters, and numbers. Values must contain only hyphens (-), underscores ( ), lowercase characters, and numbers. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### gcp_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `access_config` | The configuration of access to the Kafka cluster. Structure is [documented below](#nested_gcp_config_access_config). | true | None | None |
| `kms_key` | The Cloud KMS Key name to use for encryption. The key must be located in the same region as the cluster and cannot be changed. Must be in the format `projects/PROJECT_ID/locations/LOCATION/keyRings/KEY_RING/cryptoKeys/KEY`. | false | None | None |

### capacity_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `vcpu_count` | The number of vCPUs to provision for the cluster. The minimum is 3. | true | None | None |
| `memory_bytes` | The memory to provision for the cluster in bytes. The value must be between 1 GiB and 8 GiB per vCPU. Ex. 1024Mi, 4Gi. | true | None | None |

### rebalance_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `mode` | The rebalance behavior for the cluster. When not specified, defaults to `NO_REBALANCE`. Possible values: `MODE_UNSPECIFIED`, `NO_REBALANCE`, `AUTO_REBALANCE_ON_SCALE_UP`. | false | None | None |

### tls_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `trust_config` | The configuration of the broker truststore. If specified, clients can use mTLS for authentication. Structure is [documented below](#nested_tls_config_trust_config). | false | None | None |
| `ssl_principal_mapping_rules` | The rules for mapping mTLS certificate Distinguished Names (DNs) to shortened principal names for Kafka ACLs. This field corresponds exactly to the ssl.principal.mapping.rules broker config and matches the format and syntax defined in the Apache Kafka documentation. Setting or modifying this field will trigger a rolling restart of the Kafka brokers to apply the change. An empty string means that the default Kafka behavior is used. Example: `RULE:^CN=(.?),OU=ServiceUsers.$/$1@example.com/,DEFAULT` | false | None | None |

### access_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `network_configs` | Virtual Private Cloud (VPC) subnets where IP addresses for the Kafka cluster are allocated. To make the cluster available in a VPC, you must specify at least one `network_configs` block. Max of 10 subnets per cluster. Additional subnets may be specified with additional `network_configs` blocks. Structure is [documented below](#nested_gcp_config_access_config_network_configs). | true | None | None |

### network_configs Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `subnet` | Name of the VPC subnet from which the cluster is accessible. Both broker and bootstrap server IP addresses and DNS entries are automatically created in the subnet. There can only be one subnet per network, and the subnet must be located in the same region as the cluster. The project may differ. The name of the subnet must be in the format `projects/PROJECT_ID/regions/REGION/subnetworks/SUBNET`. | true | None | None |

### trust_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `cas_configs` | Configuration for the Google Certificate Authority Service. To support mTLS, you must specify at least one `cas_configs` block. A maximum of 10 CA pools can be specified. Additional CA pools may be specified with additional `cas_configs` blocks. Structure is [documented below](#nested_tls_config_trust_config_cas_configs). | false | None | None |

### cas_configs Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `ca_pool` | The name of the CA pool to pull CA certificates from. The CA pool does not need to be in the same project or location as the Kafka cluster. Must be in the format `projects/PROJECT_ID/locations/LOCATION/caPools/CA_POOL_ID. | true | None | None |
