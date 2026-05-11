## 🛡️ Policy Deployment Engine: `network_security_gateway_security_policy_rule`

This section provides a concise policy evaluation for the `network_security_gateway_security_policy_rule` resource in GCP.

Reference: [Terraform Registry – network_security_gateway_security_policy_rule](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/network_security_gateway_security_policy_rule)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `enabled` | Whether the rule is enforced. | true | false | None | None | None |
| `priority` | Priority of the rule. Lower number corresponds to higher precedence. | true | false | None | None | None |
| `session_matcher` | CEL expression for matching on session criteria. | true | false | None | None | None |
| `basic_profile` | Profile which tells what the primitive action should be. Possible values are: * ALLOW * DENY. Possible values are: `BASIC_PROFILE_UNSPECIFIED`, `ALLOW`, `DENY`. | true | false | None | None | None |
| `name` | Name of the resource. ame is the full resource name so projects/{project}/locations/{location}/gatewaySecurityPolicies/{gateway_security_policy}/rules/{rule} rule should match the pattern: (^a-z?$). | true | false | None | None | None |
| `location` | The location of the gateway security policy. | true | true | Location must be australia-southeast1. | location = "australia-southeast1" | location = "asia-east1" |
| `gateway_security_policy` | The name of the gatewat security policy this rule belongs to. | true | false | None | None | None |
| `description` | Free-text description of the resource. | false | false | None | None | None |
| `application_matcher` | CEL expression for matching on L7/application level criteria. | false | false | None | None | None |
| `tls_inspection_enabled` | Flag to enable TLS inspection of traffic matching on. Can only be true if the parent GatewaySecurityPolicy references a TLSInspectionConfig. | false | false | None | None | None |
| `project` | If it is not provided, the provider project is used. | false | false | None | None | None |
