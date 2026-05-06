## 🛡️ Policy Deployment Engine: `google_tpu_v2_vm`

This section provides a concise policy evaluation for the `google_tpu_v2_vm` resource in GCP.

Reference: [Terraform Registry – google_tpu_v2_vm](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/tpu_v2_vm)

---

## Argument Reference

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `name` | The immutable name of the TPU. | true | false | None | None | None |
| `runtime_version` | Runtime version for the TPU. | true | false | None | None | None |
| `accelerator_type` | TPU accelerator type for the TPU. If neither accelerator_type nor accelerator_config is specified, accelerator_type defaults to 'v2-8'. | false | false | None | None | None |
| `description` | Text description of the TPU. | false | false | None | None | None |
| `cidr_block` | The CIDR block that the TPU node will use when selecting an IP address. Must be a /29 block. | false | false | None | None | None |
| `zone` | The GCP location for the TPU. If not provided, the provider zone is used. | false | false | None | None | None |
| `project` | The ID of the project in which the resource belongs. If not provided, the provider project is used. | false | false | None | None | None |
| `labels` | Resource labels to represent user-provided metadata. | false | false | None | None | None |
| `metadata` | Custom metadata to apply to the TPU Node. Can set startup-script and shutdown-script. | false | false | None | None | None |
| `tags` | Tags to apply to the TPU Node. Tags are used to identify valid sources or targets for network firewalls. | false | false | None | None | None |
| `network_config` | Network configurations for the TPU node. | false | false | None | None | None |
| `scheduling_config` | The scheduling options for this node. | false | false | None | None | None |
| `data_disks` | The additional data disks for the Node. | false | false | None | None | None |
| `accelerator_config` | The AcceleratorConfig for the TPU Node. Cannot be used at the same time as accelerator_type. | false | false | None | None | None |
| `shielded_instance_config.enable_secure_boot` | Defines whether the instance has Secure Boot enabled. | true | true | Secure Boot protects the TPU VM from boot-level malware and rootkits by verifying the integrity of the boot process. Disabling it leaves the VM vulnerable to low-level attacks that can compromise the entire workload. | `enable_secure_boot = true` | `enable_secure_boot = false` |
| `network_config.enable_external_ips` | Indicates that external IP addresses would be associated with the TPU workers. If set to false, the subnetwork should have Private Google Access enabled. | false | true | Enabling external IPs exposes the TPU VM directly to the public internet, increasing the attack surface. TPU workloads should use internal IPs with Private Google Access enabled to limit exposure. | `enable_external_ips = false` | `enable_external_ips = true` |
| `service_account.email` | Email address of the service account. If empty, default Compute service account will be used. | false | true | Using the default compute service account violates the principle of least privilege by granting excessive permissions to the TPU VM. A dedicated service account with only the required IAM permissions should always be specified. | `email = "tpu-sa@project.iam.gserviceaccount.com"` | `email = ""` |
| `network_config.network` | The name of the network for the TPU node. If none is provided, default will be used. | false | false | None | None | None |
| `network_config.subnetwork` | The name of the subnetwork for the TPU node. If none is provided, default will be used. | false | false | None | None | None |
| `network_config.can_ip_forward` | Allows the TPU node to send and receive packets with non-matching destination or source IPs. | false | false | None | None | None |
| `network_config.queue_count` | Specifies networking queue count for TPU VM instance's network interface. | false | false | None | None | None |
| `scheduling_config.preemptible` | Defines whether the node is preemptible. | false | false | None | None | None |
| `scheduling_config.reserved` | Whether the node is created under a reservation. | false | false | None | None | None |
| `scheduling_config.spot` | Defines whether the node is Spot VM. | false | false | None | None | None |
| `data_disks.source_disk` | Specifies the full path to an existing disk. | true | false | None | None | None |
| `data_disks.mode` | The mode in which to attach this disk. Default is READ_WRITE. | false | false | None | None | None |
| `accelerator_config.type` | Type of TPU accelerator. | true | false | None | None | None |
| `accelerator_config.topology` | Topology of TPU in chips. | true | false | None | None | None |
| `service_account.scope` | The list of scopes to be made available for this service account. If empty, access to all Cloud APIs will be allowed. | false | false | None | None | None |