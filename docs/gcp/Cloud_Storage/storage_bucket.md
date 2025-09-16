## 🛡️ Policy Deployment Engine: `storage_bucket`

This section provides a concise policy evaluation for the `storage_bucket` resource in GCP.

Reference: [Terraform Registry – storage_bucket](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket)

---

## Argument Reference
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `name` |  | false | false | None | None | None |
| `location` | - - - | false | true | The region of bucket should be in Australia for data sovereignty purposes | australia-southeast2 | europe-west-1 |
| `force_destroy` | boolean option will delete all contained objects. If you try to delete a bucket that contains objects, Terraform will fail that run. | false | true | To prevent accidental deletion and losing all bucket files | false | true |
| `project` | is not provided, the provider project is used. | false | false | None | None | None |
| `storage_class` |  | false | false | None | None | None |
| `autoclass` |  | false | false | None | None | None |
| `lifecycle_rule` |  | false | false | None | None | None |
| `versioning` |  | false | false | None | None | None |
| `website` |  | false | false | None | None | None |
| `cors` |  | false | true | Allowing the wildcard * for CORS methods exposes sensitive operations to any website, enabling potential data theft or manipulation by attackers | null | * |
| `default_event_based_hold` |  | false | false | None | None | None |
| `retention_policy` |  | false | false | None | None | None |
| `labels` |  | false | false | None | None | None |
| `logging` |  | false | false | None | None | None |
| `encryption` |  | false | true | Encryption to keep the data of bucket secure | abc-key | None |
| `enable_object_retention` |  | false | false | None | None | None |
| `requester_pays` |  | false | false | None | None | None |
| `rpo` |  | false | false | None | None | None |
| `uniform_bucket_level_access` |  | false | true | Need to be enabled for consistent access control | true | false |
| `public_access_prevention` |  | false | true | Prevent sensitive data to be exposed publically | true | inherited |
| `custom_placement_config` |  | false | false | None | None | None |
| `soft_delete_policy` |  | false | false | None | None | None |
| `hierarchical_namespace` |  | false | false | None | None | None |
| `time_created` |  | false | false | None | None | None |
| `updated` |  | false | false | None | None | None |
| `ip_filter` |  | false | true | Make sure that ip exposure is not too broad | 10.0.0.0/16 | 0.0.0.0/0 |
| `action` |  | false | false | None | None | None |
| `public_network_source` |  | false | false | None | None | None |
| `vpc_network_sources` |  | false | false | None | None | None |

### autoclass Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `enabled` |  | false | false | None | None | None |
| `terminal_storage_class` |  | false | false | None | None | None |

### lifecycle_rule Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `action` |  | false | false | None | None | None |
| `condition` |  | false | false | None | None | None |

### versioning Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `enabled` | The `website` block supports the following elements, and requires at least one to be defined: | false | false | None | None | None |
| `main_page_suffix` | missing objects are treated as potential directories. | false | false | None | None | None |
| `not_found_page` | resource is not found. | false | false | None | None | None |

### cors Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `origin` |  | false | false | None | None | None |
| `method` |  | false | false | None | None | None |
| `response_header` |  | false | false | None | None | None |
| `max_age_seconds` |  | false | false | None | None | None |

### retention_policy Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `is_locked` |  | false | true | Should not be used because locking is irreversible ation | false/null | true |
| `retention_period` |  | false | true | Rentention period should be within specified timeline for compliance | 604800/7 days | 2692000 / > 30 days |

### logging Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `log_bucket` |  | false | false | None | None | None |
| `log_object_prefix` | by default GCS sets this to this bucket's name. | false | false | None | None | None |

### custom_placement_config Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `data_locations` |  | false | false | None | None | None |

### soft_delete_policy Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `retention_duration_seconds` |  | false | false | None | None | None |
| `effective_time` |  | false | false | None | None | None |

### hierarchical_namespace Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `enabled` |  | false | false | None | None | None |

### ip_filter Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `mode` |  | false | false | None | None | None |
| `allow_cross_org_vpcs` | * `allow_all_service_agent_access` (Optional) While set `true`, allows all service agents to access the bucket regardless of the IP filter configuration. | false | false | None | None | None |
| `public_network_source` |  | false | false | None | None | None |
| `vpc_network_sources` |  | false | false | None | None | None |

### action Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `type` |  | false | false | None | None | None |
| `storage_class` | The `condition` block supports the following elements, and requires at least one to be defined. If you specify multiple conditions in a rule, an object has to match all of the conditions for the action to be taken: | false | false | None | None | None |
| `age` |  | false | false | None | None | None |
| `created_before` |  | false | false | None | None | None |
| `with_state` |  | false | false | None | None | None |
| `matches_storage_class` |  | false | false | None | None | None |
| `matches_prefix` |  | false | false | None | None | None |
| `matches_suffix` |  | false | false | None | None | None |
| `num_newer_versions` |  | false | false | None | None | None |
| `send_num_newer_versions_if_zero` |  | false | false | None | None | None |
| `custom_time_before` |  | false | false | None | None | None |
| `days_since_custom_time` |  | false | false | None | None | None |
| `send_age_if_zero` |  | false | false | None | None | None |
| `send_days_since_custom_time_if_zero` |  | false | false | None | None | None |
| `days_since_noncurrent_time` |  | false | false | None | None | None |
| `send_days_since_noncurrent_time_if_zero` |  | false | false | None | None | None |
| `noncurrent_time_before` |  | false | false | None | None | None |

### public_network_source Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `allowed_ip_cidr_ranges` |  | false | false | None | None | None |

### vpc_network_sources Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `network` |  | false | false | None | None | None |
| `allowed_ip_cidr_ranges` |  | false | false | None | None | None |
