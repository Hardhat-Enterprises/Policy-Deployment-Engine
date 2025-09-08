## 🛡️ Policy Deployment Engine: `tpu_node`

This section provides a concise policy evaluation for the `tpu_node` resource in GCP.

Reference: [Terraform Registry – tpu_node](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/tpu_node)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | The immutable name of the TPU. | true | None | None |
| `accelerator_type` | The type of hardware accelerators associated with this node. | true | None | None |
| `tensorflow_version` | The version of Tensorflow running in the Node. | true | None | None |
| `description` | The user-supplied description of the TPU. Maximum of 512 characters. | false | None | None |
| `network` | The name of a network to peer the TPU node to. It must be a preexisting Compute Engine network inside of the project on which this API has been activated. If none is provided, "default" will be used. | false | None | None |
| `cidr_block` | The CIDR block that the TPU node will use when selecting an IP address. This CIDR block must be a /29 block; the Compute Engine networks API forbids a smaller block, and using a larger block would be wasteful (a node can only consume one IP address). Errors will occur if the CIDR block has already been used for a currently existing TPU node, the CIDR block conflicts with any subnetworks in the user's provided network, or the provided network is peered with another network that is using that CIDR block. | false | None | None |
| `use_service_networking` | Whether the VPC peering for the node is set up through Service Networking API. The VPC Peering should be set up before provisioning the node. If this field is set, cidr_block field should not be specified. If the network that you want to peer the TPU Node to is a Shared VPC network, the node must be created with this this field enabled. | false | None | None |
| `labels` | Resource labels to represent user provided metadata. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | None | None |
| `zone` | The GCP location for the TPU. If it is not provided, the provider zone is used. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### scheduling_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `preemptible` | Defines whether the TPU instance is preemptible. | true | None | None |
