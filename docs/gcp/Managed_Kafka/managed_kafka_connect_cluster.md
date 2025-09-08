## 🛡️ Policy Deployment Engine: `managed_kafka_connect_cluster`

This section provides a concise policy evaluation for the `managed_kafka_connect_cluster` resource in GCP.

Reference: [Terraform Registry – managed_kafka_connect_cluster](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/managed_kafka_connect_cluster)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `kafka_cluster` | The name of the Kafka cluster this Kafka Connect cluster is attached to. Structured like: `projects/PROJECT_ID/locations/LOCATION/clusters/CLUSTER_ID`. | true | None | None |
| `location` | ID of the location of the Kafka Connect resource. See https://cloud.google.com/managed-kafka/docs/locations for a list of supported locations. | true | None | None |
| `connect_cluster_id` | The ID to use for the Connect Cluster, which will become the final component of the connect cluster's name. This value is structured like: `my-connect-cluster-id`. | true | None | None |
| `labels` | List of label KEY=VALUE pairs to add. Keys must start with a lowercase character and contain only hyphens (-), underscores ( ), lowercase characters, and numbers. Values must contain only hyphens (-), underscores ( ), lowercase characters, and numbers. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### capacity_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `vcpu_count` | The number of vCPUs to provision for the cluster. The minimum is 3. | true | None | None |
| `memory_bytes` | The memory to provision for the cluster in bytes. The CPU:memory ratio (vCPU:GiB) must be between 1:1 and 1:8. Minimum: 3221225472 (3 GiB). | true | None | None |

### gcp_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `access_config` | The configuration of access to the Kafka Connect cluster. Structure is [documented below](#nested_gcp_config_access_config). | true | None | None |

### access_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `network_configs` | Virtual Private Cloud (VPC) subnets where IP addresses for the Kafka Connect cluster are allocated. To make the connect cluster available in a VPC, you must specify at least one subnet per network. You must specify between 1 and 10 subnets. Additional subnets may be specified with additional `network_configs` blocks. Structure is [documented below](#nested_gcp_config_access_config_network_configs). | true | None | None |

### network_configs Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `primary_subnet` | VPC subnet to make available to the Kafka Connect cluster. Structured like: projects/{project}/regions/{region}/subnetworks/{subnet_id}. It is used to create a Private Service Connect (PSC) interface for the Kafka Connect workers. It must be located in the same region as the Kafka Connect cluster. The CIDR range of the subnet must be within the IPv4 address ranges for private networks, as specified in RFC 1918. The primary subnet CIDR range must have a minimum size of /22 (1024 addresses). | true | None | None |
| `additional_subnets` | Additional subnets may be specified. They may be in another region, but must be in the same VPC network. The Connect workers can communicate with network endpoints in either the primary or additional subnets. | false | None | None |
| `dns_domain_names` | Additional DNS domain names from the subnet's network to be made visible to the Connect Cluster. When using MirrorMaker2, it's necessary to add the bootstrap address's dns domain name of the target cluster to make it visible to the connector. For example: my-kafka-cluster.us-central1.managedkafka.my-project.cloud.goog | false | None | None |
