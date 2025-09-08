## 🛡️ Policy Deployment Engine: `storage_transfer_job`

This section provides a concise policy evaluation for the `storage_transfer_job` resource in GCP.

Reference: [Terraform Registry – storage_transfer_job](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_transfer_job)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` |  | none | None | None |
| `description` |  | none | None | None |
| `project` | is not provided, the provider project is used. | none | None | None |
| `status` |  | none | None | None |
| `logging_config` |  | none | None | None |

### transfer_spec Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `source_agent_pool_name` |  | none | None | None |
| `sink_agent_pool_name` |  | none | None | None |
| `gcs_data_sink` |  | none | None | None |
| `posix_data_sink` |  | none | None | None |
| `object_conditions` |  | none | None | None |
| `transfer_options` |  | none | None | None |
| `gcs_data_source` |  | none | None | None |
| `posix_data_source` |  | none | None | None |
| `aws_s3_data_source` |  | none | None | None |
| `http_data_source` |  | none | None | None |
| `azure_blob_storage_data_source` |  | none | None | None |
| `hdfs_data_source` |  | none | None | None |

### replication_spec Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `gcs_data_sink` |  | none | None | None |
| `gcs_data_source` |  | none | None | None |
| `object_conditions` |  | none | None | None |
| `transfer_options` |  | none | None | None |

### schedule Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `schedule_start_date` |  | none | None | None |
| `schedule_end_date` |  | none | None | None |
| `start_time_of_day` |  | none | None | None |
| `repeat_interval` |  | none | None | None |

### event_stream Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` |  | none | None | None |
| `event_stream_start_time` |  | none | None | None |
| `event_stream_expiration_time` |  | none | None | None |

### notification_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `pubsub_topic` |  | none | None | None |
| `event_types` |  | none | None | None |
| `payload_format` |  | none | None | None |

### object_conditions Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `max_time_elapsed_since_last_modification` |  | none | None | None |
| `min_time_elapsed_since_last_modification` | A duration in seconds with up to nine fractional digits, terminated by 's'. Example: "3.5s". | none | None | None |
| `include_prefixes` |  | none | None | None |
| `exclude_prefixes` |  | none | None | None |
| `last_modified_since` |  | none | None | None |
| `last_modified_before` |  | none | None | None |

### transfer_options Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `overwrite_objects_already_existing_in_sink` |  | none | None | None |
| `delete_objects_unique_in_sink` | `delete_objects_from_source_after_transfer` are mutually exclusive. | none | None | None |
| `delete_objects_from_source_after_transfer` |  | none | None | None |
| `overwrite_when` |  | none | None | None |

### gcs_data_sink Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `bucket_name` |  | none | None | None |
| `path` |  | none | None | None |

### gcs_data_source Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `bucket_name` |  | none | None | None |
| `path` |  | none | None | None |

### posix_data_sink Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `root_directory` |  | none | None | None |

### posix_data_source Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `root_directory` |  | none | None | None |

### hdfs_data_source Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `path` |  | none | None | None |

### aws_s3_data_source Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `bucket_name` |  | none | None | None |
| `path` |  | none | None | None |
| `aws_access_key` |  | none | None | None |
| `role_arn` |  | none | None | None |
| `managed_private_network` |  | none | None | None |
| `cloudfront_domain` |  | none | None | None |

### aws_access_key Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `access_key_id` |  | none | None | None |
| `secret_access_key` |  | none | None | None |

### http_data_source Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `list_url` |  | none | None | None |

### azure_blob_storage_data_source Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `storage_account` |  | none | None | None |
| `container` |  | none | None | None |
| `path` |  | none | None | None |
| `credentials_secret` |  | none | None | None |
| `azure_credentials` |  | none | None | None |

### azure_credentials Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `sas_token` | The `schedule_start_date` and `schedule_end_date` blocks support: | none | None | None |
| `year` |  | none | None | None |
| `month` |  | none | None | None |
| `day` | The `start_time_of_day` blocks support: | none | None | None |
| `hours` |  | none | None | None |
| `minutes` |  | none | None | None |
| `seconds` |  | none | None | None |
| `nanos` |  | none | None | None |

### loggin_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `log_actions` | Each action may be one of `FIND`, `DELETE`, and `COPY`. | none | None | None |
| `log_action_states` | Each action state may be one of `SUCCEEDED`, and `FAILED`. | none | None | None |
| `enable_on_prem_gcs_transfer` | Defaults to false. | none | None | None |
