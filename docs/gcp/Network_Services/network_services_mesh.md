## 🛡️ Policy Deployment Engine: `network_services_mesh`

This section provides a concise policy evaluation for the `network_services_mesh` resource in GCP.

Reference: [Terraform Registry – network_services_mesh](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/network_services_mesh)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | Short name of the Mesh resource to be created. | true | None | None |
| `labels` | Set of label tags associated with the Mesh resource. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | None | None |
| `description` | A free-text description of the resource. Max length 1024 characters. | false | None | None |
| `interception_port` | Optional. If set to a valid TCP port (1-65535), instructs the SIDECAR proxy to listen on the specified port of localhost (127.0.0.1) address. The SIDECAR proxy will expect all traffic to be redirected to this port regardless of its actual ip:port destination. If unset, a port '15001' is used as the interception port. This will is applicable only for sidecar proxy deployments. | false | None | None |
| `location` | Location (region) of the Mesh resource to be created. Only the value 'global' is currently allowed; defaults to 'global' if omitted. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |
