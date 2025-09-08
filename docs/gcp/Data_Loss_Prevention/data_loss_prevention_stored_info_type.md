## 🛡️ Policy Deployment Engine: `data_loss_prevention_stored_info_type`

This section provides a concise policy evaluation for the `data_loss_prevention_stored_info_type` resource in GCP.

Reference: [Terraform Registry – data_loss_prevention_stored_info_type](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/data_loss_prevention_stored_info_type)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `parent` | The parent of the info type in any of the following formats: * `projects/{{project}}` * `projects/{{project}}/locations/{{location}}` * `organizations/{{organization_id}}` * `organizations/{{organization_id}}/locations/{{location}}` | true | None | None |
| `description` | A description of the info type. | false | None | None |
| `display_name` | User set display name of the info type. | false | None | None |
| `stored_info_type_id` | The storedInfoType ID can contain uppercase and lowercase letters, numbers, and hyphens; that is, it must match the regular expression: [a-zA-Z\d-_]+. The maximum length is 100 characters. Can be empty to allow the system to generate one. | false | None | None |

### regex Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `pattern` | Pattern defining the regular expression. Its syntax (https://github.com/google/re2/wiki/Syntax) can be found under the google/re2 repository on GitHub. | true | None | None |
| `group_indexes` | The index of the submatch to extract as findings. When not specified, the entire match is returned. No more than 3 may be included. | false | None | None |

### dictionary Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `word_list` | List of words or phrases to search for. Structure is [documented below](#nested_dictionary_word_list). | false | None | None |
| `cloud_storage_path` | Newline-delimited file of words in Cloud Storage. Only a single file is accepted. Structure is [documented below](#nested_dictionary_cloud_storage_path). | false | None | None |

### large_custom_dictionary Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `output_path` | Location to store dictionary artifacts in Google Cloud Storage. These files will only be accessible by project owners and the DLP API. If any of these artifacts are modified, the dictionary is considered invalid and can no longer be used. Structure is [documented below](#nested_large_custom_dictionary_output_path). | true | None | None |
| `cloud_storage_file_set` | Set of files containing newline-delimited lists of dictionary phrases. Structure is [documented below](#nested_large_custom_dictionary_cloud_storage_file_set). | false | None | None |
| `big_query_field` | Field in a BigQuery table where each cell represents a dictionary phrase. Structure is [documented below](#nested_large_custom_dictionary_big_query_field). | false | None | None |

### word_list Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `words` | Words or phrases defining the dictionary. The dictionary must contain at least one phrase and every phrase must contain at least 2 characters that are letters or digits. | true | None | None |

### cloud_storage_path Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `path` | A url representing a file or path (no wildcards) in Cloud Storage. Example: `gs://[BUCKET_NAME]/dictionary.txt` | true | None | None |

### output_path Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `path` | A url representing a file or path (no wildcards) in Cloud Storage. Example: `gs://[BUCKET_NAME]/dictionary.txt` | true | None | None |

### cloud_storage_file_set Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `url` | The url, in the format `gs://<bucket>/<path>`. Trailing wildcard in the path is allowed. | true | None | None |

### big_query_field Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `table` | Field in a BigQuery table where each cell represents a dictionary phrase. Structure is [documented below](#nested_large_custom_dictionary_big_query_field_table). | true | None | None |
| `field` | Designated field in the BigQuery table. Structure is [documented below](#nested_large_custom_dictionary_big_query_field_field). | true | None | None |

### table Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `project_id` | The Google Cloud Platform project ID of the project containing the table. | true | None | None |
| `dataset_id` | The dataset ID of the table. | true | None | None |
| `table_id` | The name of the table. | true | None | None |

### field Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | Name describing the field. | true | None | None |
