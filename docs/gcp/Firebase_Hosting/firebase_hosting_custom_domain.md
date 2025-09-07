## 🛡️ Policy Deployment Engine: `firebase_hosting_custom_domain`

This section provides a concise policy evaluation for the `firebase_hosting_custom_domain` resource in GCP.

Reference: [Terraform Registry – firebase_hosting_custom_domain](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/firebase_hosting_custom_domain)

---

## 1. Argument Reference

### `site_id`
- Description: (Required) The ID of the site in which to create this custom domain association.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `custom_domain`
- Description: (Required) The ID of the `CustomDomain`, which is the domain name you'd like to use with Firebase Hosting.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cert_preference`
- Description: (Optional) A field that lets you specify which SSL certificate type Hosting creates for your domain name. Spark plan `CustomDomain`s only have access to the `GROUPED` cert type, while Blaze plan can select any option. Possible values are: `GROUPED`, `PROJECT_GROUPED`, `DEDICATED`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `redirect_target`
- Description: (Optional) A domain name that this CustomDomain should direct traffic towards. If specified, Hosting will respond to requests against this CustomDomain with an HTTP 301 code, and route traffic to the specified `redirect_target` instead.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `wait_dns_verification`
- Description: If false, Terraform will not wait for DNS records on the `CustomDomain`. Any issues in the `CustomDomain` will be returned and stored in the Terraform state.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
