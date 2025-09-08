## 🛡️ Policy Deployment Engine: `apikeys_key`

This section provides a concise policy evaluation for the `apikeys_key` resource in GCP.

Reference: [Terraform Registry – apikeys_key](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/apikeys_key)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | The resource name of the key. The name must be unique within the project, must conform with RFC-1034, is restricted to lower-cased letters, and has a maximum length of 63 characters. In another word, the name must match the regular expression: `[a-z]([a-z0-9-]{0,61}[a-z0-9])?`. - - - | true | None | None |
| `display_name` | Human-readable display name of this API key. Modifiable by user. | false | None | None |
| `project` | The project for the resource | false | None | None |

### restrictions Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `android_key_restrictions` | The Android apps that are allowed to use the key. | false | None | None |
| `api_targets` | A restriction for a specific service and optionally one or more specific methods. Requests are allowed if they match any of these restrictions. If no restrictions are specified, all targets are allowed. | false | None | None |
| `browser_key_restrictions` | The HTTP referrers (websites) that are allowed to use the key. | false | None | None |
| `ios_key_restrictions` | The iOS apps that are allowed to use the key. | false | None | None |
| `server_key_restrictions` | The IP addresses of callers that are allowed to use the key. | false | None | None |

### android_key_restrictions Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `allowed_applications` | A list of Android applications that are allowed to make API calls with this key. | true | None | None |

### allowed_applications Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `package_name` | The package name of the application. | true | None | None |
| `sha1_fingerprint` | The SHA1 fingerprint of the application. For example, both sha1 formats are acceptable : DA:39:A3:EE:5E:6B:4B:0D:32:55:BF:EF:95:60:18:90:AF:D8:07:09 or DA39A3EE5E6B4B0D3255BFEF95601890AFD80709. Output format is the latter. | true | None | None |

### api_targets Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `methods` | Optional. List of one or more methods that can be called. If empty, all methods for the service are allowed. A wildcard (*) can be used as the last symbol. Valid examples: `google.cloud.translate.v2.TranslateService.GetSupportedLanguage` `TranslateText` `Get*` `translate.googleapis.com.Get*` | false | None | None |
| `service` | The service for this restriction. It should be the canonical service name, for example: `translate.googleapis.com`. You can use `gcloud services list` to get a list of services that are enabled in the project. | true | None | None |

### browser_key_restrictions Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `allowed_referrers` | A list of regular expressions for the referrer URLs that are allowed to make API calls with this key. | true | None | None |

### ios_key_restrictions Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `allowed_bundle_ids` | A list of bundle IDs that are allowed when making API calls with this key. | true | None | None |

### server_key_restrictions Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `allowed_ips` | A list of the caller IP addresses that are allowed to make API calls with this key. | true | None | None |
