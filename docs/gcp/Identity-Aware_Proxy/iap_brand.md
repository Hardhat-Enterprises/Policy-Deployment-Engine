## 🛡️ Policy Deployment Engine: `iap_brand`

This section provides a concise policy evaluation for the `iap_brand` resource in GCP.

Reference: [Terraform Registry – iap_brand](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/iap_brand)

---

## Argument Reference
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `support_email` | Support email displayed on the OAuth consent screen. Can be a user or group email. If a user email is specified, the caller must be that user. If a group email is specified, the caller can be a user or a service account that owns the group in Cloud Identity. | true | true | A corporate mailbox helps users reach the right owner and prevents phishing/confusion from public/vendor addresses. | support_email = "support@example.com" | support_email = "support@gmail.com" / "help@vendor.io" / "support@example.com " |
| `application_title` | Application name shown on the OAuth consent screen. | true | true | A clear, production-ready title sets correct user expectations and avoids confusing/generic test labels. | application_title = "Cloud IAP – Customer Portal" | application_title = "Test" / "Demo" / "My Application" / "Cloud IAP – Customer Portal " |
| `project` | If not provided, the provider project is used. | false | true | Ensures the brand is created in the intended project; mismatches can impact the wrong consent screen. | project = "my-gcp-project" (matches provider context) | project = "other-project" while provider points elsewhere |
