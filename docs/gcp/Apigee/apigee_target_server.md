## 🛡️ Policy Deployment Engine: `apigee_target_server`

This section provides a concise policy evaluation for the `apigee_target_server` resource in GCP.

Reference: [Terraform Registry – apigee_target_server](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/apigee_target_server)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | The resource id of this reference. Values must match the regular expression [\w\s-.]+. | true | None | None |
| `host` | The host name this target connects to. Value must be a valid hostname as described by RFC-1123. | true | None | None |
| `port` | The port number this target connects to on the given host. Value must be between 1 and 65535, inclusive. | true | None | None |
| `env_id` | The Apigee environment group associated with the Apigee environment, in the format `organizations/{{org_name}}/environments/{{env_name}}`. | true | None | None |
| `description` | A human-readable description of this TargetServer. | false | None | None |
| `is_enabled` | Enabling/disabling a TargetServer is useful when TargetServers are used in load balancing configurations, and one or more TargetServers need to taken out of rotation periodically. Defaults to true. | false | None | None |
| `protocol` | Immutable. The protocol used by this TargetServer. Possible values are: `HTTP`, `HTTP2`, `GRPC_TARGET`, `GRPC`, `EXTERNAL_CALLOUT`. | false | None | None |

### s_sl_info Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `enabled` | Enables TLS. If false, neither one-way nor two-way TLS will be enabled. | true | None | None |
| `client_auth_enabled` | Enables two-way TLS. | false | None | None |
| `key_store` | Required if clientAuthEnabled is true. The resource ID of the keystore. | false | None | None |
| `key_alias` | Required if clientAuthEnabled is true. The resource ID for the alias containing the private key and cert. | false | None | None |
| `trust_store` | The resource ID of the truststore. | false | None | None |
| `ignore_validation_errors` | If true, Edge ignores TLS certificate errors. Valid when configuring TLS for target servers and target endpoints, and when configuring virtual hosts that use 2-way TLS. When used with a target endpoint/target server, if the backend system uses SNI and returns a cert with a subject Distinguished Name (DN) that does not match the hostname, there is no way to ignore the error and the connection fails. | false | None | None |
| `protocols` | The TLS versioins to be used. | false | None | None |
| `ciphers` | The SSL/TLS cipher suites to be used. For programmable proxies, it must be one of the cipher suite names listed in: http://docs.oracle.com/javase/8/docs/technotes/guides/security/StandardNames.html#ciphersuites. For configurable proxies, it must follow the configuration specified in: https://commondatastorage.googleapis.com/chromium-boringssl-docs/ssl.h.html#Cipher-suite-configuration. This setting has no effect for configurable proxies when negotiating TLS 1.3. | false | None | None |
| `common_name` | The TLS Common Name of the certificate. Structure is [documented below](#nested_s_sl_info_common_name). | false | None | None |
| `enforce` | If true, TLS is strictly enforced. | false | None | None |

### common_name Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `value` | The TLS Common Name string of the certificate. | false | None | None |
| `wildcard_match` | Indicates whether the cert should be matched against as a wildcard cert. | false | None | None |
