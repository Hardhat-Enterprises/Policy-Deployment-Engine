## 🛡️ Policy Deployment Engine: `network_security_mirroring_endpoint_group`

This section provides a concise policy evaluation for the `network_security_mirroring_endpoint_group` resource in GCP.

Reference: [Terraform Registry – network_security_mirroring_endpoint_group](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/network_security_mirroring_endpoint_group)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `mirroring_deployment_group` | The deployment group that this DIRECT endpoint group is connected to, for example: `projects/123456789/locations/global/mirroringDeploymentGroups/my-dg`. See https://google.aip.dev/124. | true | None | None |
| `location` | The cloud location of the endpoint group, currently restricted to `global`. | true | None | None |
| `mirroring_endpoint_group_id` | The ID to use for the endpoint group, which will become the final component of the endpoint group's resource name. | true | None | None |
| `labels` | Labels are key/value pairs that help to organize and filter resources. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | None | None |
| `description` | User-provided description of the endpoint group. Used as additional context for the endpoint group. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |
