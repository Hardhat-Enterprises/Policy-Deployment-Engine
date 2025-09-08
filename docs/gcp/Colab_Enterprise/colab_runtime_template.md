## 🛡️ Policy Deployment Engine: `colab_runtime_template`

This section provides a concise policy evaluation for the `colab_runtime_template` resource in GCP.

Reference: [Terraform Registry – colab_runtime_template](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/colab_runtime_template)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `display_name` | Required. The display name of the Runtime Template. | true | None | None |
| `location` | The location for the resource: https://cloud.google.com/colab/docs/locations | true | None | None |
| `name` | The resource name of the Runtime Template | false | None | None |
| `description` | The description of the Runtime Template. | false | None | None |
| `labels` | Labels to identify and group the runtime template. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | None | None |
| `network_tags` | Applies the given Compute Engine tags to the runtime. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### machine_spec Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `machine_type` | The Compute Engine machine type selected for the runtime. | false | None | None |
| `accelerator_type` | The type of hardware accelerator used by the runtime. If specified, acceleratorCount must also be specified. | false | None | None |
| `accelerator_count` | The number of accelerators used by the runtime. | false | None | None |

### data_persistent_disk_spec Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `disk_type` | The type of the persistent disk. | false | None | None |
| `disk_size_gb` | The disk size of the runtime in GB. If specified, the diskType must also be specified. The minimum size is 10GB and the maximum is 65536GB. | false | None | None |

### network_spec Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `enable_internet_access` | Enable public internet access for the runtime. | false | None | None |
| `network` | The name of the VPC that this runtime is in. | false | None | None |
| `subnetwork` | The name of the subnetwork that this runtime is in. | false | None | None |

### idle_shutdown_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `idle_timeout` | The duration after which the runtime is automatically shut down. An input of 0s disables the idle shutdown feature, and a valid range is [10m, 24h]. | false | None | None |

### euc_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `euc_disabled` | Disable end user credential access for the runtime. | false | None | None |

### shielded_vm_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `enable_secure_boot` | Enables secure boot for the runtime. | false | None | None |

### encryption_spec Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `kms_key_name` | The Cloud KMS encryption key (customer-managed encryption key) used to protect the runtime. | false | None | None |

### software_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `env` | Environment variables to be passed to the container. Structure is [documented below](#nested_software_config_env). | false | None | None |
| `post_startup_script_config` | , Deprecated) Post startup script config. Structure is [documented below](#nested_software_config_post_startup_script_config). ~> **Warning:** `post_startup_script_config` is deprecated and will be removed in a future major release. New resource creation with this field is unavailable at this time. | false | None | None |

### env Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | Name of the environment variable. Must be a valid C identifier. | false | None | None |
| `value` | Variables that reference a $(VAR_NAME) are expanded using the previous defined environment variables in the container and any service environment variables. If a variable cannot be resolved, the reference in the input string will be unchanged. The $(VAR_NAME) syntax can be escaped with a double $$, ie: $$(VAR_NAME). Escaped references will never be expanded, regardless of whether the variable exists or not. | false | None | None |

### post_startup_script_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `post_startup_script` | Post startup script to run after runtime is started. | false | None | None |
| `post_startup_script_url` | Post startup script url to download. Example: https://bucket/script.sh. | false | None | None |
| `post_startup_script_behavior` | Post startup script behavior that defines download and execution behavior. Possible values are: `RUN_ONCE`, `RUN_EVERY_START`, `DOWNLOAD_AND_RUN_EVERY_START`. | false | None | None |
