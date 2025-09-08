## 🛡️ Policy Deployment Engine: `cloudbuild_worker_pool`

This section provides a concise policy evaluation for the `cloudbuild_worker_pool` resource in GCP.

Reference: [Terraform Registry – cloudbuild_worker_pool](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloudbuild_worker_pool)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `location` | The location for the resource | true | None | None |
| `name` | User-defined name of the `WorkerPool`. - - - | true | None | None |
| `project` | The project for the resource | false | None | None |

### network_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `peered_network` | Immutable. The network definition that the workers are peered to. If this section is left empty, the workers will be peered to `WorkerPool.project_id` on the service producer network. Must be in the format `projects/{project}/global/networks/{network}`, where `{project}` is a project number, such as `12345`, and `{network}` is the name of a VPC network in the project. See (https://cloud.google.com/cloud-build/docs/custom-workers/set-up-custom-worker-pool-environment#understanding_the_network_configuration_options) | true | None | None |
| `peered_network_ip_range` | Immutable. Subnet IP range within the peered network. This is specified in CIDR notation with a slash and the subnet prefix size. You can optionally specify an IP address before the subnet prefix value. e.g. `192.168.0.0/29` would specify an IP range starting at 192.168.0.0 with a prefix size of 29 bits. `/16` would specify a prefix size of 16 bits, with an automatically determined IP within the peered VPC. If unspecified, a value of `/24` will be used. | false | None | None |

### worker_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `disk_size_gb` | Size of the disk attached to the worker, in GB. See [diskSizeGb](https://cloud.google.com/build/docs/private-pools/private-pool-config-file-schema#disksizegb). Specify a value of up to 1000. If `0` is specified, Cloud Build will use a standard disk size. | false | None | None |
| `machine_type` | Machine type of a worker, such as `n1-standard-1`. See [machineType](https://cloud.google.com/build/docs/private-pools/private-pool-config-file-schema#machinetype). If left blank, Cloud Build will use `n1-standard-1`. | false | None | None |
| `no_external_ip` | If true, workers are created without any public address, which prevents network egress to public IPs. | false | None | None |
