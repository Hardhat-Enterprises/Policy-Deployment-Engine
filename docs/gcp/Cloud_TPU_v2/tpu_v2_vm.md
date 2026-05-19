## 🛡️ Policy Deployment Engine: `google_tpu_v2_vm`

This section provides a concise policy evaluation for the `google_tpu_v2_vm` resource in GCP.

Reference: [Terraform Registry – google_tpu_v2_vm](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/tpu_v2_vm)

---

## Argument Reference

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `name` | The immutable name of the TPU. | true | false | This argument is used to identify the TPU VM resource and does not directly affect access control, networking, encryption, or VM hardening. | None | None |
| `runtime_version` | Runtime version for the TPU. | true | false | This argument controls the TPU runtime version. It may affect compatibility and workload behaviour, but it is not directly used as a security control in this policy set. | None | None |
| `accelerator_type` | TPU accelerator type for the TPU. If neither accelerator_type nor accelerator_config is specified, accelerator_type defaults to `v2-8`. | false | false | This argument controls TPU hardware capacity and performance. It affects cost and compute capability rather than the security posture of the TPU VM. | None | None |
| `description` | Text description of the TPU. | false | false | This argument is only descriptive metadata and does not directly affect access control, networking, encryption, or VM hardening. | None | None |
| `cidr_block` | The CIDR block that the TPU node will use when selecting an IP address. Must be a `/29` block. | false | false | This argument defines internal IP allocation for the TPU node. It can affect network planning, but by itself it does not expose the TPU VM publicly or weaken the selected security controls. | None | None |
| `zone` | The GCP location for the TPU. If not provided, the provider zone is used. | false | false | Zone controls where the TPU VM is deployed. It may affect availability and data residency decisions, but it is not directly enforced as a security control in this policy set. | None | None |
| `project` | The ID of the project in which the resource belongs. If not provided, the provider project is used. | false | false | Project identifies where the TPU VM is created. It is required for resource placement but does not directly define the security behaviour checked by these policies. | None | None |
| `labels` | Resource labels to represent user-provided metadata. | false | false | Labels are metadata used for organisation, filtering, and cost tracking. They do not directly affect TPU VM security settings. | None | None |
| `metadata` | Custom metadata to apply to the TPU Node. Can set startup-script and shutdown-script. | false | false | Metadata can be operationally important, but no specific metadata security rule is included in this policy set. The current policies focus on external IPs, service account configuration, and Secure Boot. | None | None |
| `tags` | Tags to apply to the TPU Node. Tags are used to identify valid sources or targets for network firewalls. | false | false | Tags can be used with firewall rules, but the tag value itself is not enough to determine security compliance in this policy set. | None | None |
| `network_config` | Network configurations for the TPU node. | false | true | Network configuration can affect whether the TPU VM is exposed externally. External IPs increase the attack surface and should be disabled. | `enable_external_ips = false` | `enable_external_ips = true` |
| `network_configs` | Repeated network configurations for the TPU node. | false | true | The same external IP exposure risk applies whether the user writes `network_config` or `network_configs`. Enabling external IPs exposes the TPU VM directly to the public internet, increasing the attack surface. | `enable_external_ips = false` | `enable_external_ips = true` |
| `service_account` | The Google Cloud Platform Service Account to be used by the TPU node VMs. If None is specified, the default compute service account will be used. | false | true | Using the default compute service account can violate the principle of least privilege by granting excessive permissions to the TPU VM. | `email = "dedicated-sa@project.iam.gserviceaccount.com"` | `email = ""` |
| `scheduling_config` | The scheduling options for this node. | false | false | Scheduling configuration controls how the TPU VM is allocated or reserved. It affects availability and cost more than direct security posture. | None | None |
| `data_disks` | The additional data disks for the Node. | false | false | This argument attaches additional data disks to the TPU VM. It is not included in the current policy set because the selected policies focus on identity, public exposure, and boot integrity. | None | None |
| `accelerator_config` | The AcceleratorConfig for the TPU Node. Cannot be used at the same time as accelerator_type. | false | false | This argument controls TPU accelerator configuration such as type and topology. It affects performance and capacity rather than direct security posture. | None | None |
| `shielded_instance_config` | Shielded Instance options. | false | true | Secure Boot protects the TPU VM from boot-level malware and rootkits by verifying the integrity of the boot process. Disabling it leaves the VM vulnerable to low-level attacks. | `enable_secure_boot = true` | `enable_secure_boot = false` |

