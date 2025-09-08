## 🛡️ Policy Deployment Engine: `network_security_gateway_security_policy_rule`

This section provides a concise policy evaluation for the `network_security_gateway_security_policy_rule` resource in GCP.

Reference: [Terraform Registry – network_security_gateway_security_policy_rule](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/network_security_gateway_security_policy_rule)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `enabled` | Whether the rule is enforced. | true | None | None |
| `priority` | Priority of the rule. Lower number corresponds to higher precedence. | true | None | None |
| `session_matcher` | CEL expression for matching on session criteria. | true | None | None |
| `basic_profile` | Profile which tells what the primitive action should be. Possible values are: * ALLOW * DENY. Possible values are: `BASIC_PROFILE_UNSPECIFIED`, `ALLOW`, `DENY`. | true | None | None |
| `name` | Name of the resource. ame is the full resource name so projects/{project}/locations/{location}/gatewaySecurityPolicies/{gateway_security_policy}/rules/{rule} rule should match the pattern: (^a-z?$). | true | None | None |
| `location` | The location of the gateway security policy. | true | None | None |
| `gateway_security_policy` | The name of the gatewat security policy this rule belongs to. | true | None | None |
| `description` | Free-text description of the resource. | false | None | None |
| `application_matcher` | CEL expression for matching on L7/application level criteria. | false | None | None |
| `tls_inspection_enabled` | Flag to enable TLS inspection of traffic matching on. Can only be true if the parent GatewaySecurityPolicy references a TLSInspectionConfig. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |
