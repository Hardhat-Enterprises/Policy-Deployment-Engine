## 🛡️ Policy Deployment Engine: `clouddeploy_custom_target_type`

This section provides a concise policy evaluation for the `clouddeploy_custom_target_type` resource in GCP.

Reference: [Terraform Registry – clouddeploy_custom_target_type](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/clouddeploy_custom_target_type)

---

## Argument Reference
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `name` | Name of the `CustomTargetType`. | true | false | Simple string identifier with no security implications. Cannot be used to access resources or execute code. | None | None |
| `location` | The location of the source. | true | false | Geographic/regional identifier only. Determines where the resource is stored but has no access control implications. | None | None |
| `description` | Description of the `CustomTargetType`. Max length is 255 characters. | false | false | Fext field for documentation. Doesn't affect system behaviour or grant access. | None | None |
| `annotations` | User annotations. These attributes can only be set and used by the user, and not by Cloud Deploy. See https://google.aip.dev/128#annotations for more details such as format and size limitations. **Note**: This field is non-authoritative, and will only manage the annotations present in your configuration. Please refer to the field `effective_annotations` for all of the annotations present on the resource. | false | false | Key-value metadata for user documentation only. Explicitly stated as 'can only be set and used by the user, and not by Cloud Deploy' - no operational impact. | None | None |
| `labels` | Labels are attributes that can be set and used by both the user and by Cloud Deploy. Labels must meet the following constraints: * Keys and values can contain only lowercase letters, numeric characters, underscores, and dashes. * All characters must use UTF-8 encoding, and international characters are allowed. * Keys must start with a lowercase letter or international character. * Each resource is limited to a maximum of 64 labels. Both keys and values are additionally constrained to be <= 128 bytes. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | false | Tags that could theoretically be used for resource selection, but in this context they're just organizational markers with no execution or access control | None | None |
| `custom_actions` | Configures render and deploy for the `CustomTargetType` using Skaffold custom actions. Structure is [documented below](#nested_custom_actions). | false | true | Executes arbitrary code through Skaffold actions and can pull code from external sources (Git repos, Cloud Storage, Cloud Build repos), creating supply chain attack vectors and code execution risks. | None | None |
| `project` | If it is not provided, the provider project is used. | false | false | Specifies resource ownership/billing scope. Access is already controlled by Google Cloud IAM at the project level. | None | None |
| `include_skaffold_modules` | List of Skaffold modules Cloud Deploy will include in the Skaffold Config as required before performing diagnose. | false | true | Parent block for external module inclusion - inherits security concerns from child blocks. | verified-sources-only | unverified-external-sources |
| `git` |  | false | false | None | None | None |
| `google_cloud_storage` |  | false | false | None | None | None |
| `google_cloud_build_repo` |  | false | false | None | None | None |

### custom_actions Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `render_action` | The Skaffold custom action responsible for render operations. If not provided then Cloud Deploy will perform the render operations via `skaffold render`. | false | true | Can execute arbitrary code during render phase. Should be restricted to approved render actions only. | render-action | unauthorized-render |
| `deploy_action` | The Skaffold custom action responsible for deploy operations. | true | true | Can execute arbitrary code during deploy phase with potentially elevated privileges. Critical security boundary. | deploy-action | unauthorized-deploy |
| `include_skaffold_modules` | List of Skaffold modules Cloud Deploy will include in the Skaffold Config as required before performing diagnose. Structure is [documented below](#nested_custom_actions_include_skaffold_modules). | false | true | Can include external Skaffold configurations that may contain malicious code or reference untrusted sources. | None | None |

### include_skaffold_modules Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `configs` | The Skaffold Config modules to use from the specified source. | false | false | Simple list of configuration names - no direct security impact as it doesn't specify sources. | None | None |
| `git` | Remote git repository containing the Skaffold Config modules. Structure is [documented below](#nested_custom_actions_include_skaffold_modules_include_skaffold_modules_git). | false | true | References external Git repositories which could contain malicious Skaffold configurations or be compromised. | approved-git-repos | unauthorized-git-repos |
| `google_cloud_storage` | Cloud Storage bucket containing Skaffold Config modules. Structure is [documented below](#nested_custom_actions_include_skaffold_modules_include_skaffold_modules_google_cloud_storage). | false | true | References external Cloud Storage buckets which could contain malicious configurations or be compromised. | approved-gcs-buckets | unauthorized-gcs-buckets |
| `google_cloud_build_repo` | Cloud Build 2nd gen repository containing the Skaffold Config modules. Structure is [documented below](#nested_custom_actions_include_skaffold_modules_include_skaffold_modules_google_cloud_build_repo). | false | true | References external Cloud Build repositories which could contain malicious configurations or be compromised. | approved-cloud-build-repos | unauthorized-cloud-build-repos |

### git Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `repo` | Git repository the package should be cloned from. | true | false | None | None | None |
| `path` | Relative path from the repository root to the Skaffold file. | false | false | None | None | None |
| `ref` | Git ref the package should be cloned from. | false | false | None | None | None |

### google_cloud_storage Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `source` | Cloud Storage source paths to copy recursively. For example, providing `gs://my-bucket/dir/configs/*` will result in Skaffold copying all files within the `dir/configs` directory in the bucket `my-bucket`. | true | false | None | None | None |
| `path` | Relative path from the source to the Skaffold file. | false | false | None | None | None |

### google_cloud_build_repo Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `repository` | Cloud Build 2nd gen repository in the format of 'projects/<project>/locations/<location>/connections/<connection>/repositories/<repository>'. | true | false | None | None | None |
| `path` | Relative path from the repository root to the Skaffold file. | false | false | None | None | None |
| `ref` | Branch or tag to use when cloning the repository. | false | false | None | None | None |