### network_config Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `network` | The name of the network for the TPU node. If none is provided, default will be used. | false | false | This argument selects the VPC network for the TPU VM. The current policy focus is on public exposure through external IPs, not the network name itself. | None | None |
| `subnetwork` | The name of the subnetwork for the TPU node. If none is provided, default will be used. | false | false | This argument selects the subnetwork for the TPU VM. It affects placement, but the current policy focus is on whether external IPs are enabled. | None | None |
| `enable_external_ips` | Indicates that external IP addresses would be associated with the TPU workers. If set to false, the subnetwork should have Private Google Access enabled. | false | true | Enabling external IPs exposes the TPU VM directly to the public internet, increasing the attack surface. TPU workloads should use internal IPs with Private Google Access enabled. | `enable_external_ips = false` | `enable_external_ips = true` |
| `can_ip_forward` | Allows the TPU node to send and receive packets with non-matching destination or source IPs. | false | false | This argument affects packet forwarding behaviour, but it is not included in the current policy set because the selected TPU policies focus on external IP exposure, service account configuration, and Secure Boot. | None | None |
| `queue_count` | Specifies networking queue count for TPU VM instance's network interface. | false | false | This argument controls network performance tuning and does not directly affect the TPU VM security posture. | None | None |

### network_configs Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `network` | The name of the network for the TPU node. If none is provided, default will be used. | false | false | This argument selects the VPC network for repeated network configuration and does not directly provide a standalone security control in this policy set. | None | None |
| `subnetwork` | The name of the subnetwork for the TPU node. If none is provided, default will be used. | false | false | This argument selects the subnetwork for repeated network configuration and does not directly provide a standalone security control in this policy set. | None | None |
| `enable_external_ips` | Indicates that external IP addresses would be associated with the TPU workers. If set to false, the subnetwork should have Private Google Access enabled. | false | true | The same external IP exposure risk applies whether the user writes `network_config` or `network_configs`. Enabling external IPs exposes the TPU VM directly to the public internet, increasing the attack surface. | `enable_external_ips = false` | `enable_external_ips = true` |
| `can_ip_forward` | Allows the TPU node to send and receive packets with non-matching destination or source IPs. | false | false | This argument affects routing behaviour, but it is not included as a policy because the current work focuses on stronger direct security controls for TPU VM exposure and identity. | None | None |
| `queue_count` | Specifies networking queue count for TPU VM instance's network interface. | false | false | This argument controls network interface performance tuning and does not directly affect the security posture of the TPU VM. | None | None |

### service_account Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `email` | Email address of the service account. If empty, default Compute service account will be used. | false | true | Using an empty service account email causes the TPU VM to use the default compute service account. A dedicated service account should be used so permissions can be limited to only what the TPU workload requires. | `email = "dedicated-sa@project.iam.gserviceaccount.com"` | `email = ""` |
| `scope` | The list of scopes to be made available for this service account. If empty, access to all Cloud APIs will be allowed. | false | true | If empty, the service account will have access to all Cloud APIs. This directly violates the principle of least privilege. A policy blacklisting an empty scope or whitelisting specific allowed scopes would be meaningful. | `scope = ["https://www.googleapis.com/auth/cloud-platform"]` | `scope = []` |

### scheduling_config Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `preemptible` | Defines whether the node is preemptible. | false | false | This argument affects availability and cost by allowing the TPU VM to be preempted. It does not directly affect access control, network exposure, or VM hardening. | None | None |
| `reserved` | Whether the node is created under a reservation. | false | false | This argument affects resource allocation and capacity planning, not the direct security configuration of the TPU VM. | None | None |
| `spot` | Optional. Defines whether the node is Spot VM. | false | false | This argument affects cost and availability by using Spot VM behaviour. It does not directly affect access control, network exposure, or VM hardening. | None | None |

### data_disks Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `source_disk` | Specifies the full path to an existing disk. | true | false | This argument identifies the disk source. It does not directly change the TPU VM access control, public exposure, or Secure Boot setting. | None | None |
| `mode` | The mode in which to attach this disk. Default is `READ_WRITE`. Possible values are: `READ_WRITE`, `READ_ONLY`. | false | false | Disk mode affects how the attached disk is used, but it is not part of the selected TPU VM security controls for this policy contribution. | None | None |

### shielded_instance_config Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `enable_secure_boot` | Defines whether the instance has Secure Boot enabled. | true | true | Secure Boot protects the TPU VM from boot-level malware and rootkits by verifying the integrity of the boot process. Disabling it leaves the VM vulnerable to low-level attacks. | `enable_secure_boot = true` | `enable_secure_boot = false` |

### accelerator_config Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `type` | Type of TPU. Possible values are: `V2`, `V3`, `V4`. | true | false | This argument defines the TPU accelerator type. It affects workload performance and compatibility, not direct security behaviour. | None | None |
| `topology` | Topology of TPU in chips. | true | false | This argument defines TPU topology and affects compute layout. It does not directly affect access control, network exposure, or VM hardening. | None | None |