## 🛡️ Policy Deployment Engine: `network_security_security_profile_group`

This section provides a concise policy evaluation for the `network_security_security_profile_group` resource in GCP.

Reference: [Terraform Registry – network_security_security_profile_group](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/network_security_security_profile_group)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | The name of the security profile group resource. | true | None | None |
| `description` | An optional description of the profile. The Max length is 512 characters. | false | None | None |
| `labels` | A map of key/value label pairs to assign to the resource. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | None | None |
| `threat_prevention_profile` | Reference to a SecurityProfile with the threat prevention configuration for the SecurityProfileGroup. | false | None | None |
| `custom_mirroring_profile` | Reference to a SecurityProfile with the custom mirroring configuration for the SecurityProfileGroup. | false | None | None |
| `custom_intercept_profile` | Reference to a SecurityProfile with the CustomIntercept configuration. | false | None | None |
| `location` | The location of the security profile group. The default value is `global`. | false | None | None |
| `parent` | The name of the parent this security profile group belongs to. Format: organizations/{organization_id}. | false | None | None |
