## 🛡️ Policy Deployment Engine: `vpc_access_connector`

This section provides a concise policy evaluation for the `vpc_access_connector` resource in GCP.

Reference: [Terraform Registry – vpc_access_connector](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/vpc_access_connector)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | The name of the resource (Max 25 characters). | true | None | None |
| `network` | Name or self_link of the VPC network. Required if `ip_cidr_range` is set. | false | None | None |
| `ip_cidr_range` | The range of internal addresses that follows RFC 4632 notation. Example: `10.132.0.0/28`. | false | None | None |
| `machine_type` | Machine type of VM Instance underlying connector. Default is e2-micro | false | None | None |
| `min_throughput` | Minimum throughput of the connector in Mbps. Default and min is 200. Refers to the expected throughput when using an e2-micro machine type. Value must be a multiple of 100 from 200 through 900. Must be lower than the value specified by max_throughput. Only one of `min_throughput` and `min_instances` can be specified. The use of min_throughput is discouraged in favor of min_instances. | false | None | None |
| `min_instances` | Minimum value of instances in autoscaling group underlying the connector. Value must be between 2 and 9, inclusive. Must be lower than the value specified by max_instances. Required alongside `max_instances` if not using `min_throughput`/`max_throughput`. | false | None | None |
| `max_instances` | Maximum value of instances in autoscaling group underlying the connector. Value must be between 3 and 10, inclusive. Must be higher than the value specified by min_instances. Required alongside `min_instances` if not using `min_throughput`/`max_throughput`. | false | None | None |
| `max_throughput` | Maximum throughput of the connector in Mbps, must be greater than `min_throughput`. Default is 300. Refers to the expected throughput when using an e2-micro machine type. Value must be a multiple of 100 from 300 through 1000. Must be higher than the value specified by min_throughput. Only one of `max_throughput` and `max_instances` can be specified. The use of max_throughput is discouraged in favor of max_instances. | false | None | None |
| `region` | Region where the VPC Access connector resides. If it is not provided, the provider region is used. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### subnet Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | Subnet name (relative, not fully qualified). E.g. if the full subnet selfLink is https://compute.googleapis.com/compute/v1/projects/{project}/regions/{region}/subnetworks/{subnetName} the correct input for this field would be {subnetName}" | false | None | None |
| `project_id` | Project in which the subnet exists. If not set, this project is assumed to be the project for which the connector create request was issued. | false | None | None |
