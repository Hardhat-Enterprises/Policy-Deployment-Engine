## 🛡️ Policy Deployment Engine: `compute_packet_mirroring`

This section provides a concise policy evaluation for the `compute_packet_mirroring` resource in GCP.

Reference: [Terraform Registry – compute_packet_mirroring](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_packet_mirroring)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | The name of the packet mirroring rule | true | None | None |
| `description` | A human-readable description of the rule. | false | None | None |
| `region` | The Region in which the created address should reside. If it is not provided, the provider region is used. | false | None | None |
| `priority` | Since only one rule can be active at a time, priority is used to break ties in the case of two rules that apply to the same instances. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### network Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `url` | The full self_link URL of the network where this rule is active. | true | None | None |

### collector_ilb Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `url` | The URL of the forwarding rule. | true | None | None |

### mirrored_resources Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `subnetworks` | All instances in one of these subnetworks will be mirrored. Structure is [documented below](#nested_mirrored_resources_subnetworks). | false | None | None |
| `instances` | All the listed instances will be mirrored.  Specify at most 50. Structure is [documented below](#nested_mirrored_resources_instances). | false | None | None |
| `tags` | All instances with these tags will be mirrored. | false | None | None |

### filter Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `ip_protocols` | Possible IP protocols including tcp, udp, icmp and esp | false | None | None |
| `cidr_ranges` | IP CIDR ranges that apply as a filter on the source (ingress) or destination (egress) IP in the IP header. Only IPv4 is supported. | false | None | None |
| `direction` | Direction of traffic to mirror. Default value is `BOTH`. Possible values are: `INGRESS`, `EGRESS`, `BOTH`. | false | None | None |

### subnetworks Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `url` | The URL of the subnetwork where this rule should be active. | true | None | None |

### instances Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `url` | The URL of the instances where this rule should be active. | true | None | None |
