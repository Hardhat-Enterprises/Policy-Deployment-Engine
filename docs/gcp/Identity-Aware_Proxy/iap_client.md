## 🛡️ Policy Deployment Engine: `iap_client`

This section provides a concise policy evaluation for the `iap_client` resource in GCP.

Reference: [Terraform Registry – iap_client](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/iap_client)

---

## Argument Reference
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `display_name` | Human-friendly name shown for the OAuth client. | true | true | Clear, production-ready names reduce user confusion on the consent screen and avoid test/generic labels. | display_name = "Customer Portal OAuth Client" | display_name = "Test" / "Demo" / "App" / "Customer Portal OAuth Client " (trailing space) |
| `brand` | Identifier of the brand this client attaches to. Format: "projects/{project_number}/brands/{brand_id}". | true | true | Ensures the client is tied to the intended brand/project; a wrong or malformed brand can point consent to the wrong tenant. | brand = "projects/123456789012/brands/12345" | brand = "projects/my-project/brands/12345" (uses project ID, not number) / "12345" (missing prefix) / "projects/123456789012/brands/" (empty brand_id) |
