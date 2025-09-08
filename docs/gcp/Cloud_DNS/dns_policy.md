## 🛡️ Policy Deployment Engine: `dns_policy`

This section provides a concise policy evaluation for the `dns_policy` resource in GCP.

Reference: [Terraform Registry – dns_policy](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/dns_policy)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | User assigned name for this policy. | true | None | None |
| `description` | A textual description field. Defaults to 'Managed by Terraform'. | false | None | None |
| `enable_inbound_forwarding` | Allows networks bound to this policy to receive DNS queries sent by VMs or applications over VPN connections. When enabled, a virtual IP address will be allocated from each of the sub-networks that are bound to this policy. | false | None | None |
| `enable_logging` | Controls whether logging is enabled for the networks bound to this policy. Defaults to no logging if not set. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### alternative_name_server_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `target_name_servers` | Sets an alternative name server for the associated networks. When specified, all DNS queries are forwarded to a name server that you choose. Names such as .internal are not available when an alternative name server is specified. Structure is [documented below](#nested_alternative_name_server_config_target_name_servers). | true | None | None |

### dns64_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `scope` | The scope to which DNS64 config will be applied to. Structure is [documented below](#nested_dns64_config_scope). | true | None | None |

### networks Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `network_url` | The id or fully qualified URL of the VPC network to forward queries to. This should be formatted like `projects/{project}/global/networks/{network}` or `https://www.googleapis.com/compute/v1/projects/{project}/global/networks/{network}` | true | None | None |

### target_name_servers Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `ipv4_address` | IPv4 address to forward to. | true | None | None |
| `forwarding_path` | Forwarding path for this TargetNameServer. If unset or `default` Cloud DNS will make forwarding decision based on address ranges, i.e. RFC1918 addresses go to the VPC, Non-RFC1918 addresses go to the Internet. When set to `private`, Cloud DNS will always send queries through VPC for this target Possible values are: `default`, `private`. | false | None | None |

### scope Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `all_queries` | Controls whether DNS64 is enabled globally at the network level. | false | None | None |
