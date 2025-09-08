## 🛡️ Policy Deployment Engine: `storage_control_project_intelligence_config`

This section provides a concise policy evaluation for the `storage_control_project_intelligence_config` resource in GCP.

Reference: [Terraform Registry – storage_control_project_intelligence_config](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_control_project_intelligence_config)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | Identifier of the GCP project. For GCP project, this field can be project name or project number. | true | None | None |
| `edition_config` | Edition configuration of the Storage Intelligence resource. Valid values are INHERIT, TRIAL, DISABLED and STANDARD. | false | None | None |

### filter Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `excluded_cloud_storage_buckets` | Buckets to exclude from the Storage Intelligence plan. Structure is [documented below](#nested_filter_excluded_cloud_storage_buckets). | false | None | None |
| `included_cloud_storage_buckets` | Buckets to include in the Storage Intelligence plan. Structure is [documented below](#nested_filter_included_cloud_storage_buckets). | false | None | None |
| `excluded_cloud_storage_locations` | Locations to exclude from the Storage Intelligence plan. Structure is [documented below](#nested_filter_excluded_cloud_storage_locations). | false | None | None |
| `included_cloud_storage_locations` | Locations to include in the Storage Intelligence plan. Structure is [documented below](#nested_filter_included_cloud_storage_locations). | false | None | None |

### excluded_cloud_storage_buckets Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `bucket_id_regexes` | List of bucket id regexes to exclude in the storage intelligence plan. | true | None | None |

### included_cloud_storage_buckets Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `bucket_id_regexes` | List of bucket id regexes to exclude in the storage intelligence plan. | true | None | None |

### excluded_cloud_storage_locations Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `locations` | List of locations. | true | None | None |

### included_cloud_storage_locations Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `locations` | List of locations. | true | None | None |
