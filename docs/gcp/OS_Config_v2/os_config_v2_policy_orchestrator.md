## 🛡️ Policy Deployment Engine: `os_config_v2_policy_orchestrator`

This section provides a concise policy evaluation for the `os_config_v2_policy_orchestrator` resource in GCP.

Reference: [Terraform Registry – os_config_v2_policy_orchestrator](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/os_config_v2_policy_orchestrator)

---

## Argument Reference
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `action` | Required. Action to be done by the orchestrator in `projects/{project_id}/zones/{zone_id}` locations defined by the `orchestration_scope`. Allowed values: - `UPSERT` - Orchestrator will create or update target resources. - `DELETE` - Orchestrator will delete target resources, if they exist | true | true | Users cannot perform high-impact operations without escalated approval | ['UPSERT'] | ['DELETE'] |
| `orchestrated_resource` | Represents a resource that is being orchestrated by the policy orchestrator. Structure is [documented below](#nested_orchestrated_resource). | true | true | Establishes the top-level security perimeter for all managed resources | None | None |
| `policy_orchestrator_id` | Required. The logical identifier of the policy orchestrator, with the following restrictions: * Must contain only lowercase letters, numbers, and hyphens. * Must start with a letter. * Must be between 1-63 characters. * Must end with a number or a letter. * Must be unique within the parent. | true | false | None | None | None |
| `description` | Optional. Freeform text describing the purpose of the resource. | false | false | None | None | None |
| `state` | Optional. State of the orchestrator. Can be updated to change orchestrator behaviour. Allowed values: - `ACTIVE` - orchestrator is actively looking for actions to be taken. - `STOPPED` - orchestrator won't make any changes. Note: There might be more states added in the future. We use string here instead of an enum, to avoid the need of propagating new states to all the client code. | false | true | Prevents unauthorized changes to orchestrator state that could lead to security lapses | ['STOPPED'] | ['ACTIVE'] |
| `orchestration_scope` | Defines a set of selectors which drive which resources are in scope of policy orchestration. Structure is [documented below](#nested_orchestration_scope). | false | true | Establishes the comprehensive security perimeter for all orchestration activities. | None | None |
| `labels` | Optional. Labels as key value pairs **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | true | Enables precise application of security policies based on resource labels rather than broad, potentially insecure targeting. | None | None |
| `project` | If it is not provided, the provider project is used. | false | false | None | None | None |
| `os_policy_assignment_v1_payload` |  | false | false | None | None | None |
| `os_policies` |  | false | false | None | None | None |
| `resource_groups` |  | false | false | None | None | None |
| `inventory_filters` |  | false | false | None | None | None |
| `resources` |  | false | false | None | None | None |
| `repository` |  | false | false | None | None | None |
| `yum` |  | false | false | None | None | None |
| `zypper` |  | false | false | None | None | None |
| `goo` |  | false | false | None | None | None |
| `apt` |  | false | false | None | None | None |
| `exec` |  | false | false | None | None | None |
| `enforce` |  | false | false | None | None | None |
| `file` |  | false | false | None | None | None |
| `remote` |  | false | false | None | None | None |
| `gcs` |  | false | false | None | None | None |
| `validate` |  | false | false | None | None | None |
| `pkg` |  | false | false | None | None | None |
| `msi` |  | false | false | None | None | None |
| `source` |  | false | false | None | None | None |
| `deb` |  | false | false | None | None | None |
| `rpm` |  | false | false | None | None | None |
| `googet` |  | false | false | None | None | None |
| `instance_filter` |  | false | false | None | None | None |
| `inclusion_labels` |  | false | false | None | None | None |
| `exclusion_labels` |  | false | false | None | None | None |
| `inventories` |  | false | false | None | None | None |
| `rollout` |  | false | false | None | None | None |
| `disruption_budget` |  | false | false | None | None | None |
| `selectors` |  | false | false | None | None | None |
| `resource_hierarchy_selector` |  | false | false | None | None | None |
| `location_selector` |  | false | false | None | None | None |

### orchestrated_resource Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `os_policy_assignment_v1_payload` | OS policy assignment is an API resource that is used to apply a set of OS policies to a dynamically targeted group of Compute Engine VM instances. An OS policy is used to define the desired state configuration for a Compute Engine VM instance through a set of configuration resources that provide capabilities such as installing or removing software packages, or executing a script. For more information about the OS policy resource definitions and examples, see [OS policy and OS policy assignment](https://cloud.google.com/compute/docs/os-configuration-management/working-with-os-policies). Structure is [documented below](#nested_orchestrated_resource_os_policy_assignment_v1_payload). | false | true | Maintains security policy structure and prevents malformed configurations | None | None |
| `id` | Optional. ID of the resource to be used while generating set of affected resources. For UPSERT action the value is auto-generated during PolicyOrchestrator creation when not set. When the value is set it should following next restrictions: * Must contain only lowercase letters, numbers, and hyphens. * Must start with a letter. * Must be between 1-63 characters. * Must end with a number or a letter. * Must be unique within the project. For DELETE action, ID must be specified explicitly during PolicyOrchestrator creation. | false | false | None | None | None |

### orchestration_scope Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `selectors` | Optional. Selectors of the orchestration scope. There is a logical AND between each selector defined. When there is no explicit `ResourceHierarchySelector` selector specified, the scope is by default bounded to the parent of the policy orchestrator resource. Structure is [documented below](#nested_orchestration_scope_selectors). | false | true | Provides security controls for determining which resources meet selection criteria. | None | None |

### labels Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `environment` | Optional. The environment label is a key that can be used to distinguish between different deployment environments such as 'development', 'staging', and 'production'. | false | true | Facilitates environment-specific security policies, ensuring that production environments have stricter controls compared to development or staging. | ['test'] | ['dev', 'prod'] |

### os_policy_assignment_v1_payload Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `uid` | (Output) Output only. Server generated unique id for the OS policy assignment resource. | false | false | None | None | None |
| `name` | Resource name. Format: `projects/{project_number}/locations/{location}/osPolicyAssignments/{os_policy_assignment_id}` This field is ignored when you create an OS policy assignment. | false | false | None | None | None |
| `description` | OS policy assignment description. Length of the description is limited to 1024 characters. | false | false | None | None | None |
| `os_policies` | Required. List of OS policies to be applied to the VMs. Structure is [documented below](#nested_orchestrated_resource_os_policy_assignment_v1_payload_os_policies). | true | true | Applies security configurations at the OS layer | None | None |
| `revision_id` | (Output) Output only. The assignment revision ID A new revision is committed whenever a rollout is triggered for a OS policy assignment | false | false | None | None | None |
| `baseline` | (Output) Output only. Indicates that this revision has been successfully rolled out in this zone and new VMs will be assigned OS policies from this revision. For a given OS policy assignment, there is only one revision with a value of `true` for this field. | false | false | None | None | None |
| `deleted` | (Output) Output only. Indicates that this revision deletes the OS policy assignment. | false | false | None | None | None |
| `instance_filter` | Filters to select target VMs for an assignment. If more than one filter criteria is specified below, a VM will be selected if and only if it satisfies all of them. Structure is [documented below](#nested_orchestrated_resource_os_policy_assignment_v1_payload_instance_filter). | true | true | Enables security policies to target specific instance characteristics | None | None |
| `rollout` | Message to configure the rollout at the zonal level for the OS policy assignment. Structure is [documented below](#nested_orchestrated_resource_os_policy_assignment_v1_payload_rollout). | true | false | None | None | None |
| `revision_create_time` | (Output) Output only. The timestamp that the revision was created. | false | false | None | None | None |
| `rollout_state` | (Output) Output only. OS policy assignment rollout state Possible values: ROLLOUT_STATE_UNSPECIFIED IN_PROGRESS CANCELLING CANCELLED SUCCEEDED | false | false | None | None | None |
| `reconciling` | (Output) Output only. Indicates that reconciliation is in progress for the revision. This value is `true` when the `rollout_state` is one of: * IN_PROGRESS * CANCELLING | false | false | None | None | None |

### os_policies Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `mode` | Required. Policy mode Possible values: MODE_UNSPECIFIED VALIDATION ENFORCEMENT | true | true | Ensures conscious decision-making about policy impact levels | ['VALIDATION', 'ENFORCEMENT'] | ['MODE_UNSPECIFIED'] |
| `resource_groups` | Required. List of resource groups for the policy. For a particular VM, resource groups are evaluated in the order specified and the first resource group that is applicable is selected and the rest are ignored. If none of the resource groups are applicable for a VM, the VM is considered to be non-compliant w.r.t this policy. This behavior can be toggled by the flag `allow_no_resource_group_match` Structure is [documented below](#nested_orchestrated_resource_os_policy_assignment_v1_payload_os_policies_os_policies_resource_groups). | true | true | Applies security controls to multiple related resources simultaneously | None | None |
| `allow_no_resource_group_match` | This flag determines the OS policy compliance status when none of the resource groups within the policy are applicable for a VM. Set this value to `true` if the policy needs to be reported as compliant even if the policy has nothing to validate or enforce. | false | false | None | None | None |
| `id` | Required. The id of the OS policy with the following restrictions: * Must contain only lowercase letters, numbers, and hyphens. * Must start with a letter. * Must be between 1-63 characters. * Must end with a number or a letter. * Must be unique within the assignment. | true | false | None | None | None |
| `description` | Policy description. Length of the description is limited to 1024 characters. | false | false | None | None | None |

### resource_groups Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `inventory_filters` | List of inventory filters for the resource group. The resources in this resource group are applied to the target VM if it satisfies at least one of the following inventory filters. For example, to apply this resource group to VMs running either `RHEL` or `CentOS` operating systems, specify 2 items for the list with following values: inventory_filters[0].os_short_name='rhel' and inventory_filters[1].os_short_name='centos' If the list is empty, this resource group will be applied to the target VM unconditionally. Structure is [documented below](#nested_orchestrated_resource_os_policy_assignment_v1_payload_os_policies_os_policies_resource_groups_resource_groups_inventory_filters). | false | false | None | None | None |
| `resources` | Required. List of resources configured for this resource group. The resources are executed in the exact order specified here. Structure is [documented below](#nested_orchestrated_resource_os_policy_assignment_v1_payload_os_policies_os_policies_resource_groups_resource_groups_resources). | true | true | Enables fine-grained security controls at the resource level | None | None |

### inventory_filters Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `os_short_name` | Required. The OS short name | true | false | None | None | None |
| `os_version` | The OS version Prefix matches are supported if asterisk(*) is provided as the last character. For example, to match all versions with a major version of `7`, specify the following value for this field `7.*` An empty string matches all OS versions. | false | false | None | None | None |

### resources Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `repository` | A resource that manages a package repository. Structure is [documented below](#nested_orchestrated_resource_os_policy_assignment_v1_payload_os_policies_os_policies_resource_groups_resource_groups_resources_resources_repository). | false | true | Maintains security through controlled software distribution channels | None | None |
| `exec` | A resource that allows executing scripts on the VM. The `ExecResource` has 2 stages: `validate` and `enforce` and both stages accept a script as an argument to execute. When the `ExecResource` is applied by the agent, it first executes the script in the `validate` stage. The `validate` stage can signal that the `ExecResource` is already in the desired state by returning an exit code of `100`. If the `ExecResource` is not in the desired state, it should return an exit code of `101`. Any other exit code returned by this stage is considered an error. If the `ExecResource` is not in the desired state based on the exit code from the `validate` stage, the agent proceeds to execute the script from the `enforce` stage. If the `ExecResource` is already in the desired state, the `enforce` stage will not be run. Similar to `validate` stage, the `enforce` stage should return an exit code of `100` to indicate that the resource in now in its desired state. Any other exit code is considered an error. NOTE: An exit code of `100` was chosen over `0` (and `101` vs `1`) to have an explicit indicator of `in desired state`, `not in desired state` and errors. Because, for example, Powershell will always return an exit code of `0` unless an `exit` statement is provided in the script. So, for reasons of consistency and being explicit, exit codes `100` and `101` were chosen. Structure is [documented below](#nested_orchestrated_resource_os_policy_assignment_v1_payload_os_policies_os_policies_resource_groups_resource_groups_resources_resources_exec). | false | false | None | None | None |
| `file` | A resource that manages the state of a file. Structure is [documented below](#nested_orchestrated_resource_os_policy_assignment_v1_payload_os_policies_os_policies_resource_groups_resource_groups_resources_resources_file). | false | false | None | None | None |
| `id` | Required. The id of the resource with the following restrictions: * Must contain only lowercase letters, numbers, and hyphens. * Must start with a letter. * Must be between 1-63 characters. * Must end with a number or a letter. * Must be unique within the OS policy. | true | false | None | None | None |
| `pkg` | A resource that manages a system package. Structure is [documented below](#nested_orchestrated_resource_os_policy_assignment_v1_payload_os_policies_os_policies_resource_groups_resource_groups_resources_resources_pkg). | false | false | None | None | None |

### repository Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `yum` | Represents a single yum package repository. These are added to a repo file that is managed at `/etc/yum.repos.d/google_osconfig.repo`. Structure is [documented below](#nested_orchestrated_resource_os_policy_assignment_v1_payload_os_policies_os_policies_resource_groups_resource_groups_resources_resources_repository_yum). | false | false | None | None | None |
| `zypper` | Represents a single zypper package repository. These are added to a repo file that is managed at `/etc/zypp/repos.d/google_osconfig.repo`. Structure is [documented below](#nested_orchestrated_resource_os_policy_assignment_v1_payload_os_policies_os_policies_resource_groups_resource_groups_resources_resources_repository_zypper). | false | false | None | None | None |
| `goo` | Represents a Goo package repository. These are added to a repo file that is managed at `C:/ProgramData/GooGet/repos/google_osconfig.repo`. Structure is [documented below](#nested_orchestrated_resource_os_policy_assignment_v1_payload_os_policies_os_policies_resource_groups_resource_groups_resources_resources_repository_goo). | false | false | None | None | None |
| `apt` | Represents a single apt package repository. These will be added to a repo file that will be managed at `/etc/apt/sources.list.d/google_osconfig.list`. Structure is [documented below](#nested_orchestrated_resource_os_policy_assignment_v1_payload_os_policies_os_policies_resource_groups_resource_groups_resources_resources_repository_apt). | false | true | Enforces consistent package management across Debian systems. | None | None |

### yum Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `id` | Required. A one word, unique name for this repository. This is  the `repo id` in the yum config file and also the `display_name` if `display_name` is omitted. This id is also used as the unique identifier when checking for resource conflicts. | true | false | None | None | None |
| `display_name` | The display name of the repository. | false | false | None | None | None |
| `base_url` | Required. The location of the repository directory. | true | false | None | None | None |
| `gpg_keys` | URIs of GPG keys. | false | false | None | None | None |
| `name` | Required. Package name. | true | false | None | None | None |

### zypper Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `id` | Required. A one word, unique name for this repository. This is the `repo id` in the zypper config file and also the `display_name` if `display_name` is omitted. This id is also used as the unique identifier when checking for GuestPolicy conflicts. | true | false | None | None | None |
| `display_name` | The display name of the repository. | false | false | None | None | None |
| `base_url` | Required. The location of the repository directory. | true | false | None | None | None |
| `gpg_keys` | URIs of GPG keys. | false | false | None | None | None |
| `name` | Required. Package name. | true | false | None | None | None |

### goo Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `name` | Required. The name of the repository. | true | false | None | None | None |
| `url` | Required. The url of the repository. | true | false | None | None | None |

### apt Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `uri` | Required. URI for this repository. | true | false | None | None | None |
| `distribution` | Required. Distribution of this repository. | true | false | None | None | None |
| `components` | Required. List of components for this repository. Must contain at least one item. | true | false | None | None | None |
| `gpg_key` | URI of the key file for this repository. The agent maintains a keyring at `/etc/apt/trusted.gpg.d/osconfig_agent_managed.gpg`. | false | false | None | None | None |
| `archive_type` | Required. Type of archive files in this repository. Possible values: ARCHIVE_TYPE_UNSPECIFIED DEB DEB_SRC | true | true | Controls which archive types are permitted for installations. | ['DEB', 'DEB_SRC'] | ['ARCHIVE_TYPE_UNSPECIFIED'] |
| `name` | Required. Package name. | true | false | None | None | None |

### exec Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `enforce` | A file or script to execute. Structure is [documented below](#nested_orchestrated_resource_os_policy_assignment_v1_payload_os_policies_os_policies_resource_groups_resource_groups_resources_resources_exec_enforce). | false | false | None | None | None |
| `validate` | A file or script to execute. Structure is [documented below](#nested_orchestrated_resource_os_policy_assignment_v1_payload_os_policies_os_policies_resource_groups_resource_groups_resources_resources_exec_validate). | true | false | None | None | None |

### enforce Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `script` | An inline script. The size of the script is limited to 32KiB. | false | false | None | None | None |
| `args` | Optional arguments to pass to the source during execution. | false | false | None | None | None |
| `interpreter` | Required. The script interpreter to use. Possible values: INTERPRETER_UNSPECIFIED NONE SHELL POWERSHELL | true | false | None | None | None |
| `output_file_path` | Only recorded for enforce Exec. Path to an output file (that is created by this Exec) whose content will be recorded in OSPolicyResourceCompliance after a successful run. Absence or failure to read this file will result in this ExecResource being non-compliant. Output file size is limited to 500K bytes. | false | false | None | None | None |
| `file` | A remote or local file. Structure is [documented below](#nested_orchestrated_resource_os_policy_assignment_v1_payload_os_policies_os_policies_resource_groups_resource_groups_resources_resources_exec_enforce_file). | false | false | None | None | None |

### file Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `remote` | Specifies a file available via some URI. Structure is [documented below](#nested_orchestrated_resource_os_policy_assignment_v1_payload_os_policies_os_policies_resource_groups_resource_groups_resources_resources_file_file_remote). | false | false | None | None | None |
| `gcs` | Specifies a file available as a Cloud Storage Object. Structure is [documented below](#nested_orchestrated_resource_os_policy_assignment_v1_payload_os_policies_os_policies_resource_groups_resource_groups_resources_resources_file_file_gcs). | false | false | None | None | None |
| `local_path` | A local path within the VM to use. | false | false | None | None | None |
| `allow_insecure` | Defaults to false. When false, files are subject to validations based on the file type: Remote: A checksum must be specified. Cloud Storage: An object generation number must be specified. | false | false | None | None | None |
| `file` | A remote or local file. Structure is [documented below](#nested_orchestrated_resource_os_policy_assignment_v1_payload_os_policies_os_policies_resource_groups_resource_groups_resources_resources_file_file). | false | false | None | None | None |
| `content` | A a file with this content. The size of the content is limited to 32KiB. | false | false | None | None | None |
| `path` | Required. The absolute path of the file within the VM. | true | false | None | None | None |
| `state` | Required. Desired state of the file. Possible values: DESIRED_STATE_UNSPECIFIED PRESENT ABSENT CONTENTS_MATCH | true | false | None | None | None |
| `permissions` | Consists of three octal digits which represent, in order, the permissions of the owner, group, and other users for the file (similarly to the numeric mode used in the linux chmod utility). Each digit represents a three bit number with the 4 bit corresponding to the read permissions, the 2 bit corresponds to the write bit, and the one bit corresponds to the execute permission. Default behavior is 755. Below are some examples of permissions and their associated values: read, write, and execute: 7 read and execute: 5 read and write: 6 read only: 4 | false | false | None | None | None |

### remote Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `uri` | Required. URI from which to fetch the object. It should contain both the protocol and path following the format `{protocol}://{location}`. | true | false | None | None | None |
| `sha256_checksum` | SHA256 checksum of the remote file. | false | false | None | None | None |

### gcs Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `bucket` | Required. Bucket of the Cloud Storage object. | true | false | None | None | None |
| `object` | Required. Name of the Cloud Storage object. | true | false | None | None | None |
| `generation` | Generation number of the Cloud Storage object. | false | false | None | None | None |

### validate Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `file` | A remote or local file. Structure is [documented below](#nested_orchestrated_resource_os_policy_assignment_v1_payload_os_policies_os_policies_resource_groups_resource_groups_resources_resources_exec_validate_file). | false | false | None | None | None |
| `script` | An inline script. The size of the script is limited to 32KiB. | false | false | None | None | None |
| `args` | Optional arguments to pass to the source during execution. | false | false | None | None | None |
| `interpreter` | Required. The script interpreter to use. Possible values: INTERPRETER_UNSPECIFIED NONE SHELL POWERSHELL | true | false | None | None | None |
| `output_file_path` | Only recorded for enforce Exec. Path to an output file (that is created by this Exec) whose content will be recorded in OSPolicyResourceCompliance after a successful run. Absence or failure to read this file will result in this ExecResource being non-compliant. Output file size is limited to 500K bytes. | false | false | None | None | None |

### pkg Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `msi` | An MSI package. MSI packages only support INSTALLED state. Structure is [documented below](#nested_orchestrated_resource_os_policy_assignment_v1_payload_os_policies_os_policies_resource_groups_resource_groups_resources_resources_pkg_msi). | false | false | None | None | None |
| `desired_state` | Required. The desired state the agent should maintain for this package. Possible values: DESIRED_STATE_UNSPECIFIED INSTALLED REMOVED | true | false | None | None | None |
| `apt` | A package managed by APT. - install: `apt-get update && apt-get -y install [name]` - remove: `apt-get -y remove [name]` Structure is [documented below](#nested_orchestrated_resource_os_policy_assignment_v1_payload_os_policies_os_policies_resource_groups_resource_groups_resources_resources_pkg_apt). | false | false | None | None | None |
| `deb` | A deb package file. dpkg packages only support INSTALLED state. Structure is [documented below](#nested_orchestrated_resource_os_policy_assignment_v1_payload_os_policies_os_policies_resource_groups_resource_groups_resources_resources_pkg_deb). | false | false | None | None | None |
| `yum` | A package managed by YUM. - install: `yum -y install package` - remove: `yum -y remove package` Structure is [documented below](#nested_orchestrated_resource_os_policy_assignment_v1_payload_os_policies_os_policies_resource_groups_resource_groups_resources_resources_pkg_yum). | false | false | None | None | None |
| `zypper` | A package managed by Zypper. - install: `zypper -y install package` - remove: `zypper -y rm package` Structure is [documented below](#nested_orchestrated_resource_os_policy_assignment_v1_payload_os_policies_os_policies_resource_groups_resource_groups_resources_resources_pkg_zypper). | false | false | None | None | None |
| `rpm` | An RPM package file. RPM packages only support INSTALLED state. Structure is [documented below](#nested_orchestrated_resource_os_policy_assignment_v1_payload_os_policies_os_policies_resource_groups_resource_groups_resources_resources_pkg_rpm). | false | false | None | None | None |
| `googet` | A package managed by GooGet. - install: `googet -noconfirm install package` - remove: `googet -noconfirm remove package` Structure is [documented below](#nested_orchestrated_resource_os_policy_assignment_v1_payload_os_policies_os_policies_resource_groups_resource_groups_resources_resources_pkg_googet). | false | false | None | None | None |

### msi Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `source` | A remote or local file. Structure is [documented below](#nested_orchestrated_resource_os_policy_assignment_v1_payload_os_policies_os_policies_resource_groups_resource_groups_resources_resources_pkg_msi_source). | true | false | None | None | None |
| `properties` | Additional properties to use during installation. This should be in the format of Property=Setting. Appended to the defaults of `ACTION=INSTALL REBOOT=ReallySuppress`. | false | false | None | None | None |

### source Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `gcs` | Specifies a file available as a Cloud Storage Object. Structure is [documented below](#nested_orchestrated_resource_os_policy_assignment_v1_payload_os_policies_os_policies_resource_groups_resource_groups_resources_resources_pkg_rpm_source_gcs). | false | false | None | None | None |
| `local_path` | A local path within the VM to use. | false | false | None | None | None |
| `allow_insecure` | Defaults to false. When false, files are subject to validations based on the file type: Remote: A checksum must be specified. Cloud Storage: An object generation number must be specified. | false | false | None | None | None |
| `remote` | Specifies a file available via some URI. Structure is [documented below](#nested_orchestrated_resource_os_policy_assignment_v1_payload_os_policies_os_policies_resource_groups_resource_groups_resources_resources_pkg_rpm_source_remote). | false | false | None | None | None |

### deb Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `source` | A remote or local file. Structure is [documented below](#nested_orchestrated_resource_os_policy_assignment_v1_payload_os_policies_os_policies_resource_groups_resource_groups_resources_resources_pkg_deb_source). | true | false | None | None | None |
| `pull_deps` | Whether dependencies should also be installed. - install when false: `dpkg -i package` - install when true: `apt-get update && apt-get -y install package.deb` | false | false | None | None | None |

### rpm Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `source` | A remote or local file. Structure is [documented below](#nested_orchestrated_resource_os_policy_assignment_v1_payload_os_policies_os_policies_resource_groups_resource_groups_resources_resources_pkg_rpm_source). | true | false | None | None | None |
| `pull_deps` | Whether dependencies should also be installed. - install when false: `rpm --upgrade --replacepkgs package.rpm` - install when true: `yum -y install package.rpm` or `zypper -y install package.rpm` | false | false | None | None | None |

### googet Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `name` | Required. Package name. | true | false | None | None | None |

### instance_filter Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `inclusion_labels` | List of label sets used for VM inclusion. If the list has more than one `LabelSet`, the VM is included if any of the label sets are applicable for the VM. Structure is [documented below](#nested_orchestrated_resource_os_policy_assignment_v1_payload_instance_filter_inclusion_labels). | false | false | None | None | None |
| `exclusion_labels` | List of label sets used for VM exclusion. If the list has more than one label set, the VM is excluded if any of the label sets are applicable for the VM. Structure is [documented below](#nested_orchestrated_resource_os_policy_assignment_v1_payload_instance_filter_exclusion_labels). | false | false | None | None | None |
| `inventories` | List of inventories to select VMs. A VM is selected if its inventory data matches at least one of the following inventories. Structure is [documented below](#nested_orchestrated_resource_os_policy_assignment_v1_payload_instance_filter_inventories). | false | false | Provides security controls for tracking and managing system assets. | None | None |
| `all` | Target all VMs in the project. If true, no other criteria is permitted. | false | false | None | None | None |

### inclusion_labels Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `labels` | Labels are identified by key/value pairs in this map. A VM should contain all the key/value pairs specified in this map to be selected. | false | false | None | None | None |

### exclusion_labels Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `labels` | Labels are identified by key/value pairs in this map. A VM should contain all the key/value pairs specified in this map to be selected. | false | false | None | None | None |

### inventories Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `os_short_name` | Required. The OS short name | true | false | Enforces consistent OS platform security across all managed instances. | ['debian'] | ['windows'] |
| `os_version` | The OS version Prefix matches are supported if asterisk(*) is provided as the last character. For example, to match all versions with a major version of `7`, specify the following value for this field `7.*` An empty string matches all OS versions. | false | false | None | None | None |

### rollout Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `disruption_budget` | Message encapsulating a value that can be either absolute ("fixed") or relative ("percent") to a value. Structure is [documented below](#nested_orchestrated_resource_os_policy_assignment_v1_payload_rollout_disruption_budget). | true | false | None | None | None |
| `min_wait_duration` | Required. This determines the minimum duration of time to wait after the configuration changes are applied through the current rollout. A VM continues to count towards the `disruption_budget` at least until this duration of time has passed after configuration changes are applied. | true | false | None | None | None |

### disruption_budget Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `fixed` | Specifies a fixed value. | false | false | None | None | None |
| `percent` | Specifies the relative value defined as a percentage, which will be multiplied by a reference value. | false | false | None | None | None |

### selectors Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `resource_hierarchy_selector` | Selector containing Cloud Resource Manager resource hierarchy nodes. Structure is [documented below](#nested_orchestration_scope_selectors_selectors_resource_hierarchy_selector). | false | false | None | None | None |
| `location_selector` | Selector containing locations in scope. Structure is [documented below](#nested_orchestration_scope_selectors_selectors_location_selector). | false | true | Manages security policies based on physical and logical location constraints. | None | None |

### resource_hierarchy_selector Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `included_projects` | Optional. Names of the projects in scope. Format: `projects/{project_number}` | false | false | None | None | None |
| `included_folders` | Optional. Names of the folders in scope. Format: `folders/{folder_id}` | false | false | None | None | None |

### location_selector Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `included_locations` | Optional. Names of the locations in scope. | false | true | Defines precisely which geographic locations are approved for resource deployment, enhancing compliance with data residency regulations. | ['Sydney', 'Melbourne'] | ['Mumbai', 'Berlin'] |
