## 🛡️ Policy Deployment Engine: `os_config_os_policy_assignment`

This section provides a concise policy evaluation for the `os_config_os_policy_assignment` resource in GCP.

Reference: [Terraform Registry – os_config_os_policy_assignment](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/os_config_os_policy_assignment)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` |  | none | None | None |
| `location` |  | none | None | None |

### os_policies Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `id` | *   Must contain only lowercase letters, numbers, and hyphens. *   Must start with a letter. *   Must be between 1-63 characters. *   Must end with a number or a letter. *   Must be unique within the assignment. | none | None | None |
| `description` | limited to 1024 characters. | none | None | None |
| `mode` | `VALIDATION`, `ENFORCEMENT`. | none | None | None |
| `resource_groups` | particular VM, resource groups are evaluated in the order specified and the first resource group that is applicable is selected and the rest are ignored. If none of the resource groups are applicable for a VM, the VM is considered to be non-compliant w.r.t this policy. This behavior can be toggled by the flag `allow_no_resource_group_match` Structure is [documented below](#nested_resource_groups). | none | None | None |
| `allow_no_resource_group_match` | policy compliance status when none of the resource groups within the policy are applicable for a VM. Set this value to `true` if the policy needs to be reported as compliant even if the policy has nothing to validate or enforce. | none | None | None |

### instance_filter Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `all` | is permitted. | none | None | None |
| `inclusion_labels` | the list has more than one `LabelSet`, the VM is included if any of the label sets are applicable for the VM. Structure is [documented below](#nested_inclusion_labels). | none | None | None |
| `exclusion_labels` | the list has more than one label set, the VM is excluded if any of the label sets are applicable for the VM. Structure is [documented below](#nested_exclusion_labels). | none | None | None |
| `inventories` | selected if its inventory data matches at least one of the following inventories. Structure is [documented below](#nested_inventories). | none | None | None |

### rollout Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `disruption_budget` | per zone to disrupt at any given moment. Structure is [documented below](#nested_disruption_budget). | none | None | None |
| `min_wait_duration` | time to wait after the configuration changes are applied through the current rollout. A VM continues to count towards the `disruption_budget` at least until this duration of time has passed after configuration changes are applied. | none | None | None |

### resource_groups Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `inventory_filters` | group. The resources in this resource group are applied to the target VM if it satisfies at least one of the following inventory filters. For example, to apply this resource group to VMs running either `RHEL` or `CentOS` operating systems, specify 2 items for the list with following values: inventory_filters[0].os_short_name='rhel' and inventory_filters[1].os_short_name='centos' If the list is empty, this resource group will be applied to the target VM unconditionally. Structure is [documented below](#nested_inventory_filters). | none | None | None |
| `resources` | group. The resources are executed in the exact order specified here. Structure is [documented below](#nested_resources). | none | None | None |

### inventory_filters Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `os_short_name` |  | none | None | None |
| `os_version` | asterisk(*) is provided as the last character. For example, to match all versions with a major version of `7`, specify the following value for this field `7.*` An empty string matches all OS versions. | none | None | None |

### resources Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `id` | *   Must contain only lowercase letters, numbers, and hyphens. *   Must start with a letter. *   Must be between 1-63 characters. *   Must end with a number or a letter. *   Must be unique within the OS policy. | none | None | None |
| `pkg` | [documented below](#nested_pkg). | none | None | None |
| `repository` | [documented below](#nested_repository). | none | None | None |
| `exec` | [documented below](#nested_exec). | none | None | None |
| `file` | [documented below](#nested_file). | none | None | None |

### pkg Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `desired_state` | this package. Possible values are: `DESIRED_STATE_UNSPECIFIED`, `INSTALLED`, `REMOVED`. | none | None | None |
| `apt` | [documented below](#nested_apt). | none | None | None |
| `deb` | [documented below](#nested_deb). | none | None | None |
| `yum` | [documented below](#nested_yum). | none | None | None |
| `zypper` | [documented below](#nested_zypper). | none | None | None |
| `rpm` | [documented below](#nested_rpm). | none | None | None |
| `googet` | [documented below](#nested_googet). | none | None | None |
| `msi` | [documented below](#nested_msi). | none | None | None |

### apt Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` |  | none | None | None |
| `archive_type` | Possible values are: `ARCHIVE_TYPE_UNSPECIFIED`, `DEB`, `DEB_SRC`. | none | None | None |
| `uri` |  | none | None | None |
| `distribution` |  | none | None | None |
| `components` | contain at least one item. | none | None | None |
| `gpg_key` | maintains a keyring at `/etc/apt/trusted.gpg.d/osconfig_agent_managed.gpg`. | none | None | None |

### deb Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `source` | [documented below](#nested_source). | none | None | None |
| `pull_deps` | install when false: `dpkg -i package` - install when true: `apt-get update && apt-get -y install package.deb` | none | None | None |

