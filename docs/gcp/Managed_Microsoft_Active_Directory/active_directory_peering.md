## 🛡️ Policy Deployment Engine: `active_directory_peering`

This section provides a concise policy evaluation for the `active_directory_peering` resource in GCP.

Reference: [Terraform Registry – active_directory_peering](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/active_directory_peering)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `authorized_network` | The full names of the Google Compute Engine networks to which the instance is connected. Caller needs to make sure that CIDR subnets do not overlap between networks, else peering creation will fail. | true | None | None |
| `domain_resource` | Full domain resource path for the Managed AD Domain involved in peering. The resource path should be in the form projects/{projectId}/locations/global/domains/{domainName} | true | None | None |
| `peering_id` |  | true | None | None |
| `labels` | Resource labels that can contain user-provided metadata **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | None | None |
| `status` | The current state of this Peering. | false | None | None |
| `status_message` | Additional information about the current status of this peering, if available. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |
