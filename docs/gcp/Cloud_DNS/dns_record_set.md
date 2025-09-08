## 🛡️ Policy Deployment Engine: `dns_record_set`

This section provides a concise policy evaluation for the `dns_record_set` resource in GCP.

Reference: [Terraform Registry – dns_record_set](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/dns_record_set)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `managed_zone` | reside. | none | None | None |
| `name` |  | none | None | None |
| `type` | - - - | none | None | None |
| `rrdatas` | whose meaning depends on the DNS type. For TXT record, if the string data contains spaces, add surrounding `\"` if you don't want your string to get split on spaces. To specify a single record value longer than 255 characters such as a TXT record for DKIM, add `\" \"` inside the Terraform configuration string (e.g. `"first255characters\" \"morecharacters"`). | none | None | None |
| `ttl` |  | none | None | None |
| `project` | is not provided, the provider project is used. | none | None | None |

### routing_policy Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `wrr` | Structure is [documented below](#nested_wrr). | none | None | None |
| `geo` | Structure is [documented below](#nested_geo). | none | None | None |
| `enable_geo_fencing` |  | none | None | None |
| `primary_backup` | Structure is [documented below](#nested_primary_backup). | none | None | None |
| `health_check` |  | none | None | None |

### wrr Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `weight` |  | none | None | None |
| `rrdatas` |  | none | None | None |
| `health_checked_targets` | Structure is [documented below](#nested_health_checked_targets). | none | None | None |

### geo Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `location` |  | none | None | None |
| `rrdatas` |  | none | None | None |
| `health_checked_targets` | Structure is [documented below](#nested_health_checked_targets). | none | None | None |

### primary_backup Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `primary` | Structure is [documented below](#nested_health_checked_targets). | none | None | None |
| `backup_geo` | Structure is [document above](#nested_geo). | none | None | None |
| `enable_geo_fencing_for_backups` |  | none | None | None |
| `trickle_ratio` |  | none | None | None |

### health_checked_targets Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `internal_load_balancers` | Structure is [documented below](#nested_internal_load_balancers). | none | None | None |
| `external_endpoints` |  | none | None | None |

### internal_load_balancers Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `load_balancer_type` |  | none | None | None |
| `ip_address` |  | none | None | None |
| `port` |  | none | None | None |
| `ip_protocol` |  | none | None | None |
| `network_url` |  | none | None | None |
| `project` |  | none | None | None |
| `region` |  | none | None | None |
