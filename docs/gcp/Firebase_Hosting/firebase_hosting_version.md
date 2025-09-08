## 🛡️ Policy Deployment Engine: `firebase_hosting_version`

This section provides a concise policy evaluation for the `firebase_hosting_version` resource in GCP.

Reference: [Terraform Registry – firebase_hosting_version](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/firebase_hosting_version)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `site_id` | Required. The ID of the site in which to create this Version. | true | None | None |

### config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `rewrites` | An array of objects (called rewrite rules), where each rule specifies a URL pattern that, if matched to the request URL path, triggers Hosting to respond as if the service were given the specified destination URL. Structure is [documented below](#nested_config_rewrites). | false | None | None |
| `redirects` | An array of objects (called redirect rules), where each rule specifies a URL pattern that, if matched to the request URL path, triggers Hosting to respond with a redirect to the specified destination path. Structure is [documented below](#nested_config_redirects). | false | None | None |
| `headers` | An array of objects, where each object specifies a URL pattern that, if matched to the request URL path, triggers Hosting to apply the specified custom response headers. Structure is [documented below](#nested_config_headers). | false | None | None |

### rewrites Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `glob` | The user-supplied glob to match against the request URL path. | false | None | None |
| `regex` | The user-supplied RE2 regular expression to match against the request URL path. | false | None | None |
| `path` | The URL path to rewrite the request to. | false | None | None |
| `function` | The function to proxy requests to. Must match the exported function name exactly. | false | None | None |
| `run` | The request will be forwarded to Cloud Run. Structure is [documented below](#nested_config_rewrites_rewrites_run). | false | None | None |

### run Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `service_id` | User-defined ID of the Cloud Run service. | true | None | None |
| `region` | Optional. User-provided region where the Cloud Run service is hosted. Defaults to `us-central1` if not supplied. | false | None | None |

### redirects Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `glob` | The user-supplied glob to match against the request URL path. | false | None | None |
| `regex` | The user-supplied RE2 regular expression to match against the request URL path. | false | None | None |
| `status_code` | The status HTTP code to return in the response. It must be a valid 3xx status code. | true | None | None |
| `location` | The value to put in the HTTP location header of the response. The location can contain capture group values from the pattern using a : prefix to identify the segment and an optional * to capture the rest of the URL. For example: ```hcl redirects { glob = "/:capture*" status_code = 302 location = "https://example.com/foo/:capture" } ``` | true | None | None |

### headers Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `glob` | The user-supplied glob to match against the request URL path. | false | None | None |
| `regex` | The user-supplied RE2 regular expression to match against the request URL path. | false | None | None |
| `headers` | The additional headers to add to the response. Example: { "name": "wrench", "mass": "1.3kg", "count": "3" }. | true | None | None |
