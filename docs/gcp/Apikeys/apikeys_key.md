## 🛡️ Policy Deployment Engine: `apikeys_key`

This section provides a concise policy evaluation for the `apikeys_key` resource in GCP.

Reference: [Terraform Registry – apikeys_key](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/apikeys_key)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `name` | The resource name of the key. The name must be unique within the project, must conform with RFC-1034, is restricted to lower-cased letters, and has a maximum length of 63 characters. In another word, the name must match the regular expression: `[a-z]([a-z0-9-]{0,61}[a-z0-9])?`. - - - | true | false | None | None | None |
| `display_name` | Human-readable display name of this API key. Modifiable by user. | false | false | None | None | None |
| `project` | The project for the resource | false | false | None | None | None |
| `restrictions` | Key restrictions. | false | false | None | None | None |
| `android_key_restrictions` |  | false | false | None | None | None |
| `allowed_applications` |  | false | false | None | None | None |
| `api_targets` |  | false | false | None | None | None |
| `browser_key_restrictions` |  | false | false | None | None | None |
| `ios_key_restrictions` |  | false | false | None | None | None |
| `server_key_restrictions` |  | false | false | None | None | None |

### restrictions Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `android_key_restrictions` | The Android apps that are allowed to use the key. | false | true | API key restrictions limit how and where the key can be used. API keys without restrictions may be abused or used outside their intended context. | At least one restriction block is defined | No restrictions are configured |
| `api_targets` | A restriction for a specific service and optionally one or more specific methods. Requests are allowed if they match any of these restrictions. If no restrictions are specified, all targets are allowed. | false | false | None | None | None |
| `browser_key_restrictions` | The HTTP referrers (websites) that are allowed to use the key. | false | false | None | None | None |
| `ios_key_restrictions` | The iOS apps that are allowed to use the key. | false | false | None | None | None |
| `server_key_restrictions` | The IP addresses of callers that are allowed to use the key. | false | false | None | None | None |

### android_key_restrictions Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `allowed_applications` | A list of Android applications that are allowed to make API calls with this key. | true | false | Restricting Android applications ensures that only trusted mobile apps can use the API key. | None | None |

### allowed_applications Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `package_name` | The package name of the application. | true | false | None | None | None |
| `sha1_fingerprint` | The SHA1 fingerprint of the application. For example, both sha1 formats are acceptable : DA:39:A3:EE:5E:6B:4B:0D:32:55:BF:EF:95:60:18:90:AF:D8:07:09 or DA39A3EE5E6B4B0D3255BFEF95601890AFD80709. Output format is the latter. | true | false | None | None | None |

### api_targets Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `methods` | Optional. List of one or more methods that can be called. If empty, all methods for the service are allowed. A wildcard (*) can be used as the last symbol. Valid examples: `google.cloud.translate.v2.TranslateService.GetSupportedLanguage` `TranslateText` `Get*` `translate.googleapis.com.Get*` | false | true | Allowing wildcard methods significantly increases the attack surface of the API key. | ['TranslateText', 'DetectLanguage'] | ['*'] |
| `service` | The service for this restriction. It should be the canonical service name, for example: `translate.googleapis.com`. You can use `gcloud services list` to get a list of services that are enabled in the project. | true | true | Restricting API targets ensures that the API key can only be used with explicitly approved Google Cloud services. | translate.googleapis.com | * |

### browser_key_restrictions Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `allowed_referrers` | A list of regular expressions for the referrer URLs that are allowed to make API calls with this key. | true | true | Restricting browser referrers prevents unauthorized websites from using the API key. | ['https://example.com'] | ['*'] |

### ios_key_restrictions Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `allowed_bundle_ids` | A list of bundle IDs that are allowed when making API calls with this key. | true | true | Restricting iOS bundle IDs ensures that only trusted iOS applications can use the API key. | None | None |

### server_key_restrictions Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `allowed_ips` | A list of the caller IP addresses that are allowed to make API calls with this key. | true | true | Restricting server IP addresses ensures that only trusted network locations can use the API key. | ['203.0.113.0/24'] | ['0.0.0.0/0'] |
