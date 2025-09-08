## 🛡️ Policy Deployment Engine: `edgenetwork_network`

This section provides a concise policy evaluation for the `edgenetwork_network` resource in GCP.

Reference: [Terraform Registry – edgenetwork_network](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/edgenetwork_network)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `location` | The Google Cloud region to which the target Distributed Cloud Edge zone belongs. | true | None | None |
| `zone` | The name of the target Distributed Cloud Edge zone. | true | None | None |
| `network_id` | A unique ID that identifies this network. | true | None | None |
| `labels` | Labels associated with this resource. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | None | None |
| `description` | A free-text description of the resource. Max length 1024 characters. | false | None | None |
| `mtu` | IP (L3) MTU value of the network. Default value is `1500`. Possible values are: `1500`, `9000`. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |
