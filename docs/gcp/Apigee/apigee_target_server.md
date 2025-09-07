## 🛡️ Policy Deployment Engine: `apigee_target_server`

This section provides a concise policy evaluation for the `apigee_target_server` resource in GCP.

Reference: [Terraform Registry – apigee_target_server](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/apigee_target_server)

---

## 1. Argument Reference

### `name`
- Description: (Required) The resource id of this reference. Values must match the regular expression [\w\s-.]+.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `host`
- Description: (Required) The host name this target connects to. Value must be a valid hostname as described by RFC-1123.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `port`
- Description: (Required) The port number this target connects to on the given host. Value must be between 1 and 65535, inclusive.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `env_id`
- Description: (Required) The Apigee environment group associated with the Apigee environment, in the format `organizations/{{org_name}}/environments/{{env_name}}`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) A human-readable description of this TargetServer.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `is_enabled`
- Description: (Optional) Enabling/disabling a TargetServer is useful when TargetServers are used in load balancing configurations, and one or more TargetServers need to taken out of rotation periodically. Defaults to true.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `s_sl_info`
- Description: (Optional) Specifies TLS configuration info for this TargetServer. The JSON name is sSLInfo for legacy/backwards compatibility reasons -- Edge originally supported SSL, and the name is still used for TLS configuration. Structure is [documented below](#nested_s_sl_info).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `protocol`
- Description: (Optional) Immutable. The protocol used by this TargetServer. Possible values are: `HTTP`, `HTTP2`, `GRPC_TARGET`, `GRPC`, `EXTERNAL_CALLOUT`. <a name="nested_s_sl_info"></a>The `s_sl_info` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enabled`
- Description: (Required) Enables TLS. If false, neither one-way nor two-way TLS will be enabled.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `client_auth_enabled`
- Description: (Optional) Enables two-way TLS.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `key_store`
- Description: (Optional) Required if clientAuthEnabled is true. The resource ID of the keystore.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `key_alias`
- Description: (Optional) Required if clientAuthEnabled is true. The resource ID for the alias containing the private key and cert.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `trust_store`
- Description: (Optional) The resource ID of the truststore.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ignore_validation_errors`
- Description: (Optional) If true, Edge ignores TLS certificate errors. Valid when configuring TLS for target servers and target endpoints, and when configuring virtual hosts that use 2-way TLS. When used with a target endpoint/target server, if the backend system uses SNI and returns a cert with a subject Distinguished Name (DN) that does not match the hostname, there is no way to ignore the error and the connection fails.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `protocols`
- Description: (Optional) The TLS versioins to be used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ciphers`
- Description: (Optional) The SSL/TLS cipher suites to be used. For programmable proxies, it must be one of the cipher suite names listed in: http://docs.oracle.com/javase/8/docs/technotes/guides/security/StandardNames.html#ciphersuites. For configurable proxies, it must follow the configuration specified in: https://commondatastorage.googleapis.com/chromium-boringssl-docs/ssl.h.html#Cipher-suite-configuration. This setting has no effect for configurable proxies when negotiating TLS 1.3.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `common_name`
- Description: (Optional) The TLS Common Name of the certificate. Structure is [documented below](#nested_s_sl_info_common_name).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enforce`
- Description: (Optional) If true, TLS is strictly enforced. <a name="nested_s_sl_info_common_name"></a>The `common_name` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `value`
- Description: (Optional) The TLS Common Name string of the certificate.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `wildcard_match`
- Description: (Optional) Indicates whether the cert should be matched against as a wildcard cert.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
