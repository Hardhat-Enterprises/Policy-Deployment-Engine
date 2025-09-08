## 🛡️ Policy Deployment Engine: `os_config_patch_deployment`

This section provides a concise policy evaluation for the `os_config_patch_deployment` resource in GCP.

Reference: [Terraform Registry – os_config_patch_deployment](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/os_config_patch_deployment)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `patch_deployment_id` | A name for the patch deployment in the project. When creating a name the following rules apply: * Must contain only lowercase letters, numbers, and hyphens. * Must start with a letter. * Must be between 1-63 characters. * Must end with a number or a letter. * Must be unique within the project. | true | None | None |
| `description` | Description of the patch deployment. Length of the description is limited to 1024 characters. | false | None | None |
| `duration` | Duration of the patch. After the duration ends, the patch times out. A duration in seconds with up to nine fractional digits, terminated by 's'. Example: "3.5s" | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### instance_filter Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `all` | Target all VM instances in the project. If true, no other criteria is permitted. | false | None | None |
| `group_labels` | Targets VM instances matching ANY of these GroupLabels. This allows targeting of disparate groups of VM instances. Structure is [documented below](#nested_instance_filter_group_labels). | false | None | None |
| `zones` | Targets VM instances in ANY of these zones. Leave empty to target VM instances in any zone. | false | None | None |
| `instances` | Targets any of the VM instances specified. Instances are specified by their URI in the `form zones/{{zone}}/instances/{{instance_name}}`, `projects/{{project_id}}/zones/{{zone}}/instances/{{instance_name}}`, or `https://www.googleapis.com/compute/v1/projects/{{project_id}}/zones/{{zone}}/instances/{{instance_name}}` | false | None | None |
| `instance_name_prefixes` | Targets VMs whose name starts with one of these prefixes. Similar to labels, this is another way to group VMs when targeting configs, for example prefix="prod-". | false | None | None |

### patch_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `mig_instances_allowed` | Allows the patch job to run on Managed instance groups (MIGs). | false | None | None |
| `reboot_config` | Post-patch reboot settings. Possible values are: `DEFAULT`, `ALWAYS`, `NEVER`. | false | None | None |
| `apt` | Apt update settings. Use this setting to override the default apt patch rules. Structure is [documented below](#nested_patch_config_apt). | false | None | None |
| `yum` | Yum update settings. Use this setting to override the default yum patch rules. Structure is [documented below](#nested_patch_config_yum). | false | None | None |
| `goo` | goo update settings. Use this setting to override the default goo patch rules. Structure is [documented below](#nested_patch_config_goo). | false | None | None |
| `zypper` | zypper update settings. Use this setting to override the default zypper patch rules. Structure is [documented below](#nested_patch_config_zypper). | false | None | None |
| `windows_update` | Windows update settings. Use this setting to override the default Windows patch rules. Structure is [documented below](#nested_patch_config_windows_update). | false | None | None |
| `pre_step` | The ExecStep to run before the patch update. Structure is [documented below](#nested_patch_config_pre_step). | false | None | None |
| `post_step` | The ExecStep to run after the patch update. Structure is [documented below](#nested_patch_config_post_step). | false | None | None |

### one_time_schedule Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `execute_time` | The desired patch job execution time. A timestamp in RFC3339 UTC "Zulu" format, accurate to nanoseconds. Example: "2014-10-02T15:01:23.045123456Z". | true | None | None |

### recurring_schedule Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `time_zone` | Defines the time zone that timeOfDay is relative to. The rules for daylight saving time are determined by the chosen time zone. Structure is [documented below](#nested_recurring_schedule_time_zone). | true | None | None |
| `start_time` | The time that the recurring schedule becomes effective. Defaults to createTime of the patch deployment. A timestamp in RFC3339 UTC "Zulu" format, accurate to nanoseconds. Example: "2014-10-02T15:01:23.045123456Z". | false | None | None |
| `end_time` | The end time at which a recurring patch deployment schedule is no longer active. A timestamp in RFC3339 UTC "Zulu" format, accurate to nanoseconds. Example: "2014-10-02T15:01:23.045123456Z". | false | None | None |
| `time_of_day` | Time of the day to run a recurring deployment. Structure is [documented below](#nested_recurring_schedule_time_of_day). | true | None | None |
| `last_execute_time` | (Output) The time the last patch job ran successfully. A timestamp in RFC3339 UTC "Zulu" format, accurate to nanoseconds. Example: "2014-10-02T15:01:23.045123456Z". | none | None | None |
| `next_execute_time` | (Output) The time the next patch job is scheduled to run. A timestamp in RFC3339 UTC "Zulu" format, accurate to nanoseconds. Example: "2014-10-02T15:01:23.045123456Z". | none | None | None |
| `weekly` | Schedule with weekly executions. Structure is [documented below](#nested_recurring_schedule_weekly). | false | None | None |
| `monthly` | Schedule with monthly executions. Structure is [documented below](#nested_recurring_schedule_monthly). | false | None | None |

### rollout Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `mode` | Mode of the patch rollout. Possible values are: `ZONE_BY_ZONE`, `CONCURRENT_ZONES`. | true | None | None |
| `disruption_budget` | The maximum number (or percentage) of VMs per zone to disrupt at any given moment. The number of VMs calculated from multiplying the percentage by the total number of VMs in a zone is rounded up. During patching, a VM is considered disrupted from the time the agent is notified to begin until patching has completed. This disruption time includes the time to complete reboot and any post-patch steps. A VM contributes to the disruption budget if its patching operation fails either when applying the patches, running pre or post patch steps, or if it fails to respond with a success notification before timing out. VMs that are not running or do not have an active agent do not count toward this disruption budget. For zone-by-zone rollouts, if the disruption budget in a zone is exceeded, the patch job stops, because continuing to the next zone requires completion of the patch process in the previous zone. For example, if the disruption budget has a fixed value of 10, and 8 VMs fail to patch in the current zone, the patch job continues to patch 2 VMs at a time until the zone is completed. When that zone is completed successfully, patching begins with 10 VMs at a time in the next zone. If 10 VMs in the next zone fail to patch, the patch job stops. Structure is [documented below](#nested_rollout_disruption_budget). | true | None | None |

### group_labels Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `labels` | Compute Engine instance labels that must be present for a VM instance to be targeted by this filter | true | None | None |

### apt Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `type` | By changing the type to DIST, the patching is performed using apt-get dist-upgrade instead. Possible values are: `DIST`, `UPGRADE`. | false | None | None |
| `excludes` | List of packages to exclude from update. These packages will be excluded. | false | None | None |
| `exclusive_packages` | An exclusive list of packages to be updated. These are the only packages that will be updated. If these packages are not installed, they will be ignored. This field cannot be specified with any other patch configuration fields. | false | None | None |

### yum Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `security` | Adds the --security flag to yum update. Not supported on all platforms. | false | None | None |
| `minimal` | Will cause patch to run yum update-minimal instead. | false | None | None |
| `excludes` | List of packages to exclude from update. These packages will be excluded. | false | None | None |
| `exclusive_packages` | An exclusive list of packages to be updated. These are the only packages that will be updated. If these packages are not installed, they will be ignored. This field cannot be specified with any other patch configuration fields. | false | None | None |

### goo Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `enabled` | goo update settings. Use this setting to override the default goo patch rules. | true | None | None |

### zypper Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `with_optional` | Adds the --with-optional flag to zypper patch. | false | None | None |
| `with_update` | Adds the --with-update flag, to zypper patch. | false | None | None |
| `categories` | Install only patches with these categories. Common categories include security, recommended, and feature. | false | None | None |
| `severities` | Install only patches with these severities. Common severities include critical, important, moderate, and low. | false | None | None |
| `excludes` | List of packages to exclude from update. | false | None | None |
| `exclusive_patches` | An exclusive list of patches to be updated. These are the only patches that will be installed using 'zypper patch patch:' command. This field must not be used with any other patch configuration fields. | false | None | None |

### windows_update Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `classifications` | Only apply updates of these windows update classifications. If empty, all updates are applied. Each value may be one of: `CRITICAL`, `SECURITY`, `DEFINITION`, `DRIVER`, `FEATURE_PACK`, `SERVICE_PACK`, `TOOL`, `UPDATE_ROLLUP`, `UPDATE`. | false | None | None |
| `excludes` | List of KBs to exclude from update. | false | None | None |
| `exclusive_patches` | An exclusive list of kbs to be updated. These are the only patches that will be updated. This field must not be used with other patch configurations. | false | None | None |

### pre_step Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `linux_exec_step_config` | The ExecStepConfig for all Linux VMs targeted by the PatchJob. Structure is [documented below](#nested_patch_config_pre_step_linux_exec_step_config). | false | None | None |
| `windows_exec_step_config` | The ExecStepConfig for all Windows VMs targeted by the PatchJob. Structure is [documented below](#nested_patch_config_pre_step_windows_exec_step_config). | false | None | None |

### linux_exec_step_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `allowed_success_codes` | Defaults to [0]. A list of possible return values that the execution can return to indicate a success. | false | None | None |
| `interpreter` | The script interpreter to use to run the script. If no interpreter is specified the script will be executed directly, which will likely only succeed for scripts with shebang lines. Possible values are: `SHELL`, `POWERSHELL`. | false | None | None |
| `local_path` | An absolute path to the executable on the VM. | false | None | None |
| `gcs_object` | A Cloud Storage object containing the executable. Structure is [documented below](#nested_patch_config_post_step_linux_exec_step_config_gcs_object). | false | None | None |

### gcs_object Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `bucket` | Bucket of the Cloud Storage object. | true | None | None |
| `object` | Name of the Cloud Storage object. | true | None | None |
| `generation_number` | Generation number of the Cloud Storage object. This is used to ensure that the ExecStep specified by this PatchJob does not change. | true | None | None |

### windows_exec_step_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `allowed_success_codes` | Defaults to [0]. A list of possible return values that the execution can return to indicate a success. | false | None | None |
| `interpreter` | The script interpreter to use to run the script. If no interpreter is specified the script will be executed directly, which will likely only succeed for scripts with shebang lines. Possible values are: `SHELL`, `POWERSHELL`. | false | None | None |
| `local_path` | An absolute path to the executable on the VM. | false | None | None |
| `gcs_object` | A Cloud Storage object containing the executable. Structure is [documented below](#nested_patch_config_post_step_windows_exec_step_config_gcs_object). | false | None | None |

### post_step Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `linux_exec_step_config` | The ExecStepConfig for all Linux VMs targeted by the PatchJob. Structure is [documented below](#nested_patch_config_post_step_linux_exec_step_config). | false | None | None |
| `windows_exec_step_config` | The ExecStepConfig for all Windows VMs targeted by the PatchJob. Structure is [documented below](#nested_patch_config_post_step_windows_exec_step_config). | false | None | None |

### time_zone Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `id` | IANA Time Zone Database time zone, e.g. "America/New_York". | true | None | None |
| `version` | IANA Time Zone Database version number, e.g. "2019a". | false | None | None |

### time_of_day Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `hours` | Hours of day in 24 hour format. Should be from 0 to 23. An API may choose to allow the value "24:00:00" for scenarios like business closing time. | false | None | None |
| `minutes` | Minutes of hour of day. Must be from 0 to 59. | false | None | None |
| `seconds` | Seconds of minutes of the time. Must normally be from 0 to 59. An API may allow the value 60 if it allows leap-seconds. | false | None | None |
| `nanos` | Fractions of seconds in nanoseconds. Must be from 0 to 999,999,999. | false | None | None |

### weekly Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `day_of_week` | IANA Time Zone Database time zone, e.g. "America/New_York". Possible values are: `MONDAY`, `TUESDAY`, `WEDNESDAY`, `THURSDAY`, `FRIDAY`, `SATURDAY`, `SUNDAY`. | true | None | None |

### monthly Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `week_day_of_month` | Week day in a month. Structure is [documented below](#nested_recurring_schedule_monthly_week_day_of_month). | false | None | None |
| `month_day` | One day of the month. 1-31 indicates the 1st to the 31st day. -1 indicates the last day of the month. Months without the target day will be skipped. For example, a schedule to run "every month on the 31st" will not run in February, April, June, etc. | false | None | None |

### week_day_of_month Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `week_ordinal` | Week number in a month. 1-4 indicates the 1st to 4th week of the month. -1 indicates the last week of the month. | true | None | None |
| `day_of_week` | A day of the week. Possible values are: `MONDAY`, `TUESDAY`, `WEDNESDAY`, `THURSDAY`, `FRIDAY`, `SATURDAY`, `SUNDAY`. | true | None | None |
| `day_offset` | Represents the number of days before or after the given week day of month that the patch deployment is scheduled for. | false | None | None |

### disruption_budget Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `fixed` | Specifies a fixed value. | false | None | None |
| `percentage` | Specifies the relative value defined as a percentage, which will be multiplied by a reference value. | false | None | None |
