## 🛡️ Policy Deployment Engine: `firebase_hosting_custom_domain`

This section provides a concise policy evaluation for the `firebase_hosting_custom_domain` resource in GCP.

Reference: [Terraform Registry – firebase_hosting_custom_domain](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/firebase_hosting_custom_domain)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `site_id` | The ID of the site in which to create this custom domain association. | true | None | None |
| `custom_domain` | The ID of the `CustomDomain`, which is the domain name you'd like to use with Firebase Hosting. | true | None | None |
| `cert_preference` | A field that lets you specify which SSL certificate type Hosting creates for your domain name. Spark plan `CustomDomain`s only have access to the `GROUPED` cert type, while Blaze plan can select any option. Possible values are: `GROUPED`, `PROJECT_GROUPED`, `DEDICATED`. | false | None | None |
| `redirect_target` | A domain name that this CustomDomain should direct traffic towards. If specified, Hosting will respond to requests against this CustomDomain with an HTTP 301 code, and route traffic to the specified `redirect_target` instead. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |
| `wait_dns_verification` | If false, Terraform will not wait for DNS records on the `CustomDomain`. Any issues in the `CustomDomain` will be returned and stored in the Terraform state. | none | None | None |
