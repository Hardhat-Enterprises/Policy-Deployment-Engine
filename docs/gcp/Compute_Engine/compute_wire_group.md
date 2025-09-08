## 🛡️ Policy Deployment Engine: `compute_wire_group`

This section provides a concise policy evaluation for the `compute_wire_group` resource in GCP.

Reference: [Terraform Registry – compute_wire_group](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_wire_group)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | Name of the resource. Provided by the client when the resource is created. The name must be 1-63 characters long, and comply with RFC1035. Specifically, the name must be 1-63 characters long and match the regular expression `[a-z]([-a-z0-9]*[a-z0-9])?` which means the first character must be a lowercase letter, and all following characters must be a dash, lowercase letter, or digit, except the last character, which cannot be a dash. | true | None | None |
| `cross_site_network` | Required cross site network to which wire group belongs. | true | None | None |
| `description` | An optional description of this resource. Provide this property when you create the resource. | false | None | None |
| `admin_enabled` | Indicates whether the wire group is administratively enabled. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### endpoints Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `endpoint` |  | none | None | None |
| `interconnects` | Structure is [documented below](#nested_endpoints_endpoints_interconnects). | false | None | None |

### wire_group_properties Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `type` | Type of wire group (enum). WIRE: a single pseudowire over two Interconnect connections   with no redundancy. REDUNDANT: two pseudowires over four Interconnect connections, with two connections in one metro and two connections in another metro. BOX_AND_CROSS: four pseudowires over four Interconnect connections, with two connections in one metro and two connections in another metro. | false | None | None |

### wire_properties Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `bandwidth_unmetered` | The unmetered bandwidth setting. | false | None | None |
| `fault_response` | Response when a fault is detected in a pseudowire: NONE: default. DISABLE_PORT: set the port line protocol down when inline probes detect a fault. This setting is only permitted on port mode pseudowires. | false | None | None |

### interconnects Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `interconnect_name` |  | none | None | None |
| `interconnect` |  | false | None | None |
| `vlan_tags` | VLAN tags for the interconnect. | false | None | None |
