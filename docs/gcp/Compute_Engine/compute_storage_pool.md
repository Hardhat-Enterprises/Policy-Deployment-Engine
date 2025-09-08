## 🛡️ Policy Deployment Engine: `compute_storage_pool`

This section provides a concise policy evaluation for the `compute_storage_pool` resource in GCP.

Reference: [Terraform Registry – compute_storage_pool](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_storage_pool)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | Name of the resource. Provided by the client when the resource is created. The name must be 1-63 characters long, and comply with RFC1035. Specifically, the name must be 1-63 characters long and match the regular expression `[a-z]([-a-z0-9]*[a-z0-9])?` which means the first character must be a lowercase letter, and all following characters must be a dash, lowercase letter, or digit, except the last character, which cannot be a dash. | true | None | None |
| `pool_provisioned_capacity_gb` | Size, in GiB, of the storage pool. For more information about the size limits, see https://cloud.google.com/compute/docs/disks/storage-pools. | true | None | None |
| `pool_provisioned_throughput` | Provisioned throughput, in MB/s, of the storage pool. Only relevant if the storage pool type is `hyperdisk-balanced` or `hyperdisk-throughput`. | true | None | None |
| `storage_pool_type` | Type of the storage pool. For example, the following are valid values: * `https://www.googleapis.com/compute/v1/projects/{project_id}/zones/{zone}/storagePoolTypes/hyperdisk-balanced` * `hyperdisk-throughput` | true | None | None |
| `description` | A description of this resource. Provide this property when you create the resource. | false | None | None |
| `pool_provisioned_iops` | Provisioned IOPS of the storage pool. Only relevant if the storage pool type is `hyperdisk-balanced`. | false | None | None |
| `capacity_provisioning_type` | Provisioning type of the byte capacity of the pool. Possible values are: `STANDARD`, `ADVANCED`. | false | None | None |
| `performance_provisioning_type` | Provisioning type of the performance-related parameters of the pool, such as throughput and IOPS. Possible values are: `STANDARD`, `ADVANCED`. | false | None | None |
| `labels` | Labels to apply to this storage pool. These can be later modified by the setLabels method. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | None | None |
| `zone` | A reference to the zone where the storage pool resides. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |
| `deletion_protection` | When the field is set to true or unset in Terraform state, a `terraform apply` or `terraform destroy` that would delete the StoragePool will fail. When the field is set to false, deleting the StoragePool is allowed. | none | None | None |
