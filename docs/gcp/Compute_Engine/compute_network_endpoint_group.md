## 🛡️ Policy Deployment Engine: `compute_network_endpoint_group`

This section provides a concise policy evaluation for the `compute_network_endpoint_group` resource in GCP.

Reference: [Terraform Registry – compute_network_endpoint_group](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_network_endpoint_group)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | Name of the resource; provided by the client when the resource is created. The name must be 1-63 characters long, and comply with RFC1035. Specifically, the name must be 1-63 characters long and match the regular expression `[a-z]([-a-z0-9]*[a-z0-9])?` which means the first character must be a lowercase letter, and all following characters must be a dash, lowercase letter, or digit, except the last character, which cannot be a dash. | true | None | None |
| `network` | The network to which all network endpoints in the NEG belong. Uses "default" project network if unspecified. | true | None | None |
| `description` | An optional description of this resource. Provide this property when you create the resource. | false | None | None |
| `network_endpoint_type` | Type of network endpoints in this network endpoint group. NON_GCP_PRIVATE_IP_PORT is used for hybrid connectivity network endpoint groups (see https://cloud.google.com/load-balancing/docs/hybrid). Note that NON_GCP_PRIVATE_IP_PORT can only be used with Backend Services that 1) have the following load balancing schemes: EXTERNAL, EXTERNAL_MANAGED, INTERNAL_MANAGED, and INTERNAL_SELF_MANAGED and 2) support the RATE or CONNECTION balancing modes. Possible values include: GCE_VM_IP, GCE_VM_IP_PORT, NON_GCP_PRIVATE_IP_PORT, INTERNET_IP_PORT, INTERNET_FQDN_PORT, SERVERLESS, and PRIVATE_SERVICE_CONNECT. Default value is `GCE_VM_IP_PORT`. Possible values are: `GCE_VM_IP`, `GCE_VM_IP_PORT`, `NON_GCP_PRIVATE_IP_PORT`, `INTERNET_IP_PORT`, `INTERNET_FQDN_PORT`, `SERVERLESS`, `PRIVATE_SERVICE_CONNECT`. | false | None | None |
| `subnetwork` | Optional subnetwork to which all network endpoints in the NEG belong. | false | None | None |
| `default_port` | The default port used if the port number is not specified in the network endpoint. | false | None | None |
| `zone` | Zone where the network endpoint group is located. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |
