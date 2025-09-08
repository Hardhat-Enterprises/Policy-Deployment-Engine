## 🛡️ Policy Deployment Engine: `os_config_guest_policies`

This section provides a concise policy evaluation for the `os_config_guest_policies` resource in GCP.

Reference: [Terraform Registry – os_config_guest_policies](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/os_config_guest_policies)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `guest_policy_id` | The logical name of the guest policy in the project with the following restrictions: * Must contain only lowercase letters, numbers, and hyphens. * Must start with a letter. * Must be between 1-63 characters. * Must end with a number or a letter. * Must be unique within the project. | true | None | None |
| `description` | Description of the guest policy. Length of the description is limited to 1024 characters. | false | None | None |
| `etag` | The etag for this guest policy. If this is provided on update, it must match the server's etag. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### assignment Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `group_labels` | Targets instances matching at least one of these label sets. This allows an assignment to target disparate groups, for example "env=prod or env=staging". Structure is [documented below](#nested_assignment_group_labels). | false | None | None |
| `zones` | Targets instances in any of these zones. Leave empty to target instances in any zone. Zonal targeting is uncommon and is supported to facilitate the management of changes by zone. | false | None | None |
| `instances` | Targets any of the instances specified. Instances are specified by their URI in the form zones/[ZONE]/instances/[INSTANCE_NAME]. Instance targeting is uncommon and is supported to facilitate the management of changes by the instance or to target specific VM instances for development and testing. Only supported for project-level policies and must reference instances within this project. | false | None | None |
| `instance_name_prefixes` | Targets VM instances whose name starts with one of these prefixes. Like labels, this is another way to group VM instances when targeting configs, for example prefix="prod-". Only supported for project-level policies. | false | None | None |
| `os_types` | Targets VM instances matching at least one of the following OS types. VM instances must match all supplied criteria for a given OsType to be included. Structure is [documented below](#nested_assignment_os_types). | false | None | None |

### packages Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | The name of the package. A package is uniquely identified for conflict validation by checking the package name and the manager(s) that the package targets. | true | None | None |
| `desired_state` | The desiredState the agent should maintain for this package. The default is to ensure the package is installed. Possible values are: `INSTALLED`, `UPDATED`, `REMOVED`. | false | None | None |
| `manager` | Type of package manager that can be used to install this package. If a system does not have the package manager, the package is not installed or removed no error message is returned. By default, or if you specify ANY, the agent attempts to install and remove this package using the default package manager. This is useful when creating a policy that applies to different types of systems. The default behavior is ANY. Default value is `ANY`. Possible values are: `ANY`, `APT`, `YUM`, `ZYPPER`, `GOO`. | false | None | None |

### package_repositories Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `apt` | An Apt Repository. Structure is [documented below](#nested_package_repositories_package_repositories_apt). | false | None | None |
| `yum` | A Yum Repository. Structure is [documented below](#nested_package_repositories_package_repositories_yum). | false | None | None |
| `zypper` | A Zypper Repository. Structure is [documented below](#nested_package_repositories_package_repositories_zypper). | false | None | None |
| `goo` | A Goo Repository. Structure is [documented below](#nested_package_repositories_package_repositories_goo). | false | None | None |

### recipes Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | Unique identifier for the recipe. Only one recipe with a given name is installed on an instance. Names are also used to identify resources which helps to determine whether guest policies have conflicts. This means that requests to create multiple recipes with the same name and version are rejected since they could potentially have conflicting assignments. | true | None | None |
| `version` | The version of this software recipe. Version can be up to 4 period separated numbers (e.g. 12.34.56.78). | false | None | None |
| `artifacts` | Resources available to be used in the steps in the recipe. Structure is [documented below](#nested_recipes_recipes_artifacts). | false | None | None |
| `install_steps` | Actions to be taken for installing this recipe. On failure it stops executing steps and does not attempt another installation. Any steps taken (including partially completed steps) are not rolled back. Structure is [documented below](#nested_recipes_recipes_install_steps). | false | None | None |
| `update_steps` | Actions to be taken for updating this recipe. On failure it stops executing steps and does not attempt another update for this recipe. Any steps taken (including partially completed steps) are not rolled back. Structure is [documented below](#nested_recipes_recipes_update_steps). | false | None | None |
| `desired_state` | Default is INSTALLED. The desired state the agent should maintain for this recipe. INSTALLED: The software recipe is installed on the instance but won't be updated to new versions. INSTALLED_KEEP_UPDATED: The software recipe is installed on the instance. The recipe is updated to a higher version, if a higher version of the recipe is assigned to this instance. REMOVE: Remove is unsupported for software recipes and attempts to create or update a recipe to the REMOVE state is rejected. Default value is `INSTALLED`. Possible values are: `INSTALLED`, `UPDATED`, `REMOVED`. | false | None | None |

### group_labels Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `labels` | Google Compute Engine instance labels that must be present for an instance to be included in this assignment group. | true | None | None |

### os_types Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `os_short_name` | Targets VM instances with OS Inventory enabled and having the following OS short name, for example "debian" or "windows". | false | None | None |
| `os_version` | Targets VM instances with OS Inventory enabled and having the following following OS version. | false | None | None |
| `os_architecture` | Targets VM instances with OS Inventory enabled and having the following OS architecture. | false | None | None |

### apt Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `archive_type` | Type of archive files in this repository. The default behavior is DEB. Default value is `DEB`. Possible values are: `DEB`, `DEB_SRC`. | false | None | None |
| `uri` | URI for this repository. | true | None | None |
| `distribution` | Distribution of this repository. | true | None | None |
| `components` | List of components for this repository. Must contain at least one item. | true | None | None |
| `gpg_key` | URI of the key file for this repository. The agent maintains a keyring at /etc/apt/trusted.gpg.d/osconfig_agent_managed.gpg containing all the keys in any applied guest policy. | false | None | None |

### yum Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `id` | A one word, unique name for this repository. This is the repo id in the Yum config file and also the displayName if displayName is omitted. This id is also used as the unique identifier when checking for guest policy conflicts. | true | None | None |
| `display_name` | The display name of the repository. | false | None | None |
| `base_url` | The location of the repository directory. | true | None | None |
| `gpg_keys` | URIs of GPG keys. | false | None | None |

### zypper Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `id` | A one word, unique name for this repository. This is the repo id in the zypper config file and also the displayName if displayName is omitted. This id is also used as the unique identifier when checking for guest policy conflicts. | true | None | None |
| `display_name` | The display name of the repository. | false | None | None |
| `base_url` | The location of the repository directory. | true | None | None |
| `gpg_keys` | URIs of GPG keys. | false | None | None |

### goo Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | The name of the repository. | true | None | None |
| `url` | The url of the repository. | true | None | None |

### artifacts Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `id` | Id of the artifact, which the installation and update steps of this recipe can reference. Artifacts in a recipe cannot have the same id. | true | None | None |
| `allow_insecure` | Defaults to false. When false, recipes are subject to validations based on the artifact type: Remote: A checksum must be specified, and only protocols with transport-layer security are permitted. GCS: An object generation number must be specified. | false | None | None |
| `remote` | A generic remote artifact. Structure is [documented below](#nested_recipes_recipes_artifacts_artifacts_remote). | false | None | None |
| `gcs` | A Google Cloud Storage artifact. Structure is [documented below](#nested_recipes_recipes_artifacts_artifacts_gcs). | false | None | None |

### remote Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `uri` | URI from which to fetch the object. It should contain both the protocol and path following the format {protocol}://{location}. | false | None | None |
| `check_sum` | Must be provided if allowInsecure is false. SHA256 checksum in hex format, to compare to the checksum of the artifact. If the checksum is not empty and it doesn't match the artifact then the recipe installation fails before running any of the steps. | false | None | None |

### gcs Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `bucket` | Bucket of the Google Cloud Storage object. Given an example URL: https://storage.googleapis.com/my-bucket/foo/bar#1234567 this value would be my-bucket. | false | None | None |
| `object` | Name of the Google Cloud Storage object. Given an example URL: https://storage.googleapis.com/my-bucket/foo/bar#1234567 this value would be foo/bar. | false | None | None |
| `generation` | Must be provided if allowInsecure is false. Generation number of the Google Cloud Storage object. https://storage.googleapis.com/my-bucket/foo/bar#1234567 this value would be 1234567. | false | None | None |

### install_steps Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `file_copy` | Copies a file onto the instance. Structure is [documented below](#nested_recipes_recipes_install_steps_install_steps_file_copy). | false | None | None |
| `archive_extraction` | Extracts an archive into the specified directory. Structure is [documented below](#nested_recipes_recipes_install_steps_install_steps_archive_extraction). | false | None | None |
| `msi_installation` | Installs an MSI file. Structure is [documented below](#nested_recipes_recipes_install_steps_install_steps_msi_installation). | false | None | None |
| `dpkg_installation` | Installs a deb file via dpkg. Structure is [documented below](#nested_recipes_recipes_install_steps_install_steps_dpkg_installation). | false | None | None |
| `rpm_installation` | Installs an rpm file via the rpm utility. Structure is [documented below](#nested_recipes_recipes_install_steps_install_steps_rpm_installation). | false | None | None |
| `file_exec` | Executes an artifact or local file. Structure is [documented below](#nested_recipes_recipes_install_steps_install_steps_file_exec). | false | None | None |
| `script_run` | Runs commands in a shell. Structure is [documented below](#nested_recipes_recipes_install_steps_install_steps_script_run). | false | None | None |

### file_copy Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `artifact_id` | The id of the relevant artifact in the recipe. | true | None | None |
| `destination` | The absolute path on the instance to put the file. | true | None | None |
| `overwrite` | Whether to allow this step to overwrite existing files.If this is false and the file already exists the file is not overwritten and the step is considered a success. Defaults to false. | false | None | None |
| `permissions` | Consists of three octal digits which represent, in order, the permissions of the owner, group, and other users for the file (similarly to the numeric mode used in the linux chmod utility). Each digit represents a three bit number with the 4 bit corresponding to the read permissions, the 2 bit corresponds to the write bit, and the one bit corresponds to the execute permission. Default behavior is 755. Below are some examples of permissions and their associated values: read, write, and execute: 7 read and execute: 5 read and write: 6 read only: 4 | false | None | None |

### archive_extraction Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `artifact_id` | The id of the relevant artifact in the recipe. | true | None | None |
| `destination` | Directory to extract archive to. Defaults to / on Linux or C:\ on Windows. | false | None | None |
| `type` | The type of the archive to extract. Possible values are: `TAR`, `TAR_GZIP`, `TAR_BZIP`, `TAR_LZMA`, `TAR_XZ`, `ZIP`. | true | None | None |

### msi_installation Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `artifact_id` | The id of the relevant artifact in the recipe. | true | None | None |
| `flags` | The flags to use when installing the MSI. Defaults to the install flag. | false | None | None |
| `allowed_exit_codes` | Return codes that indicate that the software installed or updated successfully. Behaviour defaults to [0] | false | None | None |

### dpkg_installation Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `artifact_id` | The id of the relevant artifact in the recipe. | true | None | None |

### rpm_installation Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `artifact_id` | The id of the relevant artifact in the recipe. | true | None | None |

### file_exec Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `args` | Arguments to be passed to the provided executable. | false | None | None |
| `allowed_exit_codes` | A list of possible return values that the program can return to indicate a success. Defaults to [0]. | false | None | None |
| `artifact_id` | The id of the relevant artifact in the recipe. | false | None | None |
| `local_path` | The absolute path of the file on the local filesystem. | false | None | None |

### script_run Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `script` | The shell script to be executed. | true | None | None |
| `allowed_exit_codes` | Return codes that indicate that the software installed or updated successfully. Behaviour defaults to [0] | false | None | None |
| `interpreter` | The script interpreter to use to run the script. If no interpreter is specified the script is executed directly, which likely only succeed for scripts with shebang lines. Possible values are: `SHELL`, `POWERSHELL`. | false | None | None |

### update_steps Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `file_copy` | Copies a file onto the instance. Structure is [documented below](#nested_recipes_recipes_update_steps_update_steps_file_copy). | false | None | None |
| `archive_extraction` | Extracts an archive into the specified directory. Structure is [documented below](#nested_recipes_recipes_update_steps_update_steps_archive_extraction). | false | None | None |
| `msi_installation` | Installs an MSI file. Structure is [documented below](#nested_recipes_recipes_update_steps_update_steps_msi_installation). | false | None | None |
| `dpkg_installation` | Installs a deb file via dpkg. Structure is [documented below](#nested_recipes_recipes_update_steps_update_steps_dpkg_installation). | false | None | None |
| `rpm_installation` | Installs an rpm file via the rpm utility. Structure is [documented below](#nested_recipes_recipes_update_steps_update_steps_rpm_installation). | false | None | None |
| `file_exec` | Executes an artifact or local file. Structure is [documented below](#nested_recipes_recipes_update_steps_update_steps_file_exec). | false | None | None |
| `script_run` | Runs commands in a shell. Structure is [documented below](#nested_recipes_recipes_update_steps_update_steps_script_run). | false | None | None |
