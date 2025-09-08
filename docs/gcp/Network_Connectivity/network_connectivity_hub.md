## 🛡️ Policy Deployment Engine: `network_connectivity_hub`

This section provides a concise policy evaluation for the `network_connectivity_hub` resource in GCP.

Reference: [Terraform Registry – network_connectivity_hub](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/network_connectivity_hub)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | Immutable. The name of the hub. Hub names must be unique. They use the following form: `projects/{project_number}/locations/global/hubs/{hub_id}` | true | None | None |
| `labels` | Optional labels in key:value format. For more information about labels, see [Requirements for labels](https://cloud.google.com/resource-manager/docs/creating-managing-labels#requirements). **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | None | None |
| `description` | An optional description of the hub. | false | None | None |
| `preset_topology` | Optional. The topology implemented in this hub. Currently, this field is only used when policyMode = PRESET. The available preset topologies are MESH and STAR. If presetTopology is unspecified and policyMode = PRESET, the presetTopology defaults to MESH. When policyMode = CUSTOM, the presetTopology is set to PRESET_TOPOLOGY_UNSPECIFIED. Possible values are: `MESH`, `STAR`. | false | None | None |
| `policy_mode` | Optional. The policy mode of this hub. This field can be either PRESET or CUSTOM. If unspecified, the policyMode defaults to PRESET. Possible values are: `CUSTOM`, `PRESET`. | false | None | None |
| `export_psc` | Whether Private Service Connect transitivity is enabled for the hub. If true, Private Service Connect endpoints in VPC spokes attached to the hub are made accessible to other VPC spokes attached to the hub. The default value is false. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |
