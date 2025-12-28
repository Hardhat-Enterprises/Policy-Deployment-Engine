## 🛡️ Policy Deployment Engine: `database_migration_service_migration_job`

This section provides a concise policy evaluation for the `database_migration_service_migration_job` resource in GCP.

Reference: [Terraform Registry – database_migration_service_migration_job](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/database_migration_service_migration_job)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `type` | The type of the migration job. Possible values are: `ONE_TIME`, `CONTINUOUS`. | true | true | Migration type impacts how long source databases are exposed. Continuous migrations may carry higher security and cost implications than one-time jobs. | ONE_TIME | CONTINUOUS |
| `source` | The name of the source connection profile resource in the form of projects/{project}/locations/{location}/connectionProfiles/{sourceConnectionProfile}. | true | false | Not Security Related | None | None |
| `destination` | The name of the destination connection profile resource in the form of projects/{project}/locations/{location}/connectionProfiles/{destinationConnectionProfile}. | true | false | Not Security Related | None | None |
| `migration_job_id` | The ID of the migration job. | true | false | Not Security Related | None | None |
| `display_name` | The migration job display name. | false | false | Not Security Related | None | None |
| `labels` | The resource labels for migration job to use to annotate any related underlying resources such as Compute Engine VMs. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | false | Not Security Related | None | None |
| `dump_flags` | The initial dump flags. Structure is [documented below](#nested_dump_flags). | false | false | Not Security Related | None | None |
| `performance_config` | Data dump parallelism settings used by the migration. Structure is [documented below](#nested_performance_config). | false | false | Not Security Related | None | None |
| `dump_path` | The path to the dump file in Google Cloud Storage, in the format: (gs://[BUCKET_NAME]/[OBJECT_NAME]). This field and the "dump_flags" field are mutually exclusive. | false | false | Not Security Related | None | None |
| `dump_type` | The type of the data dump. Supported for MySQL to CloudSQL for MySQL migrations only. Possible values are: `LOGICAL`, `PHYSICAL`. | false | true | Logical dumps preserve schema and allow selective data migration. Physical dumps can include full storage blocks, increasing risk of sensitive data exposure. | LOGICAL | PHYSICAL |
| `static_ip_connectivity` | If set to an empty object (`{}`), the source database will allow incoming connections from the public IP of the destination database. You can retrieve the public IP of the Cloud SQL instance from the Cloud SQL console or using Cloud SQL APIs. | false | true | Static IP connectivity exposes migration traffic over the public internet. Must use SSH or VPC peering instead | Not Configured | Configured |
| `reverse_ssh_connectivity` | The details of the VPC network that the source database is located in. Structure is [documented below](#nested_reverse_ssh_connectivity). | false | true | Reverse SSH provides secure tunneling but must be correctly configured to avoid weak bastion hosts or open VPCs. | Configured | Not Configured |
| `vpc_peering_connectivity` | The details of the VPC network that the source database is located in. Structure is [documented below](#nested_vpc_peering_connectivity). | false | true | VPC peering is the preferred secure method to connect source and destination over private networks, avoiding public exposure. | None | None |
| `location` | The location where the migration job should reside. | false | true | Location determines data residency and compliance scope. | australia-southeast1, australia-southeast2 | US-east1 |
| `project` | If it is not provided, the provider project is used. | false | false | Not Security Related | None | None |

### dump_flags Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `dump_flags` | A list of dump flags Structure is [documented below](#nested_dump_flags_dump_flags). | false | false | None | None | None |
| `name` | The name of the flag | false | false | None | None | None |
| `value` | The vale of the flag | false | false | None | None | None |

### performance_config Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `dump_parallel_level` | Initial dump parallelism level. Possible values are: `MIN`, `OPTIMAL`, `MAX`. | false | false | None | None | None |

### reverse_ssh_connectivity Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `vm_ip` | The IP of the virtual machine (Compute Engine) used as the bastion server for the SSH tunnel. | false | false | Must be setup anyway when reverse_ssh_connectivity is chosen | None | None |
| `vm_port` | The forwarding port of the virtual machine (Compute Engine) used as the bastion server for the SSH tunnel. | false | false | Must be setup anyway when reverse_ssh_connectivity is chosen | None | None |
| `vm` | The name of the virtual machine (Compute Engine) used as the bastion server for the SSH tunnel. | false | false | Must be setup anyway when reverse_ssh_connectivity is chosen | None | None |
| `vpc` | The name of the VPC to peer with the Cloud SQL private network. | false | false | Must be setup anyway when reverse_ssh_connectivity is chosen | None | None |

### vpc_peering_connectivity Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `vpc` | The name of the VPC network to peer with the Cloud SQL private network. | false | true | VPC peering is the preferred secure method to connect source and destination over private networks, avoiding public exposure. | Valid VPC | Not Configured |
