## 🛡️ Policy Deployment Engine: `google_apikeys_key`

This section provides a concise policy evaluation for the `google_apikeys_key` resource in GCP.

Reference: [Terraform Registry – google_apikeys_key](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_apikeys_key)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `name` | The resource name of the API key. | true | false | None | None | None |
| `display_name` | Human-readable display name of the API key. | false | false | None | None | None |
| `project` | The project that the API key belongs to. | false | false | None | None | None |
| `restrictions` | Restrictions applied to the API key. | false | false | None | None | None |

### restrictions Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `api_targets` | API targets that this API key is allowed to use. | false | false | None | None | None |
| `browser_key_restrictions` | Browser restrictions for the API key. | false | false | None | None | None |
| `server_key_restrictions` | Server restrictions for the API key. | false | false | None | None | None |
| `android_key_restrictions` | Android application restrictions for the API key. | false | false | None | None | None |
| `ios_key_restrictions` | iOS application restrictions for the API key. | false | false | None | None | None |

###   api_targets Block

  | Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
  |----------|-------------|----------|-----------------|-----------|-----------|---------------|
  | `service` | The service that this API key is allowed to call. | true | true | Restricting API targets ensures that the API key can only be used with approved Google Cloud services, reducing the risk of misuse. | ['maps.googleapis.com', 'places.googleapis.com', 'translate.googleapis.com'] | ['*'] |
  | `methods` | The allowed methods for the specified API target. | false | true | Limiting callable methods reduces the attack surface of the API key and prevents unintended API usage. | ['TranslateText', 'DetectLanguage'] | ['*'] |

###   browser_key_restrictions Block

  | Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
  |----------|-------------|----------|-----------------|-----------|-----------|---------------|
  | `allowed_referrers` | Allowed HTTP referrers for browser usage. | false | true | Restricting HTTP referrers prevents unauthorized websites from using the API key. | ['https://example.com'] | ['*'] |

###   server_key_restrictions Block

  | Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
  |----------|-------------|----------|-----------------|-----------|-----------|---------------|
  | `allowed_ips` | Allowed IP addresses for server usage. | false | true | Restricting server IP addresses ensures that only trusted network locations can use the API key. | ['203.0.113.0/24'] | ['0.0.0.0/0'] |

###   android_key_restrictions Block

  | Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
  |----------|-------------|----------|-----------------|-----------|-----------|---------------|
  | `allowed_applications` | Allowed Android applications. | false | false | None | None | None |

###     allowed_applications Block

    | Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
    |----------|-------------|----------|-----------------|-----------|-----------|---------------|
    | `package_name` | The package name of the Android application. | true | true | Restricting Android package names ensures that only trusted mobile applications can use the API key. | com.example.app | * |
    | `sha1_fingerprint` | The SHA1 fingerprint of the Android application certificate. | true | true | Restricting SHA1 fingerprints prevents unauthorised Android applications from using the API key. | AA:BB:CC:DD:EE:FF | * |

###   ios_key_restrictions Block

  | Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
  |----------|-------------|----------|-----------------|-----------|-----------|---------------|
  | `allowed_bundle_ids` | Allowed iOS bundle identifiers. | false | true | Restricting iOS bundle identifiers ensures that only trusted iOS applications can use the API key. | ['com.example.iosapp'] | ['*'] |
