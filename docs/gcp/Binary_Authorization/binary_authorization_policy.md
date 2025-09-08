## 🛡️ Policy Deployment Engine: `binary_authorization_policy`

This section provides a concise policy evaluation for the `binary_authorization_policy` resource in GCP.

Reference: [Terraform Registry – binary_authorization_policy](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/binary_authorization_policy)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `description` | A descriptive comment. | false | None | None |
| `global_policy_evaluation_mode` | Controls the evaluation of a Google-maintained global admission policy for common system-level images. Images not covered by the global policy will be subject to the project admission policy. Possible values are: `ENABLE`, `DISABLE`. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### default_admission_rule Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `evaluation_mode` | How this admission rule will be evaluated. Possible values are: `ALWAYS_ALLOW`, `REQUIRE_ATTESTATION`, `ALWAYS_DENY`. | true | None | None |
| `require_attestations_by` | The resource names of the attestors that must attest to a container image. If the attestor is in a different project from the policy, it should be specified in the format `projects/*/attestors/*`. Each attestor must exist before a policy can reference it. To add an attestor to a policy the principal issuing the policy change request must be able to read the attestor resource. Note: this field must be non-empty when the evaluation_mode field specifies REQUIRE_ATTESTATION, otherwise it must be empty. | false | None | None |
| `enforcement_mode` | The action when a pod creation is denied by the admission rule. Possible values are: `ENFORCED_BLOCK_AND_AUDIT_LOG`, `DRYRUN_AUDIT_LOG_ONLY`. | true | None | None |

### admission_whitelist_patterns Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name_pattern` | An image name pattern to whitelist, in the form `registry/path/to/image`. This supports a trailing * as a wildcard, but this is allowed only in text after the registry/ part. | true | None | None |

### cluster_admission_rules Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `cluster` |  | none | None | None |
| `evaluation_mode` | How this admission rule will be evaluated. Possible values are: `ALWAYS_ALLOW`, `REQUIRE_ATTESTATION`, `ALWAYS_DENY`. | true | None | None |
| `require_attestations_by` | The resource names of the attestors that must attest to a container image. If the attestor is in a different project from the policy, it should be specified in the format `projects/*/attestors/*`. Each attestor must exist before a policy can reference it. To add an attestor to a policy the principal issuing the policy change request must be able to read the attestor resource. Note: this field must be non-empty when the evaluation_mode field specifies REQUIRE_ATTESTATION, otherwise it must be empty. | false | None | None |
| `enforcement_mode` | The action when a pod creation is denied by the admission rule. Possible values are: `ENFORCED_BLOCK_AND_AUDIT_LOG`, `DRYRUN_AUDIT_LOG_ONLY`. | true | None | None |
