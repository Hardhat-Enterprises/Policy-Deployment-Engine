## 🛡️ Policy Deployment Engine: `network_security_mirroring_endpoint_group_association`

This section provides a concise policy evaluation for the `network_security_mirroring_endpoint_group_association` resource in GCP.

Reference: [Terraform Registry – network_security_mirroring_endpoint_group_association](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/network_security_mirroring_endpoint_group_association)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `mirroring_endpoint_group` | The endpoint group that this association is connected to, for example: `projects/123456789/locations/global/mirroringEndpointGroups/my-eg`. See https://google.aip.dev/124. | true | None | None |
| `network` | The VPC network that is associated. for example: `projects/123456789/global/networks/my-network`. See https://google.aip.dev/124. | true | None | None |
| `location` | The cloud location of the association, currently restricted to `global`. | true | None | None |
| `labels` | Labels are key/value pairs that help to organize and filter resources. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | None | None |
| `mirroring_endpoint_group_association_id` | The ID to use for the new association, which will become the final component of the endpoint group's resource name. If not provided, the server will generate a unique ID. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |
