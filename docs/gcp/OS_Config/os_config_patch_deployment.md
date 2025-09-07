## 🛡️ Policy Deployment Engine: `os_config_patch_deployment`

This section provides a concise policy evaluation for the `os_config_patch_deployment` resource in GCP.

Reference: [Terraform Registry – os_config_patch_deployment](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/os_config_patch_deployment)

---

## 1. Argument Reference

### `instance_filter`
- Description: (Required) VM instances to patch. Structure is [documented below](#nested_instance_filter).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `patch_deployment_id`
- Description: (Required) A name for the patch deployment in the project. When creating a name the following rules apply: * Must contain only lowercase letters, numbers, and hyphens. * Must start with a letter. * Must be between 1-63 characters. * Must end with a number or a letter. * Must be unique within the project.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) Description of the patch deployment. Length of the description is limited to 1024 characters.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `patch_config`
- Description: (Optional) Patch configuration that is applied. Structure is [documented below](#nested_patch_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `duration`
- Description: (Optional) Duration of the patch. After the duration ends, the patch times out. A duration in seconds with up to nine fractional digits, terminated by 's'. Example: "3.5s"
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `one_time_schedule`
- Description: (Optional) Schedule a one-time execution. Structure is [documented below](#nested_one_time_schedule).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `recurring_schedule`
- Description: (Optional) Schedule recurring executions. Structure is [documented below](#nested_recurring_schedule).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `rollout`
- Description: (Optional) Rollout strategy of the patch job. Structure is [documented below](#nested_rollout).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_instance_filter"></a>The `instance_filter` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `all`
- Description: (Optional) Target all VM instances in the project. If true, no other criteria is permitted.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `group_labels`
- Description: (Optional) Targets VM instances matching ANY of these GroupLabels. This allows targeting of disparate groups of VM instances. Structure is [documented below](#nested_instance_filter_group_labels).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `zones`
- Description: (Optional) Targets VM instances in ANY of these zones. Leave empty to target VM instances in any zone.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `instances`
- Description: (Optional) Targets any of the VM instances specified. Instances are specified by their URI in the `form zones/{{zone}}/instances/{{instance_name}}`, `projects/{{project_id}}/zones/{{zone}}/instances/{{instance_name}}`, or `https://www.googleapis.com/compute/v1/projects/{{project_id}}/zones/{{zone}}/instances/{{instance_name}}`
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `instance_name_prefixes`
- Description: (Optional) Targets VMs whose name starts with one of these prefixes. Similar to labels, this is another way to group VMs when targeting configs, for example prefix="prod-". <a name="nested_instance_filter_group_labels"></a>The `group_labels` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Required) Compute Engine instance labels that must be present for a VM instance to be targeted by this filter <a name="nested_patch_config"></a>The `patch_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `mig_instances_allowed`
- Description: (Optional) Allows the patch job to run on Managed instance groups (MIGs).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `reboot_config`
- Description: (Optional) Post-patch reboot settings. Possible values are: `DEFAULT`, `ALWAYS`, `NEVER`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `apt`
- Description: (Optional) Apt update settings. Use this setting to override the default apt patch rules. Structure is [documented below](#nested_patch_config_apt).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `yum`
- Description: (Optional) Yum update settings. Use this setting to override the default yum patch rules. Structure is [documented below](#nested_patch_config_yum).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `goo`
- Description: (Optional) goo update settings. Use this setting to override the default goo patch rules. Structure is [documented below](#nested_patch_config_goo).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `zypper`
- Description: (Optional) zypper update settings. Use this setting to override the default zypper patch rules. Structure is [documented below](#nested_patch_config_zypper).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `windows_update`
- Description: (Optional) Windows update settings. Use this setting to override the default Windows patch rules. Structure is [documented below](#nested_patch_config_windows_update).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `pre_step`
- Description: (Optional) The ExecStep to run before the patch update. Structure is [documented below](#nested_patch_config_pre_step).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `post_step`
- Description: (Optional) The ExecStep to run after the patch update. Structure is [documented below](#nested_patch_config_post_step). <a name="nested_patch_config_apt"></a>The `apt` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `type`
- Description: (Optional) By changing the type to DIST, the patching is performed using apt-get dist-upgrade instead. Possible values are: `DIST`, `UPGRADE`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `excludes`
- Description: (Optional) List of packages to exclude from update. These packages will be excluded.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `exclusive_packages`
- Description: (Optional) An exclusive list of packages to be updated. These are the only packages that will be updated. If these packages are not installed, they will be ignored. This field cannot be specified with any other patch configuration fields. <a name="nested_patch_config_yum"></a>The `yum` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `security`
- Description: (Optional) Adds the --security flag to yum update. Not supported on all platforms.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `minimal`
- Description: (Optional) Will cause patch to run yum update-minimal instead.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `excludes`
- Description: (Optional) List of packages to exclude from update. These packages will be excluded.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `exclusive_packages`
- Description: (Optional) An exclusive list of packages to be updated. These are the only packages that will be updated. If these packages are not installed, they will be ignored. This field cannot be specified with any other patch configuration fields. <a name="nested_patch_config_goo"></a>The `goo` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enabled`
- Description: (Required) goo update settings. Use this setting to override the default goo patch rules. <a name="nested_patch_config_zypper"></a>The `zypper` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `with_optional`
- Description: (Optional) Adds the --with-optional flag to zypper patch.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `with_update`
- Description: (Optional) Adds the --with-update flag, to zypper patch.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `categories`
- Description: (Optional) Install only patches with these categories. Common categories include security, recommended, and feature.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `severities`
- Description: (Optional) Install only patches with these severities. Common severities include critical, important, moderate, and low.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `excludes`
- Description: (Optional) List of packages to exclude from update.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `exclusive_patches`
- Description: (Optional) An exclusive list of patches to be updated. These are the only patches that will be installed using 'zypper patch patch:' command. This field must not be used with any other patch configuration fields. <a name="nested_patch_config_windows_update"></a>The `windows_update` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `classifications`
- Description: (Optional) Only apply updates of these windows update classifications. If empty, all updates are applied. Each value may be one of: `CRITICAL`, `SECURITY`, `DEFINITION`, `DRIVER`, `FEATURE_PACK`, `SERVICE_PACK`, `TOOL`, `UPDATE_ROLLUP`, `UPDATE`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `excludes`
- Description: (Optional) List of KBs to exclude from update.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `exclusive_patches`
- Description: (Optional) An exclusive list of kbs to be updated. These are the only patches that will be updated. This field must not be used with other patch configurations. <a name="nested_patch_config_pre_step"></a>The `pre_step` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `linux_exec_step_config`
- Description: (Optional) The ExecStepConfig for all Linux VMs targeted by the PatchJob. Structure is [documented below](#nested_patch_config_pre_step_linux_exec_step_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `windows_exec_step_config`
- Description: (Optional) The ExecStepConfig for all Windows VMs targeted by the PatchJob. Structure is [documented below](#nested_patch_config_pre_step_windows_exec_step_config). <a name="nested_patch_config_pre_step_linux_exec_step_config"></a>The `linux_exec_step_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `allowed_success_codes`
- Description: (Optional) Defaults to [0]. A list of possible return values that the execution can return to indicate a success.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `interpreter`
- Description: (Optional) The script interpreter to use to run the script. If no interpreter is specified the script will be executed directly, which will likely only succeed for scripts with shebang lines. Possible values are: `SHELL`, `POWERSHELL`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `local_path`
- Description: (Optional) An absolute path to the executable on the VM.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `gcs_object`
- Description: (Optional) A Cloud Storage object containing the executable. Structure is [documented below](#nested_patch_config_pre_step_linux_exec_step_config_gcs_object). <a name="nested_patch_config_pre_step_linux_exec_step_config_gcs_object"></a>The `gcs_object` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `bucket`
- Description: (Required) Bucket of the Cloud Storage object.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `object`
- Description: (Required) Name of the Cloud Storage object.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `generation_number`
- Description: (Required) Generation number of the Cloud Storage object. This is used to ensure that the ExecStep specified by this PatchJob does not change. <a name="nested_patch_config_pre_step_windows_exec_step_config"></a>The `windows_exec_step_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `allowed_success_codes`
- Description: (Optional) Defaults to [0]. A list of possible return values that the execution can return to indicate a success.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `interpreter`
- Description: (Optional) The script interpreter to use to run the script. If no interpreter is specified the script will be executed directly, which will likely only succeed for scripts with shebang lines. Possible values are: `SHELL`, `POWERSHELL`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `local_path`
- Description: (Optional) An absolute path to the executable on the VM.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `gcs_object`
- Description: (Optional) A Cloud Storage object containing the executable. Structure is [documented below](#nested_patch_config_pre_step_windows_exec_step_config_gcs_object). <a name="nested_patch_config_pre_step_windows_exec_step_config_gcs_object"></a>The `gcs_object` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `bucket`
- Description: (Required) Bucket of the Cloud Storage object.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `object`
- Description: (Required) Name of the Cloud Storage object.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `generation_number`
- Description: (Required) Generation number of the Cloud Storage object. This is used to ensure that the ExecStep specified by this PatchJob does not change. <a name="nested_patch_config_post_step"></a>The `post_step` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `linux_exec_step_config`
- Description: (Optional) The ExecStepConfig for all Linux VMs targeted by the PatchJob. Structure is [documented below](#nested_patch_config_post_step_linux_exec_step_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `windows_exec_step_config`
- Description: (Optional) The ExecStepConfig for all Windows VMs targeted by the PatchJob. Structure is [documented below](#nested_patch_config_post_step_windows_exec_step_config). <a name="nested_patch_config_post_step_linux_exec_step_config"></a>The `linux_exec_step_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `allowed_success_codes`
- Description: (Optional) Defaults to [0]. A list of possible return values that the execution can return to indicate a success.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `interpreter`
- Description: (Optional) The script interpreter to use to run the script. If no interpreter is specified the script will be executed directly, which will likely only succeed for scripts with shebang lines. Possible values are: `SHELL`, `POWERSHELL`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `local_path`
- Description: (Optional) An absolute path to the executable on the VM.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `gcs_object`
- Description: (Optional) A Cloud Storage object containing the executable. Structure is [documented below](#nested_patch_config_post_step_linux_exec_step_config_gcs_object). <a name="nested_patch_config_post_step_linux_exec_step_config_gcs_object"></a>The `gcs_object` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `bucket`
- Description: (Required) Bucket of the Cloud Storage object.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `object`
- Description: (Required) Name of the Cloud Storage object.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `generation_number`
- Description: (Required) Generation number of the Cloud Storage object. This is used to ensure that the ExecStep specified by this PatchJob does not change. <a name="nested_patch_config_post_step_windows_exec_step_config"></a>The `windows_exec_step_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `allowed_success_codes`
- Description: (Optional) Defaults to [0]. A list of possible return values that the execution can return to indicate a success.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `interpreter`
- Description: (Optional) The script interpreter to use to run the script. If no interpreter is specified the script will be executed directly, which will likely only succeed for scripts with shebang lines. Possible values are: `SHELL`, `POWERSHELL`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `local_path`
- Description: (Optional) An absolute path to the executable on the VM.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `gcs_object`
- Description: (Optional) A Cloud Storage object containing the executable. Structure is [documented below](#nested_patch_config_post_step_windows_exec_step_config_gcs_object). <a name="nested_patch_config_post_step_windows_exec_step_config_gcs_object"></a>The `gcs_object` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `bucket`
- Description: (Required) Bucket of the Cloud Storage object.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `object`
- Description: (Required) Name of the Cloud Storage object.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `generation_number`
- Description: (Required) Generation number of the Cloud Storage object. This is used to ensure that the ExecStep specified by this PatchJob does not change. <a name="nested_one_time_schedule"></a>The `one_time_schedule` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `execute_time`
- Description: (Required) The desired patch job execution time. A timestamp in RFC3339 UTC "Zulu" format, accurate to nanoseconds. Example: "2014-10-02T15:01:23.045123456Z". <a name="nested_recurring_schedule"></a>The `recurring_schedule` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `time_zone`
- Description: (Required) Defines the time zone that timeOfDay is relative to. The rules for daylight saving time are determined by the chosen time zone. Structure is [documented below](#nested_recurring_schedule_time_zone).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `start_time`
- Description: (Optional) The time that the recurring schedule becomes effective. Defaults to createTime of the patch deployment. A timestamp in RFC3339 UTC "Zulu" format, accurate to nanoseconds. Example: "2014-10-02T15:01:23.045123456Z".
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `end_time`
- Description: (Optional) The end time at which a recurring patch deployment schedule is no longer active. A timestamp in RFC3339 UTC "Zulu" format, accurate to nanoseconds. Example: "2014-10-02T15:01:23.045123456Z".
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `time_of_day`
- Description: (Required) Time of the day to run a recurring deployment. Structure is [documented below](#nested_recurring_schedule_time_of_day).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `last_execute_time`
- Description: (Output) The time the last patch job ran successfully. A timestamp in RFC3339 UTC "Zulu" format, accurate to nanoseconds. Example: "2014-10-02T15:01:23.045123456Z".
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `next_execute_time`
- Description: (Output) The time the next patch job is scheduled to run. A timestamp in RFC3339 UTC "Zulu" format, accurate to nanoseconds. Example: "2014-10-02T15:01:23.045123456Z".
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `weekly`
- Description: (Optional) Schedule with weekly executions. Structure is [documented below](#nested_recurring_schedule_weekly).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `monthly`
- Description: (Optional) Schedule with monthly executions. Structure is [documented below](#nested_recurring_schedule_monthly). <a name="nested_recurring_schedule_time_zone"></a>The `time_zone` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `id`
- Description: (Required) IANA Time Zone Database time zone, e.g. "America/New_York".
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `version`
- Description: (Optional) IANA Time Zone Database version number, e.g. "2019a". <a name="nested_recurring_schedule_time_of_day"></a>The `time_of_day` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `hours`
- Description: (Optional) Hours of day in 24 hour format. Should be from 0 to 23. An API may choose to allow the value "24:00:00" for scenarios like business closing time.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `minutes`
- Description: (Optional) Minutes of hour of day. Must be from 0 to 59.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `seconds`
- Description: (Optional) Seconds of minutes of the time. Must normally be from 0 to 59. An API may allow the value 60 if it allows leap-seconds.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `nanos`
- Description: (Optional) Fractions of seconds in nanoseconds. Must be from 0 to 999,999,999. <a name="nested_recurring_schedule_weekly"></a>The `weekly` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `day_of_week`
- Description: (Required) IANA Time Zone Database time zone, e.g. "America/New_York". Possible values are: `MONDAY`, `TUESDAY`, `WEDNESDAY`, `THURSDAY`, `FRIDAY`, `SATURDAY`, `SUNDAY`. <a name="nested_recurring_schedule_monthly"></a>The `monthly` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `week_day_of_month`
- Description: (Optional) Week day in a month. Structure is [documented below](#nested_recurring_schedule_monthly_week_day_of_month).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `month_day`
- Description: (Optional) One day of the month. 1-31 indicates the 1st to the 31st day. -1 indicates the last day of the month. Months without the target day will be skipped. For example, a schedule to run "every month on the 31st" will not run in February, April, June, etc. <a name="nested_recurring_schedule_monthly_week_day_of_month"></a>The `week_day_of_month` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `week_ordinal`
- Description: (Required) Week number in a month. 1-4 indicates the 1st to 4th week of the month. -1 indicates the last week of the month.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `day_of_week`
- Description: (Required) A day of the week. Possible values are: `MONDAY`, `TUESDAY`, `WEDNESDAY`, `THURSDAY`, `FRIDAY`, `SATURDAY`, `SUNDAY`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `day_offset`
- Description: (Optional) Represents the number of days before or after the given week day of month that the patch deployment is scheduled for. <a name="nested_rollout"></a>The `rollout` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `mode`
- Description: (Required) Mode of the patch rollout. Possible values are: `ZONE_BY_ZONE`, `CONCURRENT_ZONES`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `disruption_budget`
- Description: (Required) The maximum number (or percentage) of VMs per zone to disrupt at any given moment. The number of VMs calculated from multiplying the percentage by the total number of VMs in a zone is rounded up. During patching, a VM is considered disrupted from the time the agent is notified to begin until patching has completed. This disruption time includes the time to complete reboot and any post-patch steps. A VM contributes to the disruption budget if its patching operation fails either when applying the patches, running pre or post patch steps, or if it fails to respond with a success notification before timing out. VMs that are not running or do not have an active agent do not count toward this disruption budget. For zone-by-zone rollouts, if the disruption budget in a zone is exceeded, the patch job stops, because continuing to the next zone requires completion of the patch process in the previous zone. For example, if the disruption budget has a fixed value of 10, and 8 VMs fail to patch in the current zone, the patch job continues to patch 2 VMs at a time until the zone is completed. When that zone is completed successfully, patching begins with 10 VMs at a time in the next zone. If 10 VMs in the next zone fail to patch, the patch job stops. Structure is [documented below](#nested_rollout_disruption_budget). <a name="nested_rollout_disruption_budget"></a>The `disruption_budget` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `fixed`
- Description: (Optional) Specifies a fixed value.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `percentage`
- Description: (Optional) Specifies the relative value defined as a percentage, which will be multiplied by a reference value.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
