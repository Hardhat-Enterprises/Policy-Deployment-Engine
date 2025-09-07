## 🛡️ Policy Deployment Engine: `site_verification_web_resource`

This section provides a concise policy evaluation for the `site_verification_web_resource` resource in GCP.

Reference: [Terraform Registry – site_verification_web_resource](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/site_verification_web_resource)

---

## 1. Argument Reference

### `site`
- Description: (Required) Container for the address and type of a site for which a verification token will be verified. Structure is [documented below](#nested_site).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `verification_method`
- Description: (Required) The verification method for the Site Verification system to use to verify this site or domain. Possible values are: `ANALYTICS`, `DNS_CNAME`, `DNS_TXT`, `FILE`, `META`, `TAG_MANAGER`. <a name="nested_site"></a>The `site` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `type`
- Description: (Required) The type of resource to be verified. Possible values are: `INET_DOMAIN`, `SITE`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `identifier`
- Description: (Required) The site identifier. If the type is set to SITE, the identifier is a URL. If the type is set to INET_DOMAIN, the identifier is a domain name.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
