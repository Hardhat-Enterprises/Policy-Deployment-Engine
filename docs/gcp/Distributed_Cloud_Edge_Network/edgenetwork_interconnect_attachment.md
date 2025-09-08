## 🛡️ Policy Deployment Engine: `edgenetwork_interconnect_attachment`

This section provides a concise policy evaluation for the `edgenetwork_interconnect_attachment` resource in GCP.

Reference: [Terraform Registry – edgenetwork_interconnect_attachment](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/edgenetwork_interconnect_attachment)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `interconnect` | The ID of the underlying interconnect that this attachment's traffic will traverse through. | true | None | None |
| `network` | The ID of the network to which this interconnect attachment belongs. Must be of the form: `projects/{{project}}/locations/{{location}}/zones/{{zone}}/networks/{{network_id}}` | true | None | None |
| `vlan_id` | VLAN ID provided by user. Must be site-wise unique. | true | None | None |
| `location` | The Google Cloud region to which the target Distributed Cloud Edge zone belongs. | true | None | None |
| `zone` | The name of the target Distributed Cloud Edge zone. | true | None | None |
| `interconnect_attachment_id` | A unique ID that identifies this interconnect attachment. | true | None | None |
| `labels` | Labels associated with this resource. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | None | None |
| `description` | A free-text description of the resource. Max length 1024 characters. | false | None | None |
| `mtu` | IP (L3) MTU value of the virtual edge cloud. Default value is `1500`. Possible values are: `1500`, `9000`. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |
