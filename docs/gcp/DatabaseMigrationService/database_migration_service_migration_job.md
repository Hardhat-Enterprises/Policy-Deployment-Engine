## 🛡️ Policy Deployment Engine: `database_migration_service_migration_job`

This section provides a concise policy evaluation for the `database_migration_service_migration_job` resource in GCP.

Reference: [Terraform Registry – database_migration_service_migration_job](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/database_migration_service_migration_job)

---

## 1. Argument Reference

### `type`
- Description: (Required) The type of the migration job. Possible values are: `ONE_TIME`, `CONTINUOUS`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `source`
- Description: (Required) The name of the source connection profile resource in the form of projects/{project}/locations/{location}/connectionProfiles/{sourceConnectionProfile}.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `destination`
- Description: (Required) The name of the destination connection profile resource in the form of projects/{project}/locations/{location}/connectionProfiles/{destinationConnectionProfile}.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `migration_job_id`
- Description: (Required) The ID of the migration job.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `display_name`
- Description: (Optional) The migration job display name.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) The resource labels for migration job to use to annotate any related underlying resources such as Compute Engine VMs. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `dump_flags`
- Description: (Optional) The initial dump flags. Structure is [documented below](#nested_dump_flags).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `performance_config`
- Description: (Optional) Data dump parallelism settings used by the migration. Structure is [documented below](#nested_performance_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `dump_path`
- Description: (Optional) The path to the dump file in Google Cloud Storage, in the format: (gs://[BUCKET_NAME]/[OBJECT_NAME]). This field and the "dump_flags" field are mutually exclusive.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `dump_type`
- Description: (Optional) The type of the data dump. Supported for MySQL to CloudSQL for MySQL migrations only. Possible values are: `LOGICAL`, `PHYSICAL`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `static_ip_connectivity`
- Description: (Optional) If set to an empty object (`{}`), the source database will allow incoming connections from the public IP of the destination database. You can retrieve the public IP of the Cloud SQL instance from the Cloud SQL console or using Cloud SQL APIs.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `reverse_ssh_connectivity`
- Description: (Optional) The details of the VPC network that the source database is located in. Structure is [documented below](#nested_reverse_ssh_connectivity).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `vpc_peering_connectivity`
- Description: (Optional) The details of the VPC network that the source database is located in. Structure is [documented below](#nested_vpc_peering_connectivity).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Optional) The location where the migration job should reside.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_dump_flags"></a>The `dump_flags` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `dump_flags`
- Description: (Optional) A list of dump flags Structure is [documented below](#nested_dump_flags_dump_flags). <a name="nested_dump_flags_dump_flags"></a>The `dump_flags` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Optional) The name of the flag
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `value`
- Description: (Optional) The vale of the flag <a name="nested_performance_config"></a>The `performance_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `dump_parallel_level`
- Description: (Optional) Initial dump parallelism level. Possible values are: `MIN`, `OPTIMAL`, `MAX`. <a name="nested_reverse_ssh_connectivity"></a>The `reverse_ssh_connectivity` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `vm_ip`
- Description: (Optional) The IP of the virtual machine (Compute Engine) used as the bastion server for the SSH tunnel.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `vm_port`
- Description: (Optional) The forwarding port of the virtual machine (Compute Engine) used as the bastion server for the SSH tunnel.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `vm`
- Description: (Optional) The name of the virtual machine (Compute Engine) used as the bastion server for the SSH tunnel.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `vpc`
- Description: (Optional) The name of the VPC to peer with the Cloud SQL private network. <a name="nested_vpc_peering_connectivity"></a>The `vpc_peering_connectivity` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `vpc`
- Description: (Optional) The name of the VPC network to peer with the Cloud SQL private network.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
