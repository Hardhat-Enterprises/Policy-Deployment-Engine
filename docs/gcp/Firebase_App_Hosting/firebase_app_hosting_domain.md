## 🛡️ Policy Deployment Engine: `firebase_app_hosting_domain`

This section provides a concise policy evaluation for the `firebase_app_hosting_domain` resource in GCP.

Reference: [Terraform Registry – firebase_app_hosting_domain](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/firebase_app_hosting_domain)

---

## 1. Argument Reference

### `location`
- Description: (Required) The location of the Backend that this Domain is associated with
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `backend`
- Description: (Required) The ID of the Backend that this Domain is associated with
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `domain_id`
- Description: (Required) Id of the domain to create. Must be a valid domain name, such as "foo.com"
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `serve`
- Description: (Optional) The serving behavior of the domain. If specified, the domain will serve content other than its Backend's live content. Structure is [documented below](#nested_serve).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_serve"></a>The `serve` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `redirect`
- Description: (Optional) Specifies redirect behavior for a domain. Structure is [documented below](#nested_serve_redirect). <a name="nested_serve_redirect"></a>The `redirect` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `uri`
- Description: (Required) The URI of the redirect's intended destination. This URI will be prepended to the original request path. URI without a scheme are assumed to be HTTPS.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `status`
- Description: (Optional) The status code to use in a redirect response. Must be a valid HTTP 3XX status code. Defaults to 302 if not present.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
