## 🛡️ Policy Deployment Engine: `edgenetwork_subnet`

This section provides a concise policy evaluation for the `edgenetwork_subnet` resource in GCP.

Reference: [Terraform Registry – edgenetwork_subnet](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/edgenetwork_subnet)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `network` | The ID of the network to which this router belongs. Must be of the form: `projects/{{project}}/locations/{{location}}/zones/{{zone}}/networks/{{network_id}}` | true | None | None |
| `location` | The Google Cloud region to which the target Distributed Cloud Edge zone belongs. | true | None | None |
| `zone` | The name of the target Distributed Cloud Edge zone. | true | None | None |
| `subnet_id` | A unique ID that identifies this subnet. | true | None | None |
| `labels` | Labels associated with this resource. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | None | None |
| `description` | A free-text description of the resource. Max length 1024 characters. | false | None | None |
| `ipv4_cidr` | The ranges of ipv4 addresses that are owned by this subnetwork, in CIDR format. | false | None | None |
| `ipv6_cidr` | The ranges of ipv6 addresses that are owned by this subnetwork, in CIDR format. | false | None | None |
| `vlan_id` | VLAN ID for this subnetwork. If not specified, one is assigned automatically. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |
