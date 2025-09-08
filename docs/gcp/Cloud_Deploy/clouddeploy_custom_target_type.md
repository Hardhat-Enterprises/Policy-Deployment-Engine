## 🛡️ Policy Deployment Engine: `clouddeploy_custom_target_type`

This section provides a concise policy evaluation for the `clouddeploy_custom_target_type` resource in GCP.

Reference: [Terraform Registry – clouddeploy_custom_target_type](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/clouddeploy_custom_target_type)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | Name of the `CustomTargetType`. | true | None | None |
| `location` | The location of the source. | true | None | None |
| `description` | Description of the `CustomTargetType`. Max length is 255 characters. | false | None | None |
| `annotations` | User annotations. These attributes can only be set and used by the user, and not by Cloud Deploy. See https://google.aip.dev/128#annotations for more details such as format and size limitations. **Note**: This field is non-authoritative, and will only manage the annotations present in your configuration. Please refer to the field `effective_annotations` for all of the annotations present on the resource. | false | None | None |
| `labels` | Labels are attributes that can be set and used by both the user and by Cloud Deploy. Labels must meet the following constraints: * Keys and values can contain only lowercase letters, numeric characters, underscores, and dashes. * All characters must use UTF-8 encoding, and international characters are allowed. * Keys must start with a lowercase letter or international character. * Each resource is limited to a maximum of 64 labels. Both keys and values are additionally constrained to be <= 128 bytes. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### custom_actions Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `render_action` | The Skaffold custom action responsible for render operations. If not provided then Cloud Deploy will perform the render operations via `skaffold render`. | false | None | None |
| `deploy_action` | The Skaffold custom action responsible for deploy operations. | true | None | None |
| `include_skaffold_modules` | List of Skaffold modules Cloud Deploy will include in the Skaffold Config as required before performing diagnose. Structure is [documented below](#nested_custom_actions_include_skaffold_modules). | false | None | None |

### include_skaffold_modules Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `configs` | The Skaffold Config modules to use from the specified source. | false | None | None |
| `git` | Remote git repository containing the Skaffold Config modules. Structure is [documented below](#nested_custom_actions_include_skaffold_modules_include_skaffold_modules_git). | false | None | None |
| `google_cloud_storage` | Cloud Storage bucket containing Skaffold Config modules. Structure is [documented below](#nested_custom_actions_include_skaffold_modules_include_skaffold_modules_google_cloud_storage). | false | None | None |
| `google_cloud_build_repo` | Cloud Build 2nd gen repository containing the Skaffold Config modules. Structure is [documented below](#nested_custom_actions_include_skaffold_modules_include_skaffold_modules_google_cloud_build_repo). | false | None | None |

### git Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `repo` | Git repository the package should be cloned from. | true | None | None |
| `path` | Relative path from the repository root to the Skaffold file. | false | None | None |
| `ref` | Git ref the package should be cloned from. | false | None | None |

### google_cloud_storage Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `source` | Cloud Storage source paths to copy recursively. For example, providing `gs://my-bucket/dir/configs/*` will result in Skaffold copying all files within the `dir/configs` directory in the bucket `my-bucket`. | true | None | None |
| `path` | Relative path from the source to the Skaffold file. | false | None | None |

### google_cloud_build_repo Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `repository` | Cloud Build 2nd gen repository in the format of 'projects/<project>/locations/<location>/connections/<connection>/repositories/<repository>'. | true | None | None |
| `path` | Relative path from the repository root to the Skaffold file. | false | None | None |
| `ref` | Branch or tag to use when cloning the repository. | false | None | None |
