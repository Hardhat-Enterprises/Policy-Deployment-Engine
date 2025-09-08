## 🛡️ Policy Deployment Engine: `iam_workforce_pool`

This section provides a concise policy evaluation for the `iam_workforce_pool` resource in GCP.

Reference: [Terraform Registry – iam_workforce_pool](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/iam_workforce_pool)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `parent` | Immutable. The resource name of the parent. Format: `organizations/{org-id}`. | true | None | None |
| `location` | The location for the resource. | true | None | None |
| `workforce_pool_id` | The name of the pool. The ID must be a globally unique string of 6 to 63 lowercase letters, digits, or hyphens. It must start with a letter, and cannot have a trailing hyphen. The prefix `gcp-` is reserved for use by Google, and may not be specified. | true | None | None |
| `display_name` | A user-specified display name of the pool in Google Cloud Console. Cannot exceed 32 characters. | false | None | None |
| `description` | A user-specified description of the pool. Cannot exceed 256 characters. | false | None | None |
| `disabled` | Whether the pool is disabled. You cannot use a disabled pool to exchange tokens, or use existing tokens to access resources. If the pool is re-enabled, existing tokens grant access again. | false | None | None |
| `session_duration` | Duration that the Google Cloud access tokens, console sign-in sessions, and `gcloud` sign-in sessions from this pool are valid. Must be greater than 15 minutes (900s) and less than 12 hours (43200s). If `sessionDuration` is not configured, minted credentials have a default duration of one hour (3600s). A duration in seconds with up to nine fractional digits, ending with '`s`'. Example: "`3.5s`". | false | None | None |

### access_restrictions Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `allowed_services` | Services allowed for web sign-in with the workforce pool. If not set by default there are no restrictions. Structure is [documented below](#nested_access_restrictions_allowed_services). | false | None | None |
| `disable_programmatic_signin` | Disable programmatic sign-in by disabling token issue via the Security Token API endpoint. See [Security Token Service API](https://cloud.google.com/iam/docs/reference/sts/rest). | false | None | None |

### allowed_services Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `domain` | Domain name of the service. Example: console.cloud.google | false | None | None |
