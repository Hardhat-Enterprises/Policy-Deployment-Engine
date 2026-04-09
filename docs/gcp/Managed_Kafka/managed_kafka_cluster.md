## 🛡️ Policy Deployment Engine: `managed_kafka_cluster`

This section provides a concise policy evaluation for the `managed_kafka_cluster` resource in GCP.

Reference: [Terraform Registry – managed_kafka_cluster](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/managed_kafka_cluster)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `gcp_config` | Configuration properties for a Kafka cluster deployed to Google Cloud Platform. | true | true | Defines networking and encryption aspects that directly affect cluster confidentiality and access controls. | ['Internal subnets defined', 'KMS key specified'] | ['Public access', 'Missing KMS key'] |
| `capacity_config` | A capacity configuration of a Kafka cluster. | true | true | Insufficient capacity may lead to instability and service denial. | ['At least 3 vCPUs', 'Memory between 1-8 GiB per vCPU'] | ['Less than 3 vCPUs', 'Memory outside limits'] |
| `tls_config` | TLS configuration for the Kafka cluster. This is used to configure mTLS authentication. | false | true | Protects Kafka clients and brokers with encryption and identity validation. | ['mTLS enabled with trusted CA'] | ['No TLS/mTLS'] |
| `network_configs` | Defines the subnets where the Kafka cluster is accessible. | true | true | Improper subnet configuration can expose cluster externally. | ['Private subnet from secure VPC'] | ['Public subnet or undefined'] |

### gcp_config Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `access_config` | The configuration of access to the Kafka cluster. | true | true | Improper access can expose internal systems. | ['Restricts access to internal subnets'] | ['Open public access'] |
| `kms_key` | The Cloud KMS Key name to use for encryption. | false | true | Ensures data-at-rest encryption compliance. | ['Valid CMK from same-region KMS'] | ['KMS not used or wrongly scoped'] |

### capacity_config Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `vcpu_count` | The number of vCPUs to provision for the cluster. The minimum is 3. | true | true | Low vCPU count may affect availability under load. | ['3 or more vCPUs'] | ['< 3 vCPUs'] |
| `memory_bytes` | The memory to provision for the cluster in bytes (1 GiB to 8 GiB per vCPU). | true | true | Too little or too much memory allocation can destabilize workloads. | ['Between 1-8 GiB per vCPU'] | ['Outside supported range'] |

### tls_config Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `trust_config` | The configuration of the broker truststore. | false | true | Validates identities through certificate chains. | ['Defined with trusted CA pools'] | ['Omitted or invalid trust store'] |
| `ssl_principal_mapping_rules` | Rules for mapping mTLS certificate DNs to principal names for Kafka ACLs. | false | true | Weak or default rules may allow identity spoofing. | ['Explicit mapping using regex'] | ['Defaults or overly broad patterns'] |

### network_configs Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `subnet` | Name of the VPC subnet. | true | true | Subnets influence traffic routing and access visibility. | ['Private subnet in isolated VPC'] | ['Untrusted or shared subnet'] |
