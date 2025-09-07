## 🛡️ Policy Deployment Engine: `kms_ekm_connection`

This section provides a concise policy evaluation for the `kms_ekm_connection` resource in GCP.

Reference: [Terraform Registry – kms_ekm_connection](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/kms_ekm_connection)

---

## 1. Argument Reference

### `name`
- Description: (Required) The resource name for the EkmConnection.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `service_resolvers`
- Description: (Required) A list of ServiceResolvers where the EKM can be reached. There should be one ServiceResolver per EKM replica. Currently, only a single ServiceResolver is supported Structure is [documented below](#nested_service_resolvers).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Required) The location for the EkmConnection. A full list of valid locations can be found by running `gcloud kms locations list`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `key_management_mode`
- Description: (Optional) Optional. Describes who can perform control plane operations on the EKM. If unset, this defaults to MANUAL Default value is `MANUAL`. Possible values are: `MANUAL`, `CLOUD_KMS`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `etag`
- Description: (Optional) Optional. Etag of the currently stored EkmConnection.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `crypto_space_path`
- Description: (Optional) Optional. Identifies the EKM Crypto Space that this EkmConnection maps to. Note: This field is required if KeyManagementMode is CLOUD_KMS.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_service_resolvers"></a>The `service_resolvers` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `service_directory_service`
- Description: (Required) Required. The resource name of the Service Directory service pointing to an EKM replica, in the format projects/*/locations/*/namespaces/*/services/*
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `hostname`
- Description: (Required) Required. The hostname of the EKM replica used at TLS and HTTP layers.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `server_certificates`
- Description: (Required) Required. A list of leaf server certificates used to authenticate HTTPS connections to the EKM replica. Currently, a maximum of 10 Certificate is supported. Structure is [documented below](#nested_service_resolvers_service_resolvers_server_certificates).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `endpoint_filter`
- Description: (Optional) Optional. The filter applied to the endpoints of the resolved service. If no filter is specified, all endpoints will be considered. An endpoint will be chosen arbitrarily from the filtered list for each request. For endpoint filter syntax and examples, see https://cloud.google.com/service-directory/docs/reference/rpc/google.cloud.servicedirectory.v1#resolveservicerequest. <a name="nested_service_resolvers_service_resolvers_server_certificates"></a>The `server_certificates` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `raw_der`
- Description: (Required) Required. The raw certificate bytes in DER format. A base64-encoded string.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `parsed`
- Description: (Output) Output only. True if the certificate was parsed successfully.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `issuer`
- Description: (Output) Output only. The issuer distinguished name in RFC 2253 format. Only present if parsed is true.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `subject`
- Description: (Output) Output only. The subject distinguished name in RFC 2253 format. Only present if parsed is true.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `not_before_time`
- Description: (Output) Output only. The certificate is not valid before this time. Only present if parsed is true. A timestamp in RFC3339 UTC "Zulu" format, with nanosecond resolution and up to nine fractional digits. Examples: "2014-10-02T15:01:23Z" and "2014-10-02T15:01:23.045123456Z".
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `not_after_time`
- Description: (Output) Output only. The certificate is not valid after this time. Only present if parsed is true. A timestamp in RFC3339 UTC "Zulu" format, with nanosecond resolution and up to nine fractional digits. Examples: "2014-10-02T15:01:23Z" and "2014-10-02T15:01:23.045123456Z".
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `sha256_fingerprint`
- Description: (Output) Output only. The SHA-256 certificate fingerprint as a hex string. Only present if parsed is true.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `serial_number`
- Description: (Output) Output only. The certificate serial number as a hex string. Only present if parsed is true.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `subject_alternative_dns_names`
- Description: (Output) Output only. The subject Alternative DNS names. Only present if parsed is true.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
