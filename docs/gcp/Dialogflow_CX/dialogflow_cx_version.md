## 🛡️ Policy Deployment Engine: `dialogflow_cx_version`

This section provides a concise policy evaluation for the `dialogflow_cx_version` resource in GCP.

Reference: [Terraform Registry – dialogflow_cx_version](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/dialogflow_cx_version)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `display_name` | The human-readable name of the version. Limit of 64 characters. | true | None | None |
| `description` | The description of the version. The maximum length is 500 characters. If exceeded, the request is rejected. | false | None | None |
| `parent` | The Flow to create an Version for. Format: projects/<Project ID>/locations/<Location ID>/agents/<Agent ID>/flows/<Flow ID>. | false | None | None |
