## 🛡️ Policy Deployment Engine: `firebase_hosting_site`

This section provides a concise policy evaluation for the `firebase_hosting_site` resource in GCP.

Reference: [Terraform Registry – firebase_hosting_site](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/firebase_hosting_site)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `app_id` | Optional. The [ID of a Web App](https://firebase.google.com/docs/reference/firebase-management/rest/v1beta1/projects.webApps#WebApp.FIELDS.app_id) associated with the Hosting site. | false | None | None |
| `site_id` | Required. Immutable. A globally unique identifier for the Hosting site. This identifier is used to construct the Firebase-provisioned subdomains for the site, so it must also be a valid domain name label. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |
