## 🛡️ Policy Deployment Engine: `network_security_gateway_security_policy`

This section provides a concise policy evaluation for the `network_security_gateway_security_policy` resource in GCP.

Reference: [Terraform Registry – network_security_gateway_security_policy](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/network_security_gateway_security_policy)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | Name of the resource. Name is of the form projects/{project}/locations/{location}/gatewaySecurityPolicies/{gatewaySecurityPolicy} gatewaySecurityPolicy should match the pattern:(^a-z?$). | true | None | None |
| `description` | A free-text description of the resource. Max length 1024 characters. | false | None | None |
| `tls_inspection_policy` | Name of a TlsInspectionPolicy resource that defines how TLS inspection is performed for any rule that enables it. | false | None | None |
| `location` | The location of the gateway security policy. The default value is `global`. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |
