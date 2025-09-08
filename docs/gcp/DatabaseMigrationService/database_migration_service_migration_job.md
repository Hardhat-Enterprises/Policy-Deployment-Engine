## 🛡️ Policy Deployment Engine: `database_migration_service_migration_job`

This section provides a concise policy evaluation for the `database_migration_service_migration_job` resource in GCP.

Reference: [Terraform Registry – database_migration_service_migration_job](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/database_migration_service_migration_job)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `type` | The type of the migration job. Possible values are: `ONE_TIME`, `CONTINUOUS`. | true | None | None |
| `source` | The name of the source connection profile resource in the form of projects/{project}/locations/{location}/connectionProfiles/{sourceConnectionProfile}. | true | None | None |
| `destination` | The name of the destination connection profile resource in the form of projects/{project}/locations/{location}/connectionProfiles/{destinationConnectionProfile}. | true | None | None |
| `migration_job_id` | The ID of the migration job. | true | None | None |
| `display_name` | The migration job display name. | false | None | None |
| `labels` | The resource labels for migration job to use to annotate any related underlying resources such as Compute Engine VMs. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | None | None |
| `dump_path` | The path to the dump file in Google Cloud Storage, in the format: (gs://[BUCKET_NAME]/[OBJECT_NAME]). This field and the "dump_flags" field are mutually exclusive. | false | None | None |
| `dump_type` | The type of the data dump. Supported for MySQL to CloudSQL for MySQL migrations only. Possible values are: `LOGICAL`, `PHYSICAL`. | false | None | None |
| `static_ip_connectivity` | If set to an empty object (`{}`), the source database will allow incoming connections from the public IP of the destination database. You can retrieve the public IP of the Cloud SQL instance from the Cloud SQL console or using Cloud SQL APIs. | false | None | None |
| `location` | The location where the migration job should reside. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### dump_flags Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `dump_flags` | A list of dump flags Structure is [documented below](#nested_dump_flags_dump_flags). | false | None | None |
| `name` | The name of the flag | false | None | None |
| `value` | The vale of the flag | false | None | None |

### performance_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `dump_parallel_level` | Initial dump parallelism level. Possible values are: `MIN`, `OPTIMAL`, `MAX`. | false | None | None |

### reverse_ssh_connectivity Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `vm_ip` | The IP of the virtual machine (Compute Engine) used as the bastion server for the SSH tunnel. | false | None | None |
| `vm_port` | The forwarding port of the virtual machine (Compute Engine) used as the bastion server for the SSH tunnel. | false | None | None |
| `vm` | The name of the virtual machine (Compute Engine) used as the bastion server for the SSH tunnel. | false | None | None |
| `vpc` | The name of the VPC to peer with the Cloud SQL private network. | false | None | None |

### vpc_peering_connectivity Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `vpc` | The name of the VPC network to peer with the Cloud SQL private network. | false | None | None |
