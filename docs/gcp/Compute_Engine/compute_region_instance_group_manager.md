## 🛡️ Policy Deployment Engine: `compute_region_instance_group_manager`

This section provides a concise policy evaluation for the `compute_region_instance_group_manager` resource in GCP.

Reference: [Terraform Registry – compute_region_instance_group_manager](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_region_instance_group_manager)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `base_instance_name` | instances in this group. The value must be a valid [RFC1035](https://www.ietf.org/rfc/rfc1035.txt) name. Supported characters are lowercase letters, numbers, and hyphens (-). Instances are named by appending a hyphen and a random four-character string to the base instance name. | none | None | None |
| `name` | characters long and comply with [RFC1035](https://www.ietf.org/rfc/rfc1035.txt). Supported characters include lowercase letters, numbers, and hyphens. | none | None | None |
| `region` | - - - | none | None | None |
| `description` | group manager. | none | None | None |
| `project` | is not provided, the provider project is used. | none | None | None |
| `list_managed_instances_results` | method for this managed instance group. Valid values are: `PAGELESS`, `PAGINATED`. If `PAGELESS` (default), Pagination is disabled for the group's `listManagedInstances` API method. `maxResults` and `pageToken` query parameters are ignored and all instances are returned in a single response. If `PAGINATED`, pagination is enabled, `maxResults` and `pageToken` query parameters are respected. | none | None | None |
| `target_pools` | instances in the group are added. Updating the target pools attribute does not affect existing instances. | none | None | None |
| `wait_for_instances` | returning. Note that if this is set to true and the operation does not succeed, Terraform will continue trying until it times out. | none | None | None |
| `wait_for_instances_status` | When `STABLE` is specified this resource will wait until the instances are stable before returning. When `UPDATED` is set, it will wait for the version target to be reached and any per instance configs to be effective as well as all instances to be stable before returning. The possible values are `STABLE` and `UPDATED` --- | none | None | None |
| `target_suspended_size` |  | none | None | None |
| `target_stopped_size` |  | none | None | None |
| `distribution_policy_zones` | group. You can specify one or more values. For more information, see the [official documentation](https://cloud.google.com/compute/docs/instance-groups/distributing-instances-with-regional-instance-groups#selectingzones). | none | None | None |
| `distribution_policy_target_shape` |  | none | None | None |

### version Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `instance_template` |  | none | None | None |
| `name` |  | none | None | None |
| `target_size` | -> Exactly one `version` you specify must not have a `target_size` specified. During a rolling update, the instance group manager will fulfill the `target_size` constraints of every other `version`, and any remaining instances will be provisioned with the version where `target_size` is unset. | none | None | None |

### named_port Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` |  | none | None | None |
| `port` | - - - | none | None | None |

### target_size Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `fixed` |  | none | None | None |
| `percent` | Note that when using `percent`, rounding will be in favor of explicitly set `target_size` values; a managed instance group with 2 instances and 2 `version`s, one of which has a `target_size.percent` of `60` will create 2 instances of that `version`. | none | None | None |

### auto_healing_policies Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `health_check` |  | none | None | None |
| `initial_delay_sec` | it applies autohealing policies to new instances or recently recreated instances. Between 0 and 3600. | none | None | None |

### all_instances_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `metadata` |  | none | None | None |
| `labels` | - - - | none | None | None |

### standby_policy Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `initial_delay_sec` |  | none | None | None |
| `mode` | - - - | none | None | None |

### update_policy Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `minimal_action` |  | none | None | None |
| `most_disruptive_allowed_action` |  | none | None | None |
| `type` |  | none | None | None |
| `instance_redistribution_type` |  | none | None | None |
| `max_surge_fixed` |  | none | None | None |
| `max_surge_percent` |  | none | None | None |
| `max_unavailable_fixed` |  | none | None | None |
| `max_unavailable_percent` |  | none | None | None |
| `min_ready_sec` |  | none | None | None |
| `replacement_method` | - - - | none | None | None |

### stateful_disk Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `device_name` |  | none | None | None |
| `delete_rule` |  | none | None | None |

### stateful_internal_ip Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `interface_name` |  | none | None | None |
| `delete_rule` |  | none | None | None |

### stateful_external_ip Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `interface_name` |  | none | None | None |
| `delete_rule` |  | none | None | None |

### params Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `resource_manager_tags` |  | none | None | None |

### instance_flexibility_policy Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `instance_selections` | - - - | none | None | None |

### instance_lifecycle_policy Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `force_update_on_repair` |  | none | None | None |
| `default_action_on_failure` |  | none | None | None |
| `on_failed_health_check` | - - - | none | None | None |

### instance_selections Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` |  | none | None | None |
| `rank` |  | none | None | None |
| `machine_types` | - - - | none | None | None |
