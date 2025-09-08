## 🛡️ Policy Deployment Engine: `compute_global_network_endpoint`

This section provides a concise policy evaluation for the `compute_global_network_endpoint` resource in GCP.

Reference: [Terraform Registry – compute_global_network_endpoint](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_global_network_endpoint)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `port` | Port number of the external endpoint. | true | None | None |
| `global_network_endpoint_group` | The global network endpoint group this endpoint is part of. | true | None | None |
| `ip_address` | IPv4 address external endpoint. | false | None | None |
| `fqdn` | Fully qualified domain name of network endpoint. This can only be specified when network_endpoint_type of the NEG is INTERNET_FQDN_PORT. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |
