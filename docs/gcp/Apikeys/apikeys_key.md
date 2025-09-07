## 🛡️ Policy Deployment Engine: `apikeys_key`

This section provides a concise policy evaluation for the `apikeys_key` resource in GCP.

Reference: [Terraform Registry – apikeys_key](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/apikeys_key)

---

## 1. Argument Reference

### `name`
- Description: (Required) The resource name of the key. The name must be unique within the project, must conform with RFC-1034, is restricted to lower-cased letters, and has a maximum length of 63 characters. In another word, the name must match the regular expression: `[a-z]([a-z0-9-]{0,61}[a-z0-9])?`. - - -
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `display_name`
- Description: (Optional) Human-readable display name of this API key. Modifiable by user.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: (Optional) The project for the resource
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `restrictions`
- Description: (Optional) Key restrictions.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

---

## 2. `restrictions` Block

### `android_key_restrictions`
- Description: (Optional) The Android apps that are allowed to use the key.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `api_targets`
- Description: (Optional) A restriction for a specific service and optionally one or more specific methods. Requests are allowed if they match any of these restrictions. If no restrictions are specified, all targets are allowed.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `browser_key_restrictions`
- Description: (Optional) The HTTP referrers (websites) that are allowed to use the key.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ios_key_restrictions`
- Description: (Optional) The iOS apps that are allowed to use the key.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `server_key_restrictions`
- Description: (Optional) The IP addresses of callers that are allowed to use the key.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

---

## 2. `android_key_restrictions` Block

### `allowed_applications`
- Description: (Required) A list of Android applications that are allowed to make API calls with this key.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

---

## 2. `allowed_applications` Block

### `package_name`
- Description: (Required) The package name of the application.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `sha1_fingerprint`
- Description: (Required) The SHA1 fingerprint of the application. For example, both sha1 formats are acceptable : DA:39:A3:EE:5E:6B:4B:0D:32:55:BF:EF:95:60:18:90:AF:D8:07:09 or DA39A3EE5E6B4B0D3255BFEF95601890AFD80709. Output format is the latter.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

---

## 2. `api_targets` Block

### `methods`
- Description: (Optional) Optional. List of one or more methods that can be called. If empty, all methods for the service are allowed. A wildcard (*) can be used as the last symbol. Valid examples: `google.cloud.translate.v2.TranslateService.GetSupportedLanguage` `TranslateText` `Get*` `translate.googleapis.com.Get*`
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `service`
- Description: (Required) The service for this restriction. It should be the canonical service name, for example: `translate.googleapis.com`. You can use `gcloud services list` to get a list of services that are enabled in the project.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

---

## 2. `browser_key_restrictions` Block

### `allowed_referrers`
- Description: (Required) A list of regular expressions for the referrer URLs that are allowed to make API calls with this key.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

---

## 2. `ios_key_restrictions` Block

### `allowed_bundle_ids`
- Description: (Required) A list of bundle IDs that are allowed when making API calls with this key.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

---

## 2. `server_key_restrictions` Block

### `allowed_ips`
- Description: (Required) A list of the caller IP addresses that are allowed to make API calls with this key.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
