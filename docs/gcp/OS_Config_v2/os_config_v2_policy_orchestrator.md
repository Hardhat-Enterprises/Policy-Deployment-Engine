## 🛡️ Policy Deployment Engine: `os_config_v2_policy_orchestrator`

This section provides a concise policy evaluation for the `os_config_v2_policy_orchestrator` resource in GCP.

Reference: [Terraform Registry – os_config_v2_policy_orchestrator](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/os_config_v2_policy_orchestrator)

---

## 1. Argument Reference

### `action`
- Description: (Required) Required. Action to be done by the orchestrator in `projects/{project_id}/zones/{zone_id}` locations defined by the `orchestration_scope`. Allowed values: - `UPSERT` - Orchestrator will create or update target resources. - `DELETE` - Orchestrator will delete target resources, if they exist
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `orchestrated_resource`
- Description: (Required) Represents a resource that is being orchestrated by the policy orchestrator. Structure is [documented below](#nested_orchestrated_resource).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `policy_orchestrator_id`
- Description: (Required) Required. The logical identifier of the policy orchestrator, with the following restrictions: * Must contain only lowercase letters, numbers, and hyphens. * Must start with a letter. * Must be between 1-63 characters. * Must end with a number or a letter. * Must be unique within the parent.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) Optional. Freeform text describing the purpose of the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `state`
- Description: (Optional) Optional. State of the orchestrator. Can be updated to change orchestrator behaviour. Allowed values: - `ACTIVE` - orchestrator is actively looking for actions to be taken. - `STOPPED` - orchestrator won't make any changes. Note: There might be more states added in the future. We use string here instead of an enum, to avoid the need of propagating new states to all the client code.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `orchestration_scope`
- Description: (Optional) Defines a set of selectors which drive which resources are in scope of policy orchestration. Structure is [documented below](#nested_orchestration_scope).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) Optional. Labels as key value pairs **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_orchestrated_resource"></a>The `orchestrated_resource` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `os_policy_assignment_v1_payload`
- Description: (Optional) OS policy assignment is an API resource that is used to apply a set of OS policies to a dynamically targeted group of Compute Engine VM instances. An OS policy is used to define the desired state configuration for a Compute Engine VM instance through a set of configuration resources that provide capabilities such as installing or removing software packages, or executing a script. For more information about the OS policy resource definitions and examples, see [OS policy and OS policy assignment](https://cloud.google.com/compute/docs/os-configuration-management/working-with-os-policies). Structure is [documented below](#nested_orchestrated_resource_os_policy_assignment_v1_payload).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `id`
- Description: (Optional) Optional. ID of the resource to be used while generating set of affected resources. For UPSERT action the value is auto-generated during PolicyOrchestrator creation when not set. When the value is set it should following next restrictions: * Must contain only lowercase letters, numbers, and hyphens. * Must start with a letter. * Must be between 1-63 characters. * Must end with a number or a letter. * Must be unique within the project. For DELETE action, ID must be specified explicitly during PolicyOrchestrator creation. <a name="nested_orchestrated_resource_os_policy_assignment_v1_payload"></a>The `os_policy_assignment_v1_payload` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `uid`
- Description: (Output) Output only. Server generated unique id for the OS policy assignment resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Optional) Resource name. Format: `projects/{project_number}/locations/{location}/osPolicyAssignments/{os_policy_assignment_id}` This field is ignored when you create an OS policy assignment.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) OS policy assignment description. Length of the description is limited to 1024 characters.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `os_policies`
- Description: (Required) Required. List of OS policies to be applied to the VMs. Structure is [documented below](#nested_orchestrated_resource_os_policy_assignment_v1_payload_os_policies).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `revision_id`
- Description: (Output) Output only. The assignment revision ID A new revision is committed whenever a rollout is triggered for a OS policy assignment
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `baseline`
- Description: (Output) Output only. Indicates that this revision has been successfully rolled out in this zone and new VMs will be assigned OS policies from this revision. For a given OS policy assignment, there is only one revision with a value of `true` for this field.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `deleted`
- Description: (Output) Output only. Indicates that this revision deletes the OS policy assignment.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `instance_filter`
- Description: (Required) Filters to select target VMs for an assignment. If more than one filter criteria is specified below, a VM will be selected if and only if it satisfies all of them. Structure is [documented below](#nested_orchestrated_resource_os_policy_assignment_v1_payload_instance_filter).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `rollout`
- Description: (Required) Message to configure the rollout at the zonal level for the OS policy assignment. Structure is [documented below](#nested_orchestrated_resource_os_policy_assignment_v1_payload_rollout).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `revision_create_time`
- Description: (Output) Output only. The timestamp that the revision was created.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `rollout_state`
- Description: (Output) Output only. OS policy assignment rollout state Possible values: ROLLOUT_STATE_UNSPECIFIED IN_PROGRESS CANCELLING CANCELLED SUCCEEDED
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `reconciling`
- Description: (Output) Output only. Indicates that reconciliation is in progress for the revision. This value is `true` when the `rollout_state` is one of: * IN_PROGRESS * CANCELLING <a name="nested_orchestrated_resource_os_policy_assignment_v1_payload_os_policies"></a>The `os_policies` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `mode`
- Description: (Required) Required. Policy mode Possible values: MODE_UNSPECIFIED VALIDATION ENFORCEMENT
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `resource_groups`
- Description: (Required) Required. List of resource groups for the policy. For a particular VM, resource groups are evaluated in the order specified and the first resource group that is applicable is selected and the rest are ignored. If none of the resource groups are applicable for a VM, the VM is considered to be non-compliant w.r.t this policy. This behavior can be toggled by the flag `allow_no_resource_group_match` Structure is [documented below](#nested_orchestrated_resource_os_policy_assignment_v1_payload_os_policies_os_policies_resource_groups).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `allow_no_resource_group_match`
- Description: (Optional) This flag determines the OS policy compliance status when none of the resource groups within the policy are applicable for a VM. Set this value to `true` if the policy needs to be reported as compliant even if the policy has nothing to validate or enforce.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `id`
- Description: (Required) Required. The id of the OS policy with the following restrictions: * Must contain only lowercase letters, numbers, and hyphens. * Must start with a letter. * Must be between 1-63 characters. * Must end with a number or a letter. * Must be unique within the assignment.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) Policy description. Length of the description is limited to 1024 characters. <a name="nested_orchestrated_resource_os_policy_assignment_v1_payload_os_policies_os_policies_resource_groups"></a>The `resource_groups` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `inventory_filters`
- Description: (Optional) List of inventory filters for the resource group. The resources in this resource group are applied to the target VM if it satisfies at least one of the following inventory filters. For example, to apply this resource group to VMs running either `RHEL` or `CentOS` operating systems, specify 2 items for the list with following values: inventory_filters[0].os_short_name='rhel' and inventory_filters[1].os_short_name='centos' If the list is empty, this resource group will be applied to the target VM unconditionally. Structure is [documented below](#nested_orchestrated_resource_os_policy_assignment_v1_payload_os_policies_os_policies_resource_groups_resource_groups_inventory_filters).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `resources`
- Description: (Required) Required. List of resources configured for this resource group. The resources are executed in the exact order specified here. Structure is [documented below](#nested_orchestrated_resource_os_policy_assignment_v1_payload_os_policies_os_policies_resource_groups_resource_groups_resources). <a name="nested_orchestrated_resource_os_policy_assignment_v1_payload_os_policies_os_policies_resource_groups_resource_groups_inventory_filters"></a>The `inventory_filters` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `os_short_name`
- Description: (Required) Required. The OS short name
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `os_version`
- Description: (Optional) The OS version Prefix matches are supported if asterisk(*) is provided as the last character. For example, to match all versions with a major version of `7`, specify the following value for this field `7.*` An empty string matches all OS versions. <a name="nested_orchestrated_resource_os_policy_assignment_v1_payload_os_policies_os_policies_resource_groups_resource_groups_resources"></a>The `resources` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `repository`
- Description: (Optional) A resource that manages a package repository. Structure is [documented below](#nested_orchestrated_resource_os_policy_assignment_v1_payload_os_policies_os_policies_resource_groups_resource_groups_resources_resources_repository).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `exec`
- Description: (Optional) A resource that allows executing scripts on the VM. The `ExecResource` has 2 stages: `validate` and `enforce` and both stages accept a script as an argument to execute. When the `ExecResource` is applied by the agent, it first executes the script in the `validate` stage. The `validate` stage can signal that the `ExecResource` is already in the desired state by returning an exit code of `100`. If the `ExecResource` is not in the desired state, it should return an exit code of `101`. Any other exit code returned by this stage is considered an error. If the `ExecResource` is not in the desired state based on the exit code from the `validate` stage, the agent proceeds to execute the script from the `enforce` stage. If the `ExecResource` is already in the desired state, the `enforce` stage will not be run. Similar to `validate` stage, the `enforce` stage should return an exit code of `100` to indicate that the resource in now in its desired state. Any other exit code is considered an error. NOTE: An exit code of `100` was chosen over `0` (and `101` vs `1`) to have an explicit indicator of `in desired state`, `not in desired state` and errors. Because, for example, Powershell will always return an exit code of `0` unless an `exit` statement is provided in the script. So, for reasons of consistency and being explicit, exit codes `100` and `101` were chosen. Structure is [documented below](#nested_orchestrated_resource_os_policy_assignment_v1_payload_os_policies_os_policies_resource_groups_resource_groups_resources_resources_exec).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `file`
- Description: (Optional) A resource that manages the state of a file. Structure is [documented below](#nested_orchestrated_resource_os_policy_assignment_v1_payload_os_policies_os_policies_resource_groups_resource_groups_resources_resources_file).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `id`
- Description: (Required) Required. The id of the resource with the following restrictions: * Must contain only lowercase letters, numbers, and hyphens. * Must start with a letter. * Must be between 1-63 characters. * Must end with a number or a letter. * Must be unique within the OS policy.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `pkg`
- Description: (Optional) A resource that manages a system package. Structure is [documented below](#nested_orchestrated_resource_os_policy_assignment_v1_payload_os_policies_os_policies_resource_groups_resource_groups_resources_resources_pkg). <a name="nested_orchestrated_resource_os_policy_assignment_v1_payload_os_policies_os_policies_resource_groups_resource_groups_resources_resources_repository"></a>The `repository` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `yum`
- Description: (Optional) Represents a single yum package repository. These are added to a repo file that is managed at `/etc/yum.repos.d/google_osconfig.repo`. Structure is [documented below](#nested_orchestrated_resource_os_policy_assignment_v1_payload_os_policies_os_policies_resource_groups_resource_groups_resources_resources_repository_yum).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `zypper`
- Description: (Optional) Represents a single zypper package repository. These are added to a repo file that is managed at `/etc/zypp/repos.d/google_osconfig.repo`. Structure is [documented below](#nested_orchestrated_resource_os_policy_assignment_v1_payload_os_policies_os_policies_resource_groups_resource_groups_resources_resources_repository_zypper).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `goo`
- Description: (Optional) Represents a Goo package repository. These are added to a repo file that is managed at `C:/ProgramData/GooGet/repos/google_osconfig.repo`. Structure is [documented below](#nested_orchestrated_resource_os_policy_assignment_v1_payload_os_policies_os_policies_resource_groups_resource_groups_resources_resources_repository_goo).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `apt`
- Description: (Optional) Represents a single apt package repository. These will be added to a repo file that will be managed at `/etc/apt/sources.list.d/google_osconfig.list`. Structure is [documented below](#nested_orchestrated_resource_os_policy_assignment_v1_payload_os_policies_os_policies_resource_groups_resource_groups_resources_resources_repository_apt). <a name="nested_orchestrated_resource_os_policy_assignment_v1_payload_os_policies_os_policies_resource_groups_resource_groups_resources_resources_repository_yum"></a>The `yum` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `id`
- Description: (Required) Required. A one word, unique name for this repository. This is  the `repo id` in the yum config file and also the `display_name` if `display_name` is omitted. This id is also used as the unique identifier when checking for resource conflicts.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `display_name`
- Description: (Optional) The display name of the repository.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `base_url`
- Description: (Required) Required. The location of the repository directory.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `gpg_keys`
- Description: (Optional) URIs of GPG keys. <a name="nested_orchestrated_resource_os_policy_assignment_v1_payload_os_policies_os_policies_resource_groups_resource_groups_resources_resources_repository_zypper"></a>The `zypper` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `id`
- Description: (Required) Required. A one word, unique name for this repository. This is the `repo id` in the zypper config file and also the `display_name` if `display_name` is omitted. This id is also used as the unique identifier when checking for GuestPolicy conflicts.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `display_name`
- Description: (Optional) The display name of the repository.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `base_url`
- Description: (Required) Required. The location of the repository directory.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `gpg_keys`
- Description: (Optional) URIs of GPG keys. <a name="nested_orchestrated_resource_os_policy_assignment_v1_payload_os_policies_os_policies_resource_groups_resource_groups_resources_resources_repository_goo"></a>The `goo` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Required) Required. The name of the repository.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `url`
- Description: (Required) Required. The url of the repository. <a name="nested_orchestrated_resource_os_policy_assignment_v1_payload_os_policies_os_policies_resource_groups_resource_groups_resources_resources_repository_apt"></a>The `apt` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `uri`
- Description: (Required) Required. URI for this repository.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `distribution`
- Description: (Required) Required. Distribution of this repository.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `components`
- Description: (Required) Required. List of components for this repository. Must contain at least one item.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `gpg_key`
- Description: (Optional) URI of the key file for this repository. The agent maintains a keyring at `/etc/apt/trusted.gpg.d/osconfig_agent_managed.gpg`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `archive_type`
- Description: (Required) Required. Type of archive files in this repository. Possible values: ARCHIVE_TYPE_UNSPECIFIED DEB DEB_SRC <a name="nested_orchestrated_resource_os_policy_assignment_v1_payload_os_policies_os_policies_resource_groups_resource_groups_resources_resources_exec"></a>The `exec` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enforce`
- Description: (Optional) A file or script to execute. Structure is [documented below](#nested_orchestrated_resource_os_policy_assignment_v1_payload_os_policies_os_policies_resource_groups_resource_groups_resources_resources_exec_enforce).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `validate`
- Description: (Required) A file or script to execute. Structure is [documented below](#nested_orchestrated_resource_os_policy_assignment_v1_payload_os_policies_os_policies_resource_groups_resource_groups_resources_resources_exec_validate). <a name="nested_orchestrated_resource_os_policy_assignment_v1_payload_os_policies_os_policies_resource_groups_resource_groups_resources_resources_exec_enforce"></a>The `enforce` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `script`
- Description: (Optional) An inline script. The size of the script is limited to 32KiB.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `args`
- Description: (Optional) Optional arguments to pass to the source during execution.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `interpreter`
- Description: (Required) Required. The script interpreter to use. Possible values: INTERPRETER_UNSPECIFIED NONE SHELL POWERSHELL
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `output_file_path`
- Description: (Optional) Only recorded for enforce Exec. Path to an output file (that is created by this Exec) whose content will be recorded in OSPolicyResourceCompliance after a successful run. Absence or failure to read this file will result in this ExecResource being non-compliant. Output file size is limited to 500K bytes.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `file`
- Description: (Optional) A remote or local file. Structure is [documented below](#nested_orchestrated_resource_os_policy_assignment_v1_payload_os_policies_os_policies_resource_groups_resource_groups_resources_resources_exec_enforce_file). <a name="nested_orchestrated_resource_os_policy_assignment_v1_payload_os_policies_os_policies_resource_groups_resource_groups_resources_resources_exec_enforce_file"></a>The `file` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `remote`
- Description: (Optional) Specifies a file available via some URI. Structure is [documented below](#nested_orchestrated_resource_os_policy_assignment_v1_payload_os_policies_os_policies_resource_groups_resource_groups_resources_resources_exec_enforce_file_remote).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `gcs`
- Description: (Optional) Specifies a file available as a Cloud Storage Object. Structure is [documented below](#nested_orchestrated_resource_os_policy_assignment_v1_payload_os_policies_os_policies_resource_groups_resource_groups_resources_resources_exec_enforce_file_gcs).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `local_path`
- Description: (Optional) A local path within the VM to use.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `allow_insecure`
- Description: (Optional) Defaults to false. When false, files are subject to validations based on the file type: Remote: A checksum must be specified. Cloud Storage: An object generation number must be specified. <a name="nested_orchestrated_resource_os_policy_assignment_v1_payload_os_policies_os_policies_resource_groups_resource_groups_resources_resources_exec_enforce_file_remote"></a>The `remote` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `uri`
- Description: (Required) Required. URI from which to fetch the object. It should contain both the protocol and path following the format `{protocol}://{location}`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `sha256_checksum`
- Description: (Optional) SHA256 checksum of the remote file. <a name="nested_orchestrated_resource_os_policy_assignment_v1_payload_os_policies_os_policies_resource_groups_resource_groups_resources_resources_exec_enforce_file_gcs"></a>The `gcs` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `bucket`
- Description: (Required) Required. Bucket of the Cloud Storage object.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `object`
- Description: (Required) Required. Name of the Cloud Storage object.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `generation`
- Description: (Optional) Generation number of the Cloud Storage object. <a name="nested_orchestrated_resource_os_policy_assignment_v1_payload_os_policies_os_policies_resource_groups_resource_groups_resources_resources_exec_validate"></a>The `validate` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `file`
- Description: (Optional) A remote or local file. Structure is [documented below](#nested_orchestrated_resource_os_policy_assignment_v1_payload_os_policies_os_policies_resource_groups_resource_groups_resources_resources_exec_validate_file).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `script`
- Description: (Optional) An inline script. The size of the script is limited to 32KiB.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `args`
- Description: (Optional) Optional arguments to pass to the source during execution.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `interpreter`
- Description: (Required) Required. The script interpreter to use. Possible values: INTERPRETER_UNSPECIFIED NONE SHELL POWERSHELL
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `output_file_path`
- Description: (Optional) Only recorded for enforce Exec. Path to an output file (that is created by this Exec) whose content will be recorded in OSPolicyResourceCompliance after a successful run. Absence or failure to read this file will result in this ExecResource being non-compliant. Output file size is limited to 500K bytes. <a name="nested_orchestrated_resource_os_policy_assignment_v1_payload_os_policies_os_policies_resource_groups_resource_groups_resources_resources_exec_validate_file"></a>The `file` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `gcs`
- Description: (Optional) Specifies a file available as a Cloud Storage Object. Structure is [documented below](#nested_orchestrated_resource_os_policy_assignment_v1_payload_os_policies_os_policies_resource_groups_resource_groups_resources_resources_exec_validate_file_gcs).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `local_path`
- Description: (Optional) A local path within the VM to use.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `allow_insecure`
- Description: (Optional) Defaults to false. When false, files are subject to validations based on the file type: Remote: A checksum must be specified. Cloud Storage: An object generation number must be specified.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `remote`
- Description: (Optional) Specifies a file available via some URI. Structure is [documented below](#nested_orchestrated_resource_os_policy_assignment_v1_payload_os_policies_os_policies_resource_groups_resource_groups_resources_resources_exec_validate_file_remote). <a name="nested_orchestrated_resource_os_policy_assignment_v1_payload_os_policies_os_policies_resource_groups_resource_groups_resources_resources_exec_validate_file_gcs"></a>The `gcs` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `bucket`
- Description: (Required) Required. Bucket of the Cloud Storage object.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `object`
- Description: (Required) Required. Name of the Cloud Storage object.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `generation`
- Description: (Optional) Generation number of the Cloud Storage object. <a name="nested_orchestrated_resource_os_policy_assignment_v1_payload_os_policies_os_policies_resource_groups_resource_groups_resources_resources_exec_validate_file_remote"></a>The `remote` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `uri`
- Description: (Required) Required. URI from which to fetch the object. It should contain both the protocol and path following the format `{protocol}://{location}`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `sha256_checksum`
- Description: (Optional) SHA256 checksum of the remote file. <a name="nested_orchestrated_resource_os_policy_assignment_v1_payload_os_policies_os_policies_resource_groups_resource_groups_resources_resources_file"></a>The `file` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `file`
- Description: (Optional) A remote or local file. Structure is [documented below](#nested_orchestrated_resource_os_policy_assignment_v1_payload_os_policies_os_policies_resource_groups_resource_groups_resources_resources_file_file).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `content`
- Description: (Optional) A a file with this content. The size of the content is limited to 32KiB.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `path`
- Description: (Required) Required. The absolute path of the file within the VM.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `state`
- Description: (Required) Required. Desired state of the file. Possible values: DESIRED_STATE_UNSPECIFIED PRESENT ABSENT CONTENTS_MATCH
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `permissions`
- Description: (Optional) Consists of three octal digits which represent, in order, the permissions of the owner, group, and other users for the file (similarly to the numeric mode used in the linux chmod utility). Each digit represents a three bit number with the 4 bit corresponding to the read permissions, the 2 bit corresponds to the write bit, and the one bit corresponds to the execute permission. Default behavior is 755. Below are some examples of permissions and their associated values: read, write, and execute: 7 read and execute: 5 read and write: 6 read only: 4 <a name="nested_orchestrated_resource_os_policy_assignment_v1_payload_os_policies_os_policies_resource_groups_resource_groups_resources_resources_file_file"></a>The `file` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `remote`
- Description: (Optional) Specifies a file available via some URI. Structure is [documented below](#nested_orchestrated_resource_os_policy_assignment_v1_payload_os_policies_os_policies_resource_groups_resource_groups_resources_resources_file_file_remote).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `gcs`
- Description: (Optional) Specifies a file available as a Cloud Storage Object. Structure is [documented below](#nested_orchestrated_resource_os_policy_assignment_v1_payload_os_policies_os_policies_resource_groups_resource_groups_resources_resources_file_file_gcs).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `local_path`
- Description: (Optional) A local path within the VM to use.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `allow_insecure`
- Description: (Optional) Defaults to false. When false, files are subject to validations based on the file type: Remote: A checksum must be specified. Cloud Storage: An object generation number must be specified. <a name="nested_orchestrated_resource_os_policy_assignment_v1_payload_os_policies_os_policies_resource_groups_resource_groups_resources_resources_file_file_remote"></a>The `remote` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `uri`
- Description: (Required) Required. URI from which to fetch the object. It should contain both the protocol and path following the format `{protocol}://{location}`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `sha256_checksum`
- Description: (Optional) SHA256 checksum of the remote file. <a name="nested_orchestrated_resource_os_policy_assignment_v1_payload_os_policies_os_policies_resource_groups_resource_groups_resources_resources_file_file_gcs"></a>The `gcs` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `object`
- Description: (Required) Required. Name of the Cloud Storage object.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `generation`
- Description: (Optional) Generation number of the Cloud Storage object.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `bucket`
- Description: (Required) Required. Bucket of the Cloud Storage object. <a name="nested_orchestrated_resource_os_policy_assignment_v1_payload_os_policies_os_policies_resource_groups_resource_groups_resources_resources_pkg"></a>The `pkg` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `msi`
- Description: (Optional) An MSI package. MSI packages only support INSTALLED state. Structure is [documented below](#nested_orchestrated_resource_os_policy_assignment_v1_payload_os_policies_os_policies_resource_groups_resource_groups_resources_resources_pkg_msi).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `desired_state`
- Description: (Required) Required. The desired state the agent should maintain for this package. Possible values: DESIRED_STATE_UNSPECIFIED INSTALLED REMOVED
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `apt`
- Description: (Optional) A package managed by APT. - install: `apt-get update && apt-get -y install [name]` - remove: `apt-get -y remove [name]` Structure is [documented below](#nested_orchestrated_resource_os_policy_assignment_v1_payload_os_policies_os_policies_resource_groups_resource_groups_resources_resources_pkg_apt).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `deb`
- Description: (Optional) A deb package file. dpkg packages only support INSTALLED state. Structure is [documented below](#nested_orchestrated_resource_os_policy_assignment_v1_payload_os_policies_os_policies_resource_groups_resource_groups_resources_resources_pkg_deb).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `yum`
- Description: (Optional) A package managed by YUM. - install: `yum -y install package` - remove: `yum -y remove package` Structure is [documented below](#nested_orchestrated_resource_os_policy_assignment_v1_payload_os_policies_os_policies_resource_groups_resource_groups_resources_resources_pkg_yum).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `zypper`
- Description: (Optional) A package managed by Zypper. - install: `zypper -y install package` - remove: `zypper -y rm package` Structure is [documented below](#nested_orchestrated_resource_os_policy_assignment_v1_payload_os_policies_os_policies_resource_groups_resource_groups_resources_resources_pkg_zypper).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `rpm`
- Description: (Optional) An RPM package file. RPM packages only support INSTALLED state. Structure is [documented below](#nested_orchestrated_resource_os_policy_assignment_v1_payload_os_policies_os_policies_resource_groups_resource_groups_resources_resources_pkg_rpm).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `googet`
- Description: (Optional) A package managed by GooGet. - install: `googet -noconfirm install package` - remove: `googet -noconfirm remove package` Structure is [documented below](#nested_orchestrated_resource_os_policy_assignment_v1_payload_os_policies_os_policies_resource_groups_resource_groups_resources_resources_pkg_googet). <a name="nested_orchestrated_resource_os_policy_assignment_v1_payload_os_policies_os_policies_resource_groups_resource_groups_resources_resources_pkg_msi"></a>The `msi` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `source`
- Description: (Required) A remote or local file. Structure is [documented below](#nested_orchestrated_resource_os_policy_assignment_v1_payload_os_policies_os_policies_resource_groups_resource_groups_resources_resources_pkg_msi_source).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `properties`
- Description: (Optional) Additional properties to use during installation. This should be in the format of Property=Setting. Appended to the defaults of `ACTION=INSTALL REBOOT=ReallySuppress`. <a name="nested_orchestrated_resource_os_policy_assignment_v1_payload_os_policies_os_policies_resource_groups_resource_groups_resources_resources_pkg_msi_source"></a>The `source` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `gcs`
- Description: (Optional) Specifies a file available as a Cloud Storage Object. Structure is [documented below](#nested_orchestrated_resource_os_policy_assignment_v1_payload_os_policies_os_policies_resource_groups_resource_groups_resources_resources_pkg_msi_source_gcs).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `local_path`
- Description: (Optional) A local path within the VM to use.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `allow_insecure`
- Description: (Optional) Defaults to false. When false, files are subject to validations based on the file type: Remote: A checksum must be specified. Cloud Storage: An object generation number must be specified.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `remote`
- Description: (Optional) Specifies a file available via some URI. Structure is [documented below](#nested_orchestrated_resource_os_policy_assignment_v1_payload_os_policies_os_policies_resource_groups_resource_groups_resources_resources_pkg_msi_source_remote). <a name="nested_orchestrated_resource_os_policy_assignment_v1_payload_os_policies_os_policies_resource_groups_resource_groups_resources_resources_pkg_msi_source_gcs"></a>The `gcs` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `generation`
- Description: (Optional) Generation number of the Cloud Storage object.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `bucket`
- Description: (Required) Required. Bucket of the Cloud Storage object.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `object`
- Description: (Required) Required. Name of the Cloud Storage object. <a name="nested_orchestrated_resource_os_policy_assignment_v1_payload_os_policies_os_policies_resource_groups_resource_groups_resources_resources_pkg_msi_source_remote"></a>The `remote` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `uri`
- Description: (Required) Required. URI from which to fetch the object. It should contain both the protocol and path following the format `{protocol}://{location}`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `sha256_checksum`
- Description: (Optional) SHA256 checksum of the remote file. <a name="nested_orchestrated_resource_os_policy_assignment_v1_payload_os_policies_os_policies_resource_groups_resource_groups_resources_resources_pkg_apt"></a>The `apt` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Required) Required. Package name. <a name="nested_orchestrated_resource_os_policy_assignment_v1_payload_os_policies_os_policies_resource_groups_resource_groups_resources_resources_pkg_deb"></a>The `deb` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `source`
- Description: (Required) A remote or local file. Structure is [documented below](#nested_orchestrated_resource_os_policy_assignment_v1_payload_os_policies_os_policies_resource_groups_resource_groups_resources_resources_pkg_deb_source).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `pull_deps`
- Description: (Optional) Whether dependencies should also be installed. - install when false: `dpkg -i package` - install when true: `apt-get update && apt-get -y install package.deb` <a name="nested_orchestrated_resource_os_policy_assignment_v1_payload_os_policies_os_policies_resource_groups_resource_groups_resources_resources_pkg_deb_source"></a>The `source` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `remote`
- Description: (Optional) Specifies a file available via some URI. Structure is [documented below](#nested_orchestrated_resource_os_policy_assignment_v1_payload_os_policies_os_policies_resource_groups_resource_groups_resources_resources_pkg_deb_source_remote).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `gcs`
- Description: (Optional) Specifies a file available as a Cloud Storage Object. Structure is [documented below](#nested_orchestrated_resource_os_policy_assignment_v1_payload_os_policies_os_policies_resource_groups_resource_groups_resources_resources_pkg_deb_source_gcs).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `local_path`
- Description: (Optional) A local path within the VM to use.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `allow_insecure`
- Description: (Optional) Defaults to false. When false, files are subject to validations based on the file type: Remote: A checksum must be specified. Cloud Storage: An object generation number must be specified. <a name="nested_orchestrated_resource_os_policy_assignment_v1_payload_os_policies_os_policies_resource_groups_resource_groups_resources_resources_pkg_deb_source_remote"></a>The `remote` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `uri`
- Description: (Required) Required. URI from which to fetch the object. It should contain both the protocol and path following the format `{protocol}://{location}`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `sha256_checksum`
- Description: (Optional) SHA256 checksum of the remote file. <a name="nested_orchestrated_resource_os_policy_assignment_v1_payload_os_policies_os_policies_resource_groups_resource_groups_resources_resources_pkg_deb_source_gcs"></a>The `gcs` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `bucket`
- Description: (Required) Required. Bucket of the Cloud Storage object.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `object`
- Description: (Required) Required. Name of the Cloud Storage object.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `generation`
- Description: (Optional) Generation number of the Cloud Storage object. <a name="nested_orchestrated_resource_os_policy_assignment_v1_payload_os_policies_os_policies_resource_groups_resource_groups_resources_resources_pkg_yum"></a>The `yum` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Required) Required. Package name. <a name="nested_orchestrated_resource_os_policy_assignment_v1_payload_os_policies_os_policies_resource_groups_resource_groups_resources_resources_pkg_zypper"></a>The `zypper` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Required) Required. Package name. <a name="nested_orchestrated_resource_os_policy_assignment_v1_payload_os_policies_os_policies_resource_groups_resource_groups_resources_resources_pkg_rpm"></a>The `rpm` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `source`
- Description: (Required) A remote or local file. Structure is [documented below](#nested_orchestrated_resource_os_policy_assignment_v1_payload_os_policies_os_policies_resource_groups_resource_groups_resources_resources_pkg_rpm_source).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `pull_deps`
- Description: (Optional) Whether dependencies should also be installed. - install when false: `rpm --upgrade --replacepkgs package.rpm` - install when true: `yum -y install package.rpm` or `zypper -y install package.rpm` <a name="nested_orchestrated_resource_os_policy_assignment_v1_payload_os_policies_os_policies_resource_groups_resource_groups_resources_resources_pkg_rpm_source"></a>The `source` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `remote`
- Description: (Optional) Specifies a file available via some URI. Structure is [documented below](#nested_orchestrated_resource_os_policy_assignment_v1_payload_os_policies_os_policies_resource_groups_resource_groups_resources_resources_pkg_rpm_source_remote).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `gcs`
- Description: (Optional) Specifies a file available as a Cloud Storage Object. Structure is [documented below](#nested_orchestrated_resource_os_policy_assignment_v1_payload_os_policies_os_policies_resource_groups_resource_groups_resources_resources_pkg_rpm_source_gcs).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `local_path`
- Description: (Optional) A local path within the VM to use.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `allow_insecure`
- Description: (Optional) Defaults to false. When false, files are subject to validations based on the file type: Remote: A checksum must be specified. Cloud Storage: An object generation number must be specified. <a name="nested_orchestrated_resource_os_policy_assignment_v1_payload_os_policies_os_policies_resource_groups_resource_groups_resources_resources_pkg_rpm_source_remote"></a>The `remote` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `uri`
- Description: (Required) Required. URI from which to fetch the object. It should contain both the protocol and path following the format `{protocol}://{location}`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `sha256_checksum`
- Description: (Optional) SHA256 checksum of the remote file. <a name="nested_orchestrated_resource_os_policy_assignment_v1_payload_os_policies_os_policies_resource_groups_resource_groups_resources_resources_pkg_rpm_source_gcs"></a>The `gcs` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `generation`
- Description: (Optional) Generation number of the Cloud Storage object.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `bucket`
- Description: (Required) Required. Bucket of the Cloud Storage object.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `object`
- Description: (Required) Required. Name of the Cloud Storage object. <a name="nested_orchestrated_resource_os_policy_assignment_v1_payload_os_policies_os_policies_resource_groups_resource_groups_resources_resources_pkg_googet"></a>The `googet` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Required) Required. Package name. <a name="nested_orchestrated_resource_os_policy_assignment_v1_payload_instance_filter"></a>The `instance_filter` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `inclusion_labels`
- Description: (Optional) List of label sets used for VM inclusion. If the list has more than one `LabelSet`, the VM is included if any of the label sets are applicable for the VM. Structure is [documented below](#nested_orchestrated_resource_os_policy_assignment_v1_payload_instance_filter_inclusion_labels).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `exclusion_labels`
- Description: (Optional) List of label sets used for VM exclusion. If the list has more than one label set, the VM is excluded if any of the label sets are applicable for the VM. Structure is [documented below](#nested_orchestrated_resource_os_policy_assignment_v1_payload_instance_filter_exclusion_labels).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `inventories`
- Description: (Optional) List of inventories to select VMs. A VM is selected if its inventory data matches at least one of the following inventories. Structure is [documented below](#nested_orchestrated_resource_os_policy_assignment_v1_payload_instance_filter_inventories).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `all`
- Description: (Optional) Target all VMs in the project. If true, no other criteria is permitted. <a name="nested_orchestrated_resource_os_policy_assignment_v1_payload_instance_filter_inclusion_labels"></a>The `inclusion_labels` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) Labels are identified by key/value pairs in this map. A VM should contain all the key/value pairs specified in this map to be selected. <a name="nested_orchestrated_resource_os_policy_assignment_v1_payload_instance_filter_exclusion_labels"></a>The `exclusion_labels` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) Labels are identified by key/value pairs in this map. A VM should contain all the key/value pairs specified in this map to be selected. <a name="nested_orchestrated_resource_os_policy_assignment_v1_payload_instance_filter_inventories"></a>The `inventories` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `os_short_name`
- Description: (Required) Required. The OS short name
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `os_version`
- Description: (Optional) The OS version Prefix matches are supported if asterisk(*) is provided as the last character. For example, to match all versions with a major version of `7`, specify the following value for this field `7.*` An empty string matches all OS versions. <a name="nested_orchestrated_resource_os_policy_assignment_v1_payload_rollout"></a>The `rollout` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `disruption_budget`
- Description: (Required) Message encapsulating a value that can be either absolute ("fixed") or relative ("percent") to a value. Structure is [documented below](#nested_orchestrated_resource_os_policy_assignment_v1_payload_rollout_disruption_budget).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `min_wait_duration`
- Description: (Required) Required. This determines the minimum duration of time to wait after the configuration changes are applied through the current rollout. A VM continues to count towards the `disruption_budget` at least until this duration of time has passed after configuration changes are applied. <a name="nested_orchestrated_resource_os_policy_assignment_v1_payload_rollout_disruption_budget"></a>The `disruption_budget` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `fixed`
- Description: (Optional) Specifies a fixed value.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `percent`
- Description: (Optional) Specifies the relative value defined as a percentage, which will be multiplied by a reference value. <a name="nested_orchestration_scope"></a>The `orchestration_scope` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `selectors`
- Description: (Optional) Optional. Selectors of the orchestration scope. There is a logical AND between each selector defined. When there is no explicit `ResourceHierarchySelector` selector specified, the scope is by default bounded to the parent of the policy orchestrator resource. Structure is [documented below](#nested_orchestration_scope_selectors). <a name="nested_orchestration_scope_selectors"></a>The `selectors` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `resource_hierarchy_selector`
- Description: (Optional) Selector containing Cloud Resource Manager resource hierarchy nodes. Structure is [documented below](#nested_orchestration_scope_selectors_selectors_resource_hierarchy_selector).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location_selector`
- Description: (Optional) Selector containing locations in scope. Structure is [documented below](#nested_orchestration_scope_selectors_selectors_location_selector). <a name="nested_orchestration_scope_selectors_selectors_resource_hierarchy_selector"></a>The `resource_hierarchy_selector` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `included_projects`
- Description: (Optional) Optional. Names of the projects in scope. Format: `projects/{project_number}`
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `included_folders`
- Description: (Optional) Optional. Names of the folders in scope. Format: `folders/{folder_id}` <a name="nested_orchestration_scope_selectors_selectors_location_selector"></a>The `location_selector` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `included_locations`
- Description: (Optional) Optional. Names of the locations in scope. Format: `us-central1-a`
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
