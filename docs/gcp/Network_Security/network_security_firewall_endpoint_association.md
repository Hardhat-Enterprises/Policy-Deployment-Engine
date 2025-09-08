## 🛡️ Policy Deployment Engine: `network_security_firewall_endpoint_association`

This section provides a concise policy evaluation for the `network_security_firewall_endpoint_association` resource in GCP.

Reference: [Terraform Registry – network_security_firewall_endpoint_association](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/network_security_firewall_endpoint_association)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `firewall_endpoint` | The URL of the firewall endpoint that is being associated. | true | None | None |
| `network` | The URL of the network that is being associated. | true | None | None |
| `name` | The name of the firewall endpoint association resource. | true | None | None |
| `location` | The location (zone) of the firewall endpoint association. | true | None | None |
| `tls_inspection_policy` | The URL of the TlsInspectionPolicy that is being associated. | false | None | None |
| `labels` | A map of key/value label pairs to assign to the resource. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | None | None |
| `disabled` | Whether the association is disabled. True indicates that traffic will not be intercepted. ~> **Note:** The API will reject the request if this value is set to true when creating the resource, otherwise on an update the association can be disabled. | false | None | None |
| `parent` | The name of the parent this firewall endpoint association belongs to. Format: projects/{project_id}. | false | None | None |
