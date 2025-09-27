## 🛡️ Policy Deployment Engine: `vpc_access_connector`

This section provides a concise policy evaluation for the `vpc_access_connector` resource in GCP.

Reference: [Terraform Registry – vpc_access_connector](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/vpc_access_connector)

---

## Argument Reference
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `name` | The name of the resource (Max 25 characters). | true | false | Resource naming follows organizational conventions for identification and management | Uses descriptive names following naming conventions (e.g., 'prod-vpc-connector', 'staging-connector') | Generic or unclear names that don't indicate purpose or environment |
| `network` | Name or self_link of the VPC network. Required if `ip_cidr_range` is set. | false | false | Determines which VPC network the connector will bridge to, affecting network segmentation and access controls | Uses dedicated VPC networks with proper segmentation (not 'default' network) | Uses 'default' network or shared VPC without proper isolation |
| `ip_cidr_range` | The range of internal addresses that follows RFC 4632 notation. Example: `10.132.0.0/28`. | false | false | Must use RFC 1918 private IP ranges to prevent exposure to public internet and ensure proper network isolation | Uses RFC 1918 ranges: 10.0.0.0/8, 172.16.0.0/12, or 192.168.0.0/16 with /28 subnet | Uses public IP ranges or non-RFC 1918 addresses like 200.8.0.0/28 |
| `machine_type` | Machine type of VM Instance underlying connector. Default is e2-micro | false | false | Affects performance and cost but not direct security posture | Uses appropriate machine type for workload (e2-micro for light traffic, larger for production) | Over-provisioned instances wasting resources or under-provisioned causing performance issues |
| `min_throughput` | Minimum throughput of the connector in Mbps. Default and min is 200. Value must be a multiple of 100 from 200 through 900. | false | false | Affects availability and performance but not direct security. Deprecated in favor of min_instances | Set appropriately for expected traffic load with min_throughput < max_throughput | Misconfigured values causing service disruptions |
| `min_instances` | Minimum value of instances in autoscaling group. Value must be between 2 and 9, inclusive. | false | false | Ensures high availability and resilience against instance failures | Set to at least 2 for production workloads to ensure redundancy | Single instance configurations without redundancy |
| `max_instances` | Maximum value of instances in autoscaling group. Value must be between 3 and 10, inclusive. | false | false | Prevents resource exhaustion attacks and controls scaling limits | Set reasonable upper bounds (3-10) based on expected load with max > min | Unlimited or excessive scaling that could lead to cost overruns |
| `max_throughput` | Maximum throughput of the connector in Mbps. Default is 300. Value must be a multiple of 100 from 300 through 1000. | false | false | Limits maximum bandwidth to prevent network saturation. Deprecated in favor of max_instances | Set appropriately above min_throughput with reasonable headroom | Set equal to or below min_throughput |
| `subnet` | The subnet in which to house the connector. Structure is documented below. | false | false | Determines specific subnet placement affecting network isolation and firewall rules | Uses dedicated subnets with appropriate firewall rules | Placed in public subnets or subnets with overly permissive access |
| `region` | Region where the VPC Access connector resides. If not provided, the provider region is used. | false | false | Affects data residency, latency, and compliance requirements | Deployed in regions that meet data residency and compliance requirements | Deployed in regions that violate data sovereignty requirements |
| `project` | The project ID. If not provided, the provider project is used. | false | false | Determines project-level IAM boundaries and resource isolation | Uses appropriate project following least-privilege principles | Uses shared or overly-permissive projects |

### subnet Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `name` | Subnet name (relative, not fully qualified). | false | false | Identifies specific subnet for connector placement | References private, dedicated subnets for serverless workloads | References public or shared subnets |
| `project_id` | Project in which the subnet exists. If not set, this project is assumed. | false | false | Cross-project subnet usage should be carefully controlled | Uses subnets within the same project or authorized shared VPC | Unauthorized cross-project subnet references |
