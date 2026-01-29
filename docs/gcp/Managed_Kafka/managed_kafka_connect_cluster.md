## 🛡️ Policy Deployment Engine: `managed_kafka_connect_cluster`

This section provides a concise policy evaluation for the `managed_kafka_connect_cluster` resource in GCP.

Reference: [Terraform Registry – managed_kafka_connect_cluster](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/managed_kafka_connect_cluster)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `kafka_cluster` | The name of the Kafka cluster this Kafka Connect cluster is attached to. Structured like: `projects/PROJECT_ID/locations/LOCATION/clusters/CLUSTER_ID`. | true | false | Used for attachment reference; does not directly impact access or data protection. | [] | [] |
| `capacity_config` | A capacity configuration of a Kafka cluster. | true | false | Capacity impacts availability but not directly related to security posture. | [] | [] |
| `gcp_config` | Configuration properties for a Kafka Connect cluster deployed to GCP. | true | true | This includes networking config which affects visibility, access, and isolation. | ['Restricts access to private VPCs', 'Leverages service controls'] | ['Open access or public IP exposure'] |
| `location` | ID of the location of the Kafka Connect resource. | true | false | Does not influence access or encryption directly. | none | none |
| `connect_cluster_id` | The ID used for the Connect Cluster. | true | false | Naming convention; no access impact. | none | none |
| `labels` | List of label KEY=VALUE pairs. | false | false | Used for metadata. Does not alter security posture. | none | none |
| `project` | Provider project used if not explicitly set. | false | false | Does not directly affect resource access or encryption. | none | none |
| `access_config` |  | false | true | Manages network exposure of the cluster. | ['Uses private subnets only', 'PSC enabled'] | ['No subnet defined', 'Public subnets allowed'] |
| `network_configs` |  | false | true | Defines networking for PSC interfaces, which affect secure access. | ['Primary and additional subnets from approved VPC'] | ['No subnet or misconfigured region/VPC'] |

### capacity_config Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `vcpu_count` | The number of vCPUs to provision for the cluster. The minimum is 3. | true | false | Affects performance but not confidentiality or integrity. | ['3 or more vCPUs'] | ['Less than 3 vCPUs'] |
| `memory_bytes` | The memory to provision for the cluster. CPU:Memory ratio must be between 1:1 and 1:8. | true | false | Availability concern rather than access/security. | ['Ratio within 1:1 to 1:8'] | ['Outside defined ratio'] |

### gcp_config Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `access_config` | Access configuration for the Kafka Connect cluster. | true | true | Controls how the Connect cluster is accessed. Improper setup risks exposure. | ['Subnets from secure VPC only'] | ['Public or overly permissive settings'] |

### access_config Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `network_configs` | VPC subnets used for Kafka Connect cluster. | true | true | Defines network isolation. Insecure subnet increases exposure. | ['Private subnets with PSC'] | ['Public subnets'] |

### network_configs Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `primary_subnet` | Primary VPC subnet used for PSC interface. | true | true | Defines where traffic is routed from/to. Impacts exposure level. | ['Private RFC1918 subnet with /22 or larger'] | ['Shared or public subnets', 'CIDR < /22'] |
| `additional_subnets` | Secondary subnets from same VPC network. | false | true | May open routing paths across regions or networks. Needs validation. | ['Additional secure subnets from same VPC'] | ['External or public subnets'] |
| `dns_domain_names` | Domain names made visible to the Connect cluster. | false | true | Exposing internal domains could leak topology or allow SSRF. | ['Limit to known Kafka bootstrap DNS'] | ['Generic internal DNS or all wildcard domains'] |
