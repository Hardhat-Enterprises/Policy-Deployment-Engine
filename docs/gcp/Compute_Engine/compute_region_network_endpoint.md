## 🛡️ Policy Deployment Engine: `compute_region_network_endpoint`

This section provides a concise policy evaluation for the `compute_region_network_endpoint` resource in GCP.

Reference: [Terraform Registry – compute_region_network_endpoint](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_region_network_endpoint)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `port` | Port number of network endpoint. | true | None | None |
| `region_network_endpoint_group` | The network endpoint group this endpoint is part of. | true | None | None |
| `ip_address` | IPv4 address external endpoint. This can only be specified when network_endpoint_type of the NEG is INTERNET_IP_PORT. | false | None | None |
| `fqdn` | Fully qualified domain name of network endpoint. This can only be specified when network_endpoint_type of the NEG is INTERNET_FQDN_PORT. | false | None | None |
| `client_destination_port` | , [Beta](https://terraform.io/docs/providers/google/guides/provider_versions.html)) Client destination port for the `GCE_VM_IP_PORTMAP` NEG. | false | None | None |
| `instance` | , [Beta](https://terraform.io/docs/providers/google/guides/provider_versions.html)) The name for a specific VM instance that the IP address belongs to. This is required for network endpoints of type GCE_VM_IP_PORTMAP. | false | None | None |
| `region` | Region where the containing network endpoint group is located. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |
