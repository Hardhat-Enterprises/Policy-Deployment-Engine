## 🛡️ Policy Deployment Engine: `developer_connect_insights_config`

This section provides a concise policy evaluation for the `developer_connect_insights_config` resource in GCP.

Reference: [Terraform Registry – developer_connect_insights_config](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/developer_connect_insights_config)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `app_hub_application` | The name of the App Hub Application. Format: projects/{project}/locations/{location}/applications/{application} | true | None | None |
| `location` | Resource ID segment making up resource `name`. It identifies the resource within its parent collection as described in https://google.aip.dev/122. | true | None | None |
| `insights_config_id` | ID of the requesting InsightsConfig. | true | None | None |
| `annotations` | User specified annotations. See https://google.aip.dev/148#annotations for more details such as format and size limitations. **Note**: This field is non-authoritative, and will only manage the annotations present in your configuration. Please refer to the field `effective_annotations` for all of the annotations present on the resource. | false | None | None |
| `labels` | Set of labels associated with an InsightsConfig. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### artifact_configs Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `google_artifact_registry` | Google Artifact Registry configurations. Structure is [documented below](#nested_artifact_configs_artifact_configs_google_artifact_registry). | false | None | None |
| `google_artifact_analysis` | Google Artifact Analysis configurations. Structure is [documented below](#nested_artifact_configs_artifact_configs_google_artifact_analysis). | false | None | None |
| `uri` | The URI of the artifact that is deployed. e.g. `us-docker.pkg.dev/my-project/my-repo/image`. The URI does not include the tag / digest because it captures a lineage of artifacts. | false | None | None |

### google_artifact_registry Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `project_id` | The host project of Artifact Registry. | true | None | None |
| `artifact_registry_package` | The name of the artifact registry package. | true | None | None |

### google_artifact_analysis Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `project_id` | The project id of the project where the provenance is stored. | true | None | None |
