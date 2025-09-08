## 🛡️ Policy Deployment Engine: `compute_network_firewall_policy`

This section provides a concise policy evaluation for the `compute_network_firewall_policy` resource in GCP.

Reference: [Terraform Registry – compute_network_firewall_policy](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_network_firewall_policy)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | User-provided name of the Network firewall policy. The name should be unique in the project in which the firewall policy is created. The name must be 1-63 characters long, and comply with RFC1035. Specifically, the name must be 1-63 characters long and match the regular expression [a-z]([-a-z0-9]*[a-z0-9])? which means the first character must be a lowercase letter, and all following characters must be a dash, lowercase letter, or digit, except the last character, which cannot be a dash. | true | None | None |
| `description` | An optional description of this resource. Provide this property when you create the resource. | false | None | None |
| `policy_type` | , [Beta](https://terraform.io/docs/providers/google/guides/provider_versions.html)) Policy type is used to determine which resources (networks) the policy can be associated with. A policy can be associated with a network only if the network has the matching policyType in its network profile. Different policy types may support some of the Firewall Rules features. Possible values are: `VPC_POLICY`. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |
