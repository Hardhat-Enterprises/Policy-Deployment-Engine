## 🛡️ Policy Deployment Engine: `compute_network_edge_security_service`

This section provides a concise policy evaluation for the `compute_network_edge_security_service` resource in GCP.

Reference: [Terraform Registry – compute_network_edge_security_service](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_network_edge_security_service)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | Name of the resource. Provided by the client when the resource is created. | true | None | None |
| `description` | Free-text description of the resource. | false | None | None |
| `security_policy` | The resource URL for the network edge security service associated with this network edge security service. | false | None | None |
| `region` | The region of the gateway security policy. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |
