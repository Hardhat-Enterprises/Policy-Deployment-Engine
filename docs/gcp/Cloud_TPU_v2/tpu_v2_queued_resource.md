## 🛡️ Policy Deployment Engine: `google_tpu_v2_queued_resource`

This section provides a concise policy evaluation for the `google_tpu_v2_queued_resource` resource in GCP.

Reference: [Terraform Registry – google_tpu_v2_queued_resource](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_tpu_v2_queued_resource)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `name` | The immutable name of the Queued Resource. | true | false | This argument identifies the Queued Resource and does not directly affect access control, networking, or security posture. | None |  |
| `zone` | The GCP location for the Queued Resource. If it is not provided, the provider zone is used. | false | false | Zone controls where the Queued Resource is deployed. Cloud TPU V2 is not available in Australian regions so no zone restriction policy is enforced. | None |  |
| `project` | If it is not provided, the provider project is used. | false | false | Project identifies where the Queued Resource is created. It is required for resource placement but does not directly define the security behaviour checked by these policies. | None |  |
| `tpu` | Defines a TPU resource. | false | false | This block defines the TPU resource configuration. Security impact is assessed at the nested attribute level. | None |  |
| `tpu.node_spec` | The TPU node being requested. | false | false | This block specifies the TPU node configuration. Security impact is assessed at the nested attribute level. | None |  |
| `node_spec` | The TPU node being requested. | false | false | This block specifies node configuration. Security impact is assessed at the nested attribute level. | None |  |
| `node_spec.parent` | The parent resource name. | true | false | This argument identifies the parent resource location and does not directly affect the security posture of the Queued Resource. | None |  |
| `node_spec.node_id` | Unqualified node identifier used to identify the node in the project once provisioned. | false | false | This argument is used for identification purposes only and does not affect access control or network exposure. | None |  |
| `node_spec.node` | The node configuration. | true | false | This block defines the node settings. Security impact is assessed at the nested attribute level. | None |  |
| `node` | The node configuration block. | false | false | This block defines the TPU node settings. Security impact is assessed at the nested attribute level. | None |  |
| `node.runtime_version` | Runtime version for the TPU. | true | false | This argument controls the TPU runtime version. It may affect compatibility but is not directly used as a security control. | None |  |
| `node.accelerator_type` | TPU accelerator type for the TPU. If not specified, this defaults to 'v2-8'. | false | false | This argument controls TPU hardware capacity and performance rather than the security posture of the Queued Resource. | None |  |
| `node.description` | Text description of the TPU. | false | false | This argument is only descriptive metadata and does not directly affect access control, networking, or security. | None |  |
| `node.network_config` | Network configurations for the TPU node. | false | true | Network configuration controls whether the TPU worker is exposed to the public internet and whether IP forwarding is enabled. Misconfiguration can increase the attack surface. | enable_external_ips = false, can_ip_forward = false |  |
| `network_config` | Network configurations for the TPU node. | false | true | Network configuration controls whether the TPU worker is exposed to the public internet and whether IP forwarding is enabled. Misconfiguration can increase the attack surface. | enable_external_ips = false, can_ip_forward = false |  |
| `network_config.network` | The name of the network for the TPU node. If none is provided, default will be used. | false | false | This argument selects the VPC network. The security impact is mainly determined by exposure settings such as external IPs and IP forwarding, not the network name itself. | None |  |
| `network_config.subnetwork` | The name of the subnetwork for the TPU node. If none is provided, default will be used. | false | false | This argument selects the subnetwork. The security impact is mainly determined by whether external IPs and IP forwarding are enabled. | None |  |
| `network_config.enable_external_ips` | Indicates that external IP addresses would be associated with the TPU workers. If set to false, the subnetwork should have Private Google Access enabled. | false | true | Enabling external IPs exposes the TPU worker directly to the public internet, increasing the attack surface. TPU workloads should use internal IPs with Private Google Access enabled. | enable_external_ips = false |  |
| `network_config.can_ip_forward` | Allows the TPU node to send and receive packets with non-matching destination or source IPs. | false | true | Enabling can_ip_forward allows the TPU node to send and receive packets with non-matching source or destination IPs, which can increase the attack surface by enabling spoofing or unintended routing. | can_ip_forward = false |  |
| `network_config.queue_count` | Specifies networking queue count for TPU VM instance's network interface. | false | false | This argument controls network performance tuning and does not directly affect the security posture of the Queued Resource. | None |  |
