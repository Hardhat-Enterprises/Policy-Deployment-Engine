## 🛡️ Policy Deployment Engine: `storage_bucket`

This section provides a concise policy evaluation for the `storage_bucket` resource in GCP.

Reference: [Terraform Registry – storage_bucket](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` |  | none | None | None |
| `location` | - - - | none | None | None |
| `force_destroy` | boolean option will delete all contained objects. If you try to delete a bucket that contains objects, Terraform will fail that run. | none | None | None |
| `project` | is not provided, the provider project is used. | none | None | None |
| `storage_class` |  | none | None | None |
| `website` |  | none | None | None |
| `default_event_based_hold` |  | none | None | None |
| `labels` |  | none | None | None |
| `encryption` |  | none | None | None |
| `enable_object_retention` |  | none | None | None |
| `requester_pays` |  | none | None | None |
| `rpo` |  | none | None | None |
| `uniform_bucket_level_access` |  | none | None | None |
| `public_access_prevention` |  | none | None | None |
| `time_created` |  | none | None | None |
| `updated` |  | none | None | None |

### autoclass Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `enabled` |  | none | None | None |
| `terminal_storage_class` |  | none | None | None |

### lifecycle_rule Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `action` |  | none | None | None |
| `condition` |  | none | None | None |

### versioning Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `enabled` | The `website` block supports the following elements, and requires at least one to be defined: | none | None | None |
| `main_page_suffix` | missing objects are treated as potential directories. | none | None | None |
| `not_found_page` | resource is not found. | none | None | None |

### cors Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `origin` |  | none | None | None |
| `method` |  | none | None | None |
| `response_header` |  | none | None | None |
| `max_age_seconds` |  | none | None | None |

### retention_policy Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `is_locked` |  | none | None | None |
| `retention_period` |  | none | None | None |

### logging Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `log_bucket` |  | none | None | None |
| `log_object_prefix` | by default GCS sets this to this bucket's name. | none | None | None |

### custom_placement_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `data_locations` |  | none | None | None |

### soft_delete_policy Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `retention_duration_seconds` |  | none | None | None |
| `effective_time` |  | none | None | None |

### hierarchical_namespace Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `enabled` |  | none | None | None |

### ip_filter Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `mode` |  | none | None | None |
| `allow_cross_org_vpcs` | * `allow_all_service_agent_access` (Optional) While set `true`, allows all service agents to access the bucket regardless of the IP filter configuration. | none | None | None |
| `public_network_source` |  | none | None | None |
| `vpc_network_sources` |  | none | None | None |

### action Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `type` |  | none | None | None |
| `storage_class` | The `condition` block supports the following elements, and requires at least one to be defined. If you specify multiple conditions in a rule, an object has to match all of the conditions for the action to be taken: | none | None | None |
| `age` |  | none | None | None |
| `created_before` |  | none | None | None |
| `with_state` |  | none | None | None |
| `matches_storage_class` |  | none | None | None |
| `matches_prefix` |  | none | None | None |
| `matches_suffix` |  | none | None | None |
| `num_newer_versions` |  | none | None | None |
| `send_num_newer_versions_if_zero` |  | none | None | None |
| `custom_time_before` |  | none | None | None |
| `days_since_custom_time` |  | none | None | None |
| `send_age_if_zero` |  | none | None | None |
| `send_days_since_custom_time_if_zero` |  | none | None | None |
| `days_since_noncurrent_time` |  | none | None | None |
| `send_days_since_noncurrent_time_if_zero` |  | none | None | None |
| `noncurrent_time_before` |  | none | None | None |

### public_network_source Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `allowed_ip_cidr_ranges` |  | none | None | None |

### vpc_network_sources Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `network` |  | none | None | None |
| `allowed_ip_cidr_ranges` |  | none | None | None |
