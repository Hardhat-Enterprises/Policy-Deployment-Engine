## 🛡️ Policy Deployment Engine: `os_config_guest_policies`

This section provides a concise policy evaluation for the `os_config_guest_policies` resource in GCP.

Reference: [Terraform Registry – os_config_guest_policies](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/os_config_guest_policies)

---

## 1. Argument Reference

### `assignment`
- Description: (Required) Specifies the VM instances that are assigned to this policy. This allows you to target sets or groups of VM instances by different parameters such as labels, names, OS, or zones. If left empty, all VM instances underneath this policy are targeted. At the same level in the resource hierarchy (that is within a project), the service prevents the creation of multiple policies that conflict with each other. For more information, see how the service [handles assignment conflicts](https://cloud.google.com/compute/docs/os-config-management/create-guest-policy#handle-conflicts). Structure is [documented below](#nested_assignment).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `guest_policy_id`
- Description: (Required) The logical name of the guest policy in the project with the following restrictions: * Must contain only lowercase letters, numbers, and hyphens. * Must start with a letter. * Must be between 1-63 characters. * Must end with a number or a letter. * Must be unique within the project.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) Description of the guest policy. Length of the description is limited to 1024 characters.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `packages`
- Description: (Optional) The software packages to be managed by this policy. Structure is [documented below](#nested_packages).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `package_repositories`
- Description: (Optional) A list of package repositories to configure on the VM instance. This is done before any other configs are applied so they can use these repos. Package repositories are only configured if the corresponding package manager(s) are available. Structure is [documented below](#nested_package_repositories).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `recipes`
- Description: (Optional) A list of Recipes to install on the VM instance. Structure is [documented below](#nested_recipes).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `etag`
- Description: (Optional) The etag for this guest policy. If this is provided on update, it must match the server's etag.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_assignment"></a>The `assignment` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `group_labels`
- Description: (Optional) Targets instances matching at least one of these label sets. This allows an assignment to target disparate groups, for example "env=prod or env=staging". Structure is [documented below](#nested_assignment_group_labels).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `zones`
- Description: (Optional) Targets instances in any of these zones. Leave empty to target instances in any zone. Zonal targeting is uncommon and is supported to facilitate the management of changes by zone.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `instances`
- Description: (Optional) Targets any of the instances specified. Instances are specified by their URI in the form zones/[ZONE]/instances/[INSTANCE_NAME]. Instance targeting is uncommon and is supported to facilitate the management of changes by the instance or to target specific VM instances for development and testing. Only supported for project-level policies and must reference instances within this project.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `instance_name_prefixes`
- Description: (Optional) Targets VM instances whose name starts with one of these prefixes. Like labels, this is another way to group VM instances when targeting configs, for example prefix="prod-". Only supported for project-level policies.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `os_types`
- Description: (Optional) Targets VM instances matching at least one of the following OS types. VM instances must match all supplied criteria for a given OsType to be included. Structure is [documented below](#nested_assignment_os_types). <a name="nested_assignment_group_labels"></a>The `group_labels` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Required) Google Compute Engine instance labels that must be present for an instance to be included in this assignment group. <a name="nested_assignment_os_types"></a>The `os_types` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `os_short_name`
- Description: (Optional) Targets VM instances with OS Inventory enabled and having the following OS short name, for example "debian" or "windows".
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `os_version`
- Description: (Optional) Targets VM instances with OS Inventory enabled and having the following following OS version.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `os_architecture`
- Description: (Optional) Targets VM instances with OS Inventory enabled and having the following OS architecture. <a name="nested_packages"></a>The `packages` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Required) The name of the package. A package is uniquely identified for conflict validation by checking the package name and the manager(s) that the package targets.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `desired_state`
- Description: (Optional) The desiredState the agent should maintain for this package. The default is to ensure the package is installed. Possible values are: `INSTALLED`, `UPDATED`, `REMOVED`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `manager`
- Description: (Optional) Type of package manager that can be used to install this package. If a system does not have the package manager, the package is not installed or removed no error message is returned. By default, or if you specify ANY, the agent attempts to install and remove this package using the default package manager. This is useful when creating a policy that applies to different types of systems. The default behavior is ANY. Default value is `ANY`. Possible values are: `ANY`, `APT`, `YUM`, `ZYPPER`, `GOO`. <a name="nested_package_repositories"></a>The `package_repositories` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `apt`
- Description: (Optional) An Apt Repository. Structure is [documented below](#nested_package_repositories_package_repositories_apt).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `yum`
- Description: (Optional) A Yum Repository. Structure is [documented below](#nested_package_repositories_package_repositories_yum).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `zypper`
- Description: (Optional) A Zypper Repository. Structure is [documented below](#nested_package_repositories_package_repositories_zypper).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `goo`
- Description: (Optional) A Goo Repository. Structure is [documented below](#nested_package_repositories_package_repositories_goo). <a name="nested_package_repositories_package_repositories_apt"></a>The `apt` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `archive_type`
- Description: (Optional) Type of archive files in this repository. The default behavior is DEB. Default value is `DEB`. Possible values are: `DEB`, `DEB_SRC`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `uri`
- Description: (Required) URI for this repository.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `distribution`
- Description: (Required) Distribution of this repository.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `components`
- Description: (Required) List of components for this repository. Must contain at least one item.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `gpg_key`
- Description: (Optional) URI of the key file for this repository. The agent maintains a keyring at /etc/apt/trusted.gpg.d/osconfig_agent_managed.gpg containing all the keys in any applied guest policy. <a name="nested_package_repositories_package_repositories_yum"></a>The `yum` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `id`
- Description: (Required) A one word, unique name for this repository. This is the repo id in the Yum config file and also the displayName if displayName is omitted. This id is also used as the unique identifier when checking for guest policy conflicts.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `display_name`
- Description: (Optional) The display name of the repository.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `base_url`
- Description: (Required) The location of the repository directory.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `gpg_keys`
- Description: (Optional) URIs of GPG keys. <a name="nested_package_repositories_package_repositories_zypper"></a>The `zypper` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `id`
- Description: (Required) A one word, unique name for this repository. This is the repo id in the zypper config file and also the displayName if displayName is omitted. This id is also used as the unique identifier when checking for guest policy conflicts.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `display_name`
- Description: (Optional) The display name of the repository.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `base_url`
- Description: (Required) The location of the repository directory.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `gpg_keys`
- Description: (Optional) URIs of GPG keys. <a name="nested_package_repositories_package_repositories_goo"></a>The `goo` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Required) The name of the repository.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `url`
- Description: (Required) The url of the repository. <a name="nested_recipes"></a>The `recipes` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Required) Unique identifier for the recipe. Only one recipe with a given name is installed on an instance. Names are also used to identify resources which helps to determine whether guest policies have conflicts. This means that requests to create multiple recipes with the same name and version are rejected since they could potentially have conflicting assignments.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `version`
- Description: (Optional) The version of this software recipe. Version can be up to 4 period separated numbers (e.g. 12.34.56.78).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `artifacts`
- Description: (Optional) Resources available to be used in the steps in the recipe. Structure is [documented below](#nested_recipes_recipes_artifacts).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `install_steps`
- Description: (Optional) Actions to be taken for installing this recipe. On failure it stops executing steps and does not attempt another installation. Any steps taken (including partially completed steps) are not rolled back. Structure is [documented below](#nested_recipes_recipes_install_steps).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `update_steps`
- Description: (Optional) Actions to be taken for updating this recipe. On failure it stops executing steps and does not attempt another update for this recipe. Any steps taken (including partially completed steps) are not rolled back. Structure is [documented below](#nested_recipes_recipes_update_steps).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `desired_state`
- Description: (Optional) Default is INSTALLED. The desired state the agent should maintain for this recipe. INSTALLED: The software recipe is installed on the instance but won't be updated to new versions. INSTALLED_KEEP_UPDATED: The software recipe is installed on the instance. The recipe is updated to a higher version, if a higher version of the recipe is assigned to this instance. REMOVE: Remove is unsupported for software recipes and attempts to create or update a recipe to the REMOVE state is rejected. Default value is `INSTALLED`. Possible values are: `INSTALLED`, `UPDATED`, `REMOVED`. <a name="nested_recipes_recipes_artifacts"></a>The `artifacts` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `id`
- Description: (Required) Id of the artifact, which the installation and update steps of this recipe can reference. Artifacts in a recipe cannot have the same id.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `allow_insecure`
- Description: (Optional) Defaults to false. When false, recipes are subject to validations based on the artifact type: Remote: A checksum must be specified, and only protocols with transport-layer security are permitted. GCS: An object generation number must be specified.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `remote`
- Description: (Optional) A generic remote artifact. Structure is [documented below](#nested_recipes_recipes_artifacts_artifacts_remote).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `gcs`
- Description: (Optional) A Google Cloud Storage artifact. Structure is [documented below](#nested_recipes_recipes_artifacts_artifacts_gcs). <a name="nested_recipes_recipes_artifacts_artifacts_remote"></a>The `remote` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `uri`
- Description: (Optional) URI from which to fetch the object. It should contain both the protocol and path following the format {protocol}://{location}.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `check_sum`
- Description: (Optional) Must be provided if allowInsecure is false. SHA256 checksum in hex format, to compare to the checksum of the artifact. If the checksum is not empty and it doesn't match the artifact then the recipe installation fails before running any of the steps. <a name="nested_recipes_recipes_artifacts_artifacts_gcs"></a>The `gcs` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `bucket`
- Description: (Optional) Bucket of the Google Cloud Storage object. Given an example URL: https://storage.googleapis.com/my-bucket/foo/bar#1234567 this value would be my-bucket.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `object`
- Description: (Optional) Name of the Google Cloud Storage object. Given an example URL: https://storage.googleapis.com/my-bucket/foo/bar#1234567 this value would be foo/bar.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `generation`
- Description: (Optional) Must be provided if allowInsecure is false. Generation number of the Google Cloud Storage object. https://storage.googleapis.com/my-bucket/foo/bar#1234567 this value would be 1234567. <a name="nested_recipes_recipes_install_steps"></a>The `install_steps` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `file_copy`
- Description: (Optional) Copies a file onto the instance. Structure is [documented below](#nested_recipes_recipes_install_steps_install_steps_file_copy).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `archive_extraction`
- Description: (Optional) Extracts an archive into the specified directory. Structure is [documented below](#nested_recipes_recipes_install_steps_install_steps_archive_extraction).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `msi_installation`
- Description: (Optional) Installs an MSI file. Structure is [documented below](#nested_recipes_recipes_install_steps_install_steps_msi_installation).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `dpkg_installation`
- Description: (Optional) Installs a deb file via dpkg. Structure is [documented below](#nested_recipes_recipes_install_steps_install_steps_dpkg_installation).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `rpm_installation`
- Description: (Optional) Installs an rpm file via the rpm utility. Structure is [documented below](#nested_recipes_recipes_install_steps_install_steps_rpm_installation).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `file_exec`
- Description: (Optional) Executes an artifact or local file. Structure is [documented below](#nested_recipes_recipes_install_steps_install_steps_file_exec).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `script_run`
- Description: (Optional) Runs commands in a shell. Structure is [documented below](#nested_recipes_recipes_install_steps_install_steps_script_run). <a name="nested_recipes_recipes_install_steps_install_steps_file_copy"></a>The `file_copy` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `artifact_id`
- Description: (Required) The id of the relevant artifact in the recipe.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `destination`
- Description: (Required) The absolute path on the instance to put the file.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `overwrite`
- Description: (Optional) Whether to allow this step to overwrite existing files.If this is false and the file already exists the file is not overwritten and the step is considered a success. Defaults to false.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `permissions`
- Description: (Optional) Consists of three octal digits which represent, in order, the permissions of the owner, group, and other users for the file (similarly to the numeric mode used in the linux chmod utility). Each digit represents a three bit number with the 4 bit corresponding to the read permissions, the 2 bit corresponds to the write bit, and the one bit corresponds to the execute permission. Default behavior is 755. Below are some examples of permissions and their associated values: read, write, and execute: 7 read and execute: 5 read and write: 6 read only: 4 <a name="nested_recipes_recipes_install_steps_install_steps_archive_extraction"></a>The `archive_extraction` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `artifact_id`
- Description: (Required) The id of the relevant artifact in the recipe.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `destination`
- Description: (Optional) Directory to extract archive to. Defaults to / on Linux or C:\ on Windows.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `type`
- Description: (Required) The type of the archive to extract. Possible values are: `TAR`, `TAR_GZIP`, `TAR_BZIP`, `TAR_LZMA`, `TAR_XZ`, `ZIP`. <a name="nested_recipes_recipes_install_steps_install_steps_msi_installation"></a>The `msi_installation` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `artifact_id`
- Description: (Required) The id of the relevant artifact in the recipe.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `flags`
- Description: (Optional) The flags to use when installing the MSI. Defaults to the install flag.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `allowed_exit_codes`
- Description: (Optional) Return codes that indicate that the software installed or updated successfully. Behaviour defaults to [0] <a name="nested_recipes_recipes_install_steps_install_steps_dpkg_installation"></a>The `dpkg_installation` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `artifact_id`
- Description: (Required) The id of the relevant artifact in the recipe. <a name="nested_recipes_recipes_install_steps_install_steps_rpm_installation"></a>The `rpm_installation` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `artifact_id`
- Description: (Required) The id of the relevant artifact in the recipe. <a name="nested_recipes_recipes_install_steps_install_steps_file_exec"></a>The `file_exec` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `args`
- Description: (Optional) Arguments to be passed to the provided executable.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `allowed_exit_codes`
- Description: (Optional) A list of possible return values that the program can return to indicate a success. Defaults to [0].
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `artifact_id`
- Description: (Optional) The id of the relevant artifact in the recipe.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `local_path`
- Description: (Optional) The absolute path of the file on the local filesystem. <a name="nested_recipes_recipes_install_steps_install_steps_script_run"></a>The `script_run` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `script`
- Description: (Required) The shell script to be executed.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `allowed_exit_codes`
- Description: (Optional) Return codes that indicate that the software installed or updated successfully. Behaviour defaults to [0]
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `interpreter`
- Description: (Optional) The script interpreter to use to run the script. If no interpreter is specified the script is executed directly, which likely only succeed for scripts with shebang lines. Possible values are: `SHELL`, `POWERSHELL`. <a name="nested_recipes_recipes_update_steps"></a>The `update_steps` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `file_copy`
- Description: (Optional) Copies a file onto the instance. Structure is [documented below](#nested_recipes_recipes_update_steps_update_steps_file_copy).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `archive_extraction`
- Description: (Optional) Extracts an archive into the specified directory. Structure is [documented below](#nested_recipes_recipes_update_steps_update_steps_archive_extraction).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `msi_installation`
- Description: (Optional) Installs an MSI file. Structure is [documented below](#nested_recipes_recipes_update_steps_update_steps_msi_installation).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `dpkg_installation`
- Description: (Optional) Installs a deb file via dpkg. Structure is [documented below](#nested_recipes_recipes_update_steps_update_steps_dpkg_installation).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `rpm_installation`
- Description: (Optional) Installs an rpm file via the rpm utility. Structure is [documented below](#nested_recipes_recipes_update_steps_update_steps_rpm_installation).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `file_exec`
- Description: (Optional) Executes an artifact or local file. Structure is [documented below](#nested_recipes_recipes_update_steps_update_steps_file_exec).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `script_run`
- Description: (Optional) Runs commands in a shell. Structure is [documented below](#nested_recipes_recipes_update_steps_update_steps_script_run). <a name="nested_recipes_recipes_update_steps_update_steps_file_copy"></a>The `file_copy` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `artifact_id`
- Description: (Required) The id of the relevant artifact in the recipe.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `destination`
- Description: (Required) The absolute path on the instance to put the file.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `overwrite`
- Description: (Optional) Whether to allow this step to overwrite existing files.If this is false and the file already exists the file is not overwritten and the step is considered a success. Defaults to false.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `permissions`
- Description: (Optional) Consists of three octal digits which represent, in order, the permissions of the owner, group, and other users for the file (similarly to the numeric mode used in the linux chmod utility). Each digit represents a three bit number with the 4 bit corresponding to the read permissions, the 2 bit corresponds to the write bit, and the one bit corresponds to the execute permission. Default behavior is 755. Below are some examples of permissions and their associated values: read, write, and execute: 7 read and execute: 5 read and write: 6 read only: 4 <a name="nested_recipes_recipes_update_steps_update_steps_archive_extraction"></a>The `archive_extraction` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `artifact_id`
- Description: (Required) The id of the relevant artifact in the recipe.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `destination`
- Description: (Optional) Directory to extract archive to. Defaults to / on Linux or C:\ on Windows.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `type`
- Description: (Required) The type of the archive to extract. Possible values are: `TAR`, `TAR_GZIP`, `TAR_BZIP`, `TAR_LZMA`, `TAR_XZ`, `ZIP`. <a name="nested_recipes_recipes_update_steps_update_steps_msi_installation"></a>The `msi_installation` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `artifact_id`
- Description: (Required) The id of the relevant artifact in the recipe.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `flags`
- Description: (Optional) The flags to use when installing the MSI. Defaults to the install flag.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `allowed_exit_codes`
- Description: (Optional) Return codes that indicate that the software installed or updated successfully. Behaviour defaults to [0] <a name="nested_recipes_recipes_update_steps_update_steps_dpkg_installation"></a>The `dpkg_installation` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `artifact_id`
- Description: (Required) The id of the relevant artifact in the recipe. <a name="nested_recipes_recipes_update_steps_update_steps_rpm_installation"></a>The `rpm_installation` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `artifact_id`
- Description: (Required) The id of the relevant artifact in the recipe. <a name="nested_recipes_recipes_update_steps_update_steps_file_exec"></a>The `file_exec` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `args`
- Description: (Optional) Arguments to be passed to the provided executable.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `allowed_exit_codes`
- Description: (Optional) A list of possible return values that the program can return to indicate a success. Defaults to [0].
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `artifact_id`
- Description: (Optional) The id of the relevant artifact in the recipe.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `local_path`
- Description: (Optional) The absolute path of the file on the local filesystem. <a name="nested_recipes_recipes_update_steps_update_steps_script_run"></a>The `script_run` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `script`
- Description: (Required) The shell script to be executed.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `allowed_exit_codes`
- Description: (Optional) Return codes that indicate that the software installed or updated successfully. Behaviour defaults to [0]
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `interpreter`
- Description: (Optional) The script interpreter to use to run the script. If no interpreter is specified the script is executed directly, which likely only succeed for scripts with shebang lines. Possible values are: `SHELL`, `POWERSHELL`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
