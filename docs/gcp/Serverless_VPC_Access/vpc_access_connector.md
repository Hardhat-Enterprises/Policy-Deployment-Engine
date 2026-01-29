## 🛡️ Policy Deployment Engine: `vpc_access_connector`

This section provides a concise policy evaluation for the `vpc_access_connector` resource in GCP.

Reference: [Terraform Registry – vpc_access_connector](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/vpc_access_connector)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `name` | The name of the resource (Max 25 characters). | true | false | Resource name generally has no direct security impact. | pde-vpc-connector | unapproved-name-longer-than-allowed |
| `network` | Name or self_link of the VPC network. Required if `ip_cidr_range` is set. | false | true | Restricting the network ensures that the connector only connects to authorized VPCs. | production-vpc | unapproved-vpc |
| `ip_cidr_range` | The range of internal addresses that follows RFC 4632 notation. Example: `10.132.0.0/28`. | false | true | Restricting the IP CIDR range ensures that the connector is deployed within approved network segments. | 10.8.0.0/28 | 192.168.1.0/28 |
| `machine_type` | Machine type of VM Instance underlying connector. Default is e2-micro | false | true | Enforcing approved machine types helps manage costs and ensures predictable performance/security profiles. | e2-micro | n1-standard-1 |
| `min_throughput` | Minimum throughput of the connector in Mbps. Default and min is 200. Refers to the expected throughput when using an e2-micro machine type. Value must be a multiple of 100 from 200 through 900. Must be lower than the value specified by max_throughput. Only one of `min_throughput` and `min_instances` can be specified. The use of min_throughput is discouraged in favor of min_instances. | false | true | Setting a minimum throughput ensures that the connector has sufficient capacity to handle traffic. | 400 | 200 |
| `min_instances` | Minimum value of instances in autoscaling group underlying the connector. Value must be between 2 and 9, inclusive. Must be lower than the value specified by max_instances. Required alongside `max_instances` if not using `min_throughput`/`max_throughput`. | false | true | Enforcing a minimum number of instances ensures high availability and resilience for the connector. | 2 | 1 |
| `max_instances` | Maximum value of instances in autoscaling group underlying the connector. Value must be between 3 and 10, inclusive. Must be higher than the value specified by min_instances. Required alongside `min_instances` if not using `min_throughput`/`max_throughput`. | false | true | Setting a maximum number of instances prevents excessive resource consumption and cost overruns. | 5 | 11 |
| `max_throughput` | Maximum throughput of the connector in Mbps, must be greater than `min_throughput`. Default is 300. Refers to the expected throughput when using an e2-micro machine type. Value must be a multiple of 100 from 300 through 1000. Must be higher than the value specified by min_throughput. Only one of `max_throughput` and `max_instances` can be specified. The use of max_throughput is discouraged in favor of max_instances. | false | true | Limiting maximum throughput helps control egress costs and prevents potential network saturation. | 400 | 1100 |
| `subnet` | The subnet in which to house the connector Structure is [documented below](#nested_subnet). | false | true | Enforcing specific subnets allows for better network isolation and security controls. | production-subnet | unapproved-subnet |
| `region` | Region where the VPC Access connector resides. If it is not provided, the provider region is used. | false | true | Restricting the region helps maintain data residency compliance and optimizes network latency. | australia-southeast1 | us-central1 |
| `project` | If it is not provided, the provider project is used. | true | true | Deploying resources under the correct project ('PDE') is essential for governance, billing, and access control. | PDE | unapproved-project-id |

### subnet Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `name` | Subnet name (relative, not fully qualified). E.g. if the full subnet selfLink is https://compute.googleapis.com/compute/v1/projects/{project}/regions/{region}/subnetworks/{subnetName} the correct input for this field would be {subnetName}" | false | true | Restricting the subnet ensures that the connector is deployed within approved network segments. | approved-subnet | unapproved-subnet |
| `project_id` | Project in which the subnet exists. If not set, this project is assumed to be the project for which the connector create request was issued. | false | true | Specifying the correct project for the subnet is important for cross-project networking security. | PDE | unapproved-project-id |
