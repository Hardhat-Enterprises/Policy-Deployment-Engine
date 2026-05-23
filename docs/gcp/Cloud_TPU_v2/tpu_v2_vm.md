## 🛡️ Policy Deployment Engine: `tpu_v2_vm`

This section provides a concise policy evaluation for the `tpu_v2_vm` resource in GCP.

Reference: [Terraform Registry – tpu_v2_vm](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/tpu_v2_vm)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `name` | The immutable name of the TPU. | true | false | This argument is used to identify the TPU VM resource and does not directly affect access control, networking, encryption, or VM hardening. | None | None |
| `runtime_version` | Runtime version for the TPU. | true | false | This argument controls the TPU runtime version. It may affect compatibility and workload behaviour, but it is not directly used as a security control in this policy set. | None | None |
| `accelerator_type` | TPU accelerator type for the TPU. `accelerator_type` cannot be used at the same time as `accelerator_config`. If neither is specified, `accelerator_type` defaults to 'v2-8'. | false | false | This argument controls TPU hardware capacity and performance. It affects cost and compute capability rather than the security posture of the TPU VM. | None | None |
| `description` | Text description of the TPU. | false | false | This argument is only descriptive metadata and does not directly affect access control, networking, encryption, or VM hardening. | None | None |
| `cidr_block` | The CIDR block that the TPU node will use when selecting an IP address. This CIDR block must be a /29 block; the Compute Engine networks API forbids a smaller block, and using a larger block would be wasteful (a node can only consume one IP address). Errors will occur if the CIDR block has already been used for a currently existing TPU node, the CIDR block conflicts with any subnetworks in the user's provided network, or the provided network is peered with another network that is using that CIDR block. | false | false | This argument defines internal IP allocation for the TPU node. It can affect network planning, but by itself it does not expose the TPU VM publicly or weaken the selected security controls. | None | None |
| `network_config` | Network configurations for the TPU node. Structure is [documented below](#nested_network_config). | false | true | Network configuration can affect whether the TPU VM is exposed externally. External IPs increase the attack surface and should be disabled. | enable_external_ips = false | enable_external_ips = true |
| `network_configs` | Repeated network configurations for the TPU node. This field is used to specify multiple network configs for the TPU node. Structure is [documented below](#nested_network_configs). | false | true | The same external IP exposure risk applies whether the user writes network_config or network_configs. Enabling external IPs exposes the TPU VM directly to the public internet, increasing the attack surface. | enable_external_ips = false | enable_external_ips = true |
| `service_account` | The Google Cloud Platform Service Account to be used by the TPU node VMs. If None is specified, the default compute service account will be used. Structure is [documented below](#nested_service_account). | false | true | Using the default compute service account can violate the principle of least privilege by granting excessive permissions to the TPU VM. | email = "dedicated-sa@project.iam.gserviceaccount.com" | email = "" |
| `scheduling_config` | The scheduling options for this node. Structure is [documented below](#nested_scheduling_config). | false | false | Scheduling configuration controls how the TPU VM is allocated or reserved. It affects availability and cost more than direct security posture. | None | None |
| `data_disks` | The additional data disks for the Node. Structure is [documented below](#nested_data_disks). | false | false | This argument attaches additional data disks to the TPU VM. It is not included in the current policy set because the selected policies focus on identity, public exposure, and boot integrity. | None | None |
| `shielded_instance_config` | Shielded Instance options. Structure is [documented below](#nested_shielded_instance_config). | false | true | Secure Boot protects the TPU VM from boot-level malware and rootkits by verifying the integrity of the boot process. Disabling it leaves the VM vulnerable to low-level attacks. | enable_secure_boot = true | enable_secure_boot = false |
| `accelerator_config` | The AccleratorConfig for the TPU Node. `accelerator_config` cannot be used at the same time as `accelerator_type`. If neither is specified, `accelerator_type` defaults to 'v2-8'. Structure is [documented below](#nested_accelerator_config). | false | false | This argument controls TPU accelerator configuration such as type and topology. It affects performance and capacity rather than direct security posture. | None | None |
| `labels` | Resource labels to represent user-provided metadata. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | false | Labels are metadata used for organisation, filtering, and cost tracking. They do not directly affect TPU VM security settings. | None | None |
| `metadata` | Custom metadata to apply to the TPU Node. Can set startup-script and shutdown-script. | false | false | Metadata can be operationally important, but no specific metadata security rule is included in this policy set. The current policies focus on external IPs, repeated network external IPs, service account configuration, service account scope, and Secure Boot. | None | None |
| `tags` | Tags to apply to the TPU Node. Tags are used to identify valid sources or targets for network firewalls. | false | false | Tags can be used with firewall rules, but the tag value itself is not enough to determine security compliance in this policy set. | None | None |
| `zone` | The GCP location for the TPU. If it is not provided, the provider zone is used. | false | false | Zone controls where the TPU VM is deployed. Cloud TPU V2 is not available in Australian regions so no zone restriction policy is enforced. | None | None |
| `project` | If it is not provided, the provider project is used. | false | false | Project identifies where the TPU VM is created. It is required for resource placement but does not directly define the security behaviour checked by these policies. | None | None |

### network_config Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `network` | The name of the network for the TPU node. It must be a preexisting Google Compute Engine network. If none is provided, "default" will be used. | false | false | This argument selects the VPC network for the TPU VM. The current policy focus is on public exposure through external IPs, not the network name itself. | None | None |
| `subnetwork` | The name of the subnetwork for the TPU node. It must be a preexisting Google Compute Engine subnetwork. If none is provided, "default" will be used. | false | false | This argument selects the subnetwork for the TPU VM. It affects placement, but the current policy focus is on whether external IPs are enabled. | None | None |
| `enable_external_ips` | Indicates that external IP addresses would be associated with the TPU workers. If set to false, the specified subnetwork or network should have Private Google Access enabled. | false | true | Enabling external IPs exposes the TPU VM directly to the public internet, increasing the attack surface. TPU workloads should use internal IPs with Private Google Access enabled. | enable_external_ips = false | enable_external_ips = true |
| `can_ip_forward` | Allows the TPU node to send and receive packets with non-matching destination or source IPs. This is required if you plan to use the TPU workers to forward routes. | false | false | This argument affects packet forwarding behaviour, but it is not included in the current TPU VM policy set because the selected policies focus on external IP exposure, repeated network external IPs, service account scope, service account email, and Secure Boot. | None | None |
| `queue_count` | Specifies networking queue count for TPU VM instance's network interface. | false | false | This argument controls network performance tuning and does not directly affect the TPU VM security posture. | None | None |

### network_configs Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `network` | The name of the network for the TPU node. It must be a preexisting Google Compute Engine network. If none is provided, "default" will be used. | false | false | This argument selects the VPC network for repeated network configuration and does not directly provide a standalone security control in this policy set. | None | None |
| `subnetwork` | The name of the subnetwork for the TPU node. It must be a preexisting Google Compute Engine subnetwork. If none is provided, "default" will be used. | false | false | This argument selects the subnetwork for repeated network configuration and does not directly provide a standalone security control in this policy set. | None | None |
| `enable_external_ips` | Indicates that external IP addresses would be associated with the TPU workers. If set to false, the specified subnetwork or network should have Private Google Access enabled. | false | true | The same external IP exposure risk applies whether the user writes network_config or network_configs. Enabling external IPs exposes the TPU VM directly to the public internet, increasing the attack surface. | enable_external_ips = false | enable_external_ips = true |
| `can_ip_forward` | Allows the TPU node to send and receive packets with non-matching destination or source IPs. This is required if you plan to use the TPU workers to forward routes. | false | false | This argument affects routing behaviour, but it is not included as a policy because the current work focuses on stronger direct security controls for TPU VM public exposure and identity. | None | None |
| `queue_count` | Specifies networking queue count for TPU VM instance's network interface. | false | false | This argument controls network interface performance tuning and does not directly affect the security posture of the TPU VM. | None | None |

### service_account Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `email` | Email address of the service account. If empty, default Compute service account will be used. | false | true | Using an empty service account email causes the TPU VM to use the default compute service account. A dedicated service account should be used so permissions can be limited to only what the TPU workload requires. | email = "dedicated-sa@project.iam.gserviceaccount.com" | email = "" |
| `scope` | The list of scopes to be made available for this service account. If empty, access to all Cloud APIs will be allowed. | false | true | If empty, the service account will have access to all Cloud APIs. This directly violates the principle of least privilege. A policy blacklisting an empty scope or whitelisting specific allowed scopes is meaningful. | scope = ["https://www.googleapis.com/auth/devstorage.read_only"] | scope = [] |

### scheduling_config Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `preemptible` | Defines whether the node is preemptible. | false | false | This argument affects availability and cost by allowing the TPU VM to be preempted. It does not directly affect access control, network exposure, or VM hardening. | None | None |
| `reserved` | Whether the node is created under a reservation. | false | false | This argument affects resource allocation and capacity planning, not the direct security configuration of the TPU VM. | None | None |
| `spot` | Optional. Defines whether the node is Spot VM. | false | false | This argument affects cost and availability by using Spot VM behaviour. It does not directly affect access control, network exposure, or VM hardening. | None | None |

### data_disks Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `source_disk` | Specifies the full path to an existing disk. For example: "projects/my-project/zones/us-central1-c/disks/my-disk". | true | false | This argument identifies the disk source. It does not directly change the TPU VM access control, public exposure, or Secure Boot setting. | None | None |
| `mode` | The mode in which to attach this disk. If not specified, the default is READ_WRITE mode. Only applicable to dataDisks. Default value is `READ_WRITE`. Possible values are: `READ_WRITE`, `READ_ONLY`. | false | false | Disk mode affects how the attached disk is used, but it is not part of the selected TPU VM security controls for this policy contribution. | None | None |

### shielded_instance_config Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `enable_secure_boot` | Defines whether the instance has Secure Boot enabled. | true | true | Secure Boot protects the TPU VM from boot-level malware and rootkits by verifying the integrity of the boot process. Disabling it leaves the VM vulnerable to low-level attacks. | enable_secure_boot = true | enable_secure_boot = false |

### accelerator_config Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `type` | Type of TPU. Please select one of the allowed types: https://cloud.google.com/tpu/docs/reference/rest/v2/AcceleratorConfig#Type | true | false | This argument defines the TPU accelerator type. It affects workload performance and compatibility, not direct security behaviour. | None | None |
| `topology` | Topology of TPU in chips. | true | false | This argument defines TPU topology and affects compute layout. It does not directly affect access control, network exposure, or VM hardening. | None | None |