### source Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `remote` | [documented below](#nested_remote). | none | None | None |
| `gcs` | [documented below](#nested_gcs). | none | None | None |
| `local_path` |  | none | None | None |
| `allow_insecure` | subject to validations based on the file type: Remote: A checksum must be specified. Cloud Storage: An object generation number must be specified. | none | None | None |

### remote Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `uri` | both the protocol and path following the format `{protocol}://{location}`. | none | None | None |
| `sha256_checksum` |  | none | None | None |

### gcs Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `bucket` |  | none | None | None |
| `object` |  | none | None | None |
| `generation` |  | none | None | None |

### yum Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` |  | none | None | None |
| `id` | `repo id` in the yum config file and also the `display_name` if `display_name` is omitted. This id is also used as the unique identifier when checking for resource conflicts. | none | None | None |
| `display_name` |  | none | None | None |
| `base_url` |  | none | None | None |
| `gpg_keys` |  | none | None | None |

### zypper Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` |  | none | None | None |
| `id` | `repo id` in the zypper config file and also the `display_name` if `display_name` is omitted. This id is also used as the unique identifier when checking for GuestPolicy conflicts. | none | None | None |
| `display_name` |  | none | None | None |
| `base_url` |  | none | None | None |
| `gpg_keys` |  | none | None | None |

### rpm Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `source` | [documented below](#nested_source). | none | None | None |
| `pull_deps` | install when false: `rpm --upgrade --replacepkgs package.rpm` - install when true: `yum -y install package.rpm` or `zypper -y install package.rpm` | none | None | None |

### googet Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` |  | none | None | None |

### msi Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `source` | [documented below](#nested_source). | none | None | None |
| `properties` | This should be in the format of Property=Setting. Appended to the defaults of `ACTION=INSTALL REBOOT=ReallySuppress`. | none | None | None |

### repository Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `apt` | [documented below](#nested_apt). | none | None | None |
| `yum` | [documented below](#nested_yum). | none | None | None |
| `zypper` | [documented below](#nested_zypper). | none | None | None |
| `goo` | [documented below](#nested_goo). | none | None | None |

### goo Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` |  | none | None | None |
| `url` |  | none | None | None |

### exec Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `validate` | desired state. An exit code of 100 indicates "in desired state", and exit code of 101 indicates "not in desired state". Any other exit code indicates a failure running validate. Structure is [documented below](#nested_validate). | none | None | None |
| `enforce` | state. An exit code of 100 indicates "success", any other exit code indicates a failure running enforce. Structure is [documented below](#nested_enforce). | none | None | None |

### validate Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `file` | [documented below](#nested_file). | none | None | None |
| `script` | 1024 characters. | none | None | None |
| `args` | execution. | none | None | None |
| `interpreter` | are: `INTERPRETER_UNSPECIFIED`, `NONE`, `SHELL`, `POWERSHELL`. | none | None | None |
| `output_file_path` | output file (that is created by this Exec) whose content will be recorded in OSPolicyResourceCompliance after a successful run. Absence or failure to read this file will result in this ExecResource being non-compliant. Output file size is limited to 100K bytes. | none | None | None |

### file Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `remote` | [documented below](#nested_remote). | none | None | None |
| `gcs` | [documented below](#nested_gcs). | none | None | None |
| `local_path` |  | none | None | None |
| `allow_insecure` | subject to validations based on the file type: Remote: A checksum must be specified. Cloud Storage: An object generation number must be specified. | none | None | None |
| `file` | [documented below](#nested_file). | none | None | None |
| `content` | is limited to 1024 characters. | none | None | None |
| `path` |  | none | None | None |
| `state` | `DESIRED_STATE_UNSPECIFIED`, `PRESENT`, `ABSENT`, `CONTENTS_MATCH`. | none | None | None |
| `permissions` | order, the permissions of the owner, group, and other users for the file (similarly to the numeric mode used in the linux chmod utility). Each digit represents a three bit number with the 4 bit corresponding to the read permissions, the 2 bit corresponds to the write bit, and the one bit corresponds to the execute permission. Default behavior is 755. Below are some examples of permissions and their associated values: read, write, and execute: 7 read and execute: 5 read and write: 6 read only: 4 | none | None | None |

### enforce Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `file` | [documented below](#nested_file). | none | None | None |
| `script` | 1024 characters. | none | None | None |
| `args` | execution. | none | None | None |
| `interpreter` | are: `INTERPRETER_UNSPECIFIED`, `NONE`, `SHELL`, `POWERSHELL`. | none | None | None |
| `output_file_path` | output file (that is created by this Exec) whose content will be recorded in OSPolicyResourceCompliance after a successful run. Absence or failure to read this file will result in this ExecResource being non-compliant. Output file size is limited to 100K bytes. | none | None | None |

### inclusion_labels Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `labels` | A VM should contain all the key/value pairs specified in this map to be selected. | none | None | None |

### exclusion_labels Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `labels` | A VM should contain all the key/value pairs specified in this map to be selected. | none | None | None |

### inventories Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `os_short_name` |  | none | None | None |
| `os_version` | asterisk(*) is provided as the last character. For example, to match all versions with a major version of `7`, specify the following value for this field `7.*` An empty string matches all OS versions. | none | None | None |

### disruption_budget Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `fixed` |  | none | None | None |
| `percent` | which will be multiplied by a reference value. -------------------------------------------------------------------------------- | none | None | None |
| `description` | description is limited to 1024 characters. | none | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |
| `skip_await_rollout` | during resource creation and update. | none | None | None |
