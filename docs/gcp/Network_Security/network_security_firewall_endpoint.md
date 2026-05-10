## 🛡️ Policy Deployment Engine: `network_security_firewall_endpoint`

This section provides a concise policy evaluation for the `network_security_firewall_endpoint` resource in GCP.

Reference: [Terraform Registry – network_security_firewall_endpoint](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/network_security_firewall_endpoint)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `billing_project_id` | Project to bill on endpoint uptime usage. | true | false | None | None | None |
| `name` | The name of the firewall endpoint resource. | true | false | None | None | None |
| `location` | The location (zone) of the firewall endpoint. | true | false | None | None | None |
| `parent` | The name of the parent this firewall endpoint belongs to. Format: organizations/{organization_id}. | true | false | None | None | None |
| `labels` | A map of key/value label pairs to assign to the resource. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | false | None | None | None |
