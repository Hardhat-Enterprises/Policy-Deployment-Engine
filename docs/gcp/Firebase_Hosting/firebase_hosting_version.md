## 🛡️ Policy Deployment Engine: `firebase_hosting_version`

This section provides a concise policy evaluation for the `firebase_hosting_version` resource in GCP.

Reference: [Terraform Registry – firebase_hosting_version](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/firebase_hosting_version)

---

## 1. Argument Reference

### `site_id`
- Description: (Required) Required. The ID of the site in which to create this Version.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `config`
- Description: (Optional) The configuration for the behavior of the site. This configuration exists in the `firebase.json` file. Structure is [documented below](#nested_config). <a name="nested_config"></a>The `config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `rewrites`
- Description: (Optional) An array of objects (called rewrite rules), where each rule specifies a URL pattern that, if matched to the request URL path, triggers Hosting to respond as if the service were given the specified destination URL. Structure is [documented below](#nested_config_rewrites).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `redirects`
- Description: (Optional) An array of objects (called redirect rules), where each rule specifies a URL pattern that, if matched to the request URL path, triggers Hosting to respond with a redirect to the specified destination path. Structure is [documented below](#nested_config_redirects).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `headers`
- Description: (Optional) An array of objects, where each object specifies a URL pattern that, if matched to the request URL path, triggers Hosting to apply the specified custom response headers. Structure is [documented below](#nested_config_headers). <a name="nested_config_rewrites"></a>The `rewrites` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `glob`
- Description: (Optional) The user-supplied glob to match against the request URL path.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `regex`
- Description: (Optional) The user-supplied RE2 regular expression to match against the request URL path.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `path`
- Description: (Optional) The URL path to rewrite the request to.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `function`
- Description: (Optional) The function to proxy requests to. Must match the exported function name exactly.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `run`
- Description: (Optional) The request will be forwarded to Cloud Run. Structure is [documented below](#nested_config_rewrites_rewrites_run). <a name="nested_config_rewrites_rewrites_run"></a>The `run` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `service_id`
- Description: (Required) User-defined ID of the Cloud Run service.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `region`
- Description: (Optional) Optional. User-provided region where the Cloud Run service is hosted. Defaults to `us-central1` if not supplied. <a name="nested_config_redirects"></a>The `redirects` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `glob`
- Description: (Optional) The user-supplied glob to match against the request URL path.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `regex`
- Description: (Optional) The user-supplied RE2 regular expression to match against the request URL path.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `status_code`
- Description: (Required) The status HTTP code to return in the response. It must be a valid 3xx status code.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Required) The value to put in the HTTP location header of the response. The location can contain capture group values from the pattern using a : prefix to identify the segment and an optional * to capture the rest of the URL. For example: ```hcl redirects { glob = "/:capture*" status_code = 302 location = "https://example.com/foo/:capture" } ``` <a name="nested_config_headers"></a>The `headers` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `glob`
- Description: (Optional) The user-supplied glob to match against the request URL path.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `regex`
- Description: (Optional) The user-supplied RE2 regular expression to match against the request URL path.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `headers`
- Description: (Required) The additional headers to add to the response. Example: { "name": "wrench", "mass": "1.3kg", "count": "3" }.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
