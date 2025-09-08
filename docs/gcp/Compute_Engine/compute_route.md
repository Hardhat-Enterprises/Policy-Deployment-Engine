## 🛡️ Policy Deployment Engine: `compute_route`

This section provides a concise policy evaluation for the `compute_route` resource in GCP.

Reference: [Terraform Registry – compute_route](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_route)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `dest_range` | The destination range of outgoing packets that this route applies to. Only IPv4 is supported. | true | None | None |
| `name` | Name of the resource. Provided by the client when the resource is created. The name must be 1-63 characters long, and comply with RFC1035.  Specifically, the name must be 1-63 characters long and match the regular expression `[a-z]([-a-z0-9]*[a-z0-9])?` which means the first character must be a lowercase letter, and all following characters must be a dash, lowercase letter, or digit, except the last character, which cannot be a dash. | true | None | None |
| `network` | The network that this route applies to. | true | None | None |
| `description` | An optional description of this resource. Provide this property when you create the resource. | false | None | None |
| `priority` | The priority of this route. Priority is used to break ties in cases where there is more than one matching route of equal prefix length. In the case of two routes with equal prefix length, the one with the lowest-numbered priority value wins. Default value is 1000. Valid range is 0 through 65535. | false | None | None |
| `tags` | A list of instance tags to which this route applies. | false | None | None |
| `next_hop_gateway` | URL to a gateway that should handle matching packets. Currently, you can only specify the internet gateway, using a full or partial valid URL: * `https://www.googleapis.com/compute/v1/projects/project/global/gateways/default-internet-gateway` * `projects/project/global/gateways/default-internet-gateway` * `global/gateways/default-internet-gateway` * The string `default-internet-gateway`. | false | None | None |
| `next_hop_instance` | URL to an instance that should handle matching packets. You can specify this as a full or partial URL. For example: * `https://www.googleapis.com/compute/v1/projects/project/zones/zone/instances/instance` * `projects/project/zones/zone/instances/instance` * `zones/zone/instances/instance` * Just the instance name, with the zone in `next_hop_instance_zone`. | false | None | None |
| `next_hop_ip` | Network IP address of an instance that should handle matching packets. | false | None | None |
| `next_hop_vpn_tunnel` | URL to a VpnTunnel that should handle matching packets. | false | None | None |
| `next_hop_ilb` | The IP address or URL to a forwarding rule of type loadBalancingScheme=INTERNAL that should handle matching packets. With the GA provider you can only specify the forwarding rule as a partial or full URL. For example, the following are all valid values: * 10.128.0.56 * https://www.googleapis.com/compute/v1/projects/project/regions/region/forwardingRules/forwardingRule * regions/region/forwardingRules/forwardingRule When the beta provider, you can also specify the IP address of a forwarding rule from the same VPC or any peered VPC. Note that this can only be used when the destinationRange is a public (non-RFC 1918) IP CIDR range. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |
| `next_hop_instance_zone` | specified)  The zone of the instance specified in `next_hop_instance`.  Omit if `next_hop_instance` is specified as a URL. | none | None | None |

### params Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `resource_manager_tags` | Resource manager tags to be bound to the route. Tag keys and values have the same definition as resource manager tags. Keys must be in the format tagKeys/{tag_key_id}, and values are in the format tagValues/456. The field is ignored when empty. The field is immutable and causes resource replacement when mutated. This field is only set at create time and modifying this field after creation will trigger recreation. To apply tags to an existing resource, see the google_tags_tag_binding resource. | false | None | None |
