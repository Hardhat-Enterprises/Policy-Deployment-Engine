## 🛡️ Policy Deployment Engine: `iap_client`

This section provides a concise policy evaluation for the `iap_client` resource in GCP.

Reference: [Terraform Registry – iap_client](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/iap_client)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `display_name` | Human-friendly name given to the OAuth client. | true | None | None |
| `brand` | Identifier of the brand to which this client is attached to. The format is `projects/{project_number}/brands/{brand_id}`. | true | None | None |
