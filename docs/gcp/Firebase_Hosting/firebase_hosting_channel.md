## 🛡️ Policy Deployment Engine: `firebase_hosting_channel`

This section provides a concise policy evaluation for the `firebase_hosting_channel` resource in GCP.

Reference: [Terraform Registry – firebase_hosting_channel](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/firebase_hosting_channel)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `site_id` | Required. The ID of the site in which to create this channel. | true | None | None |
| `channel_id` | Required. Immutable. A unique ID within the site that identifies the channel. | true | None | None |
| `retained_release_count` | The number of previous releases to retain on the channel for rollback or other purposes. Must be a number between 1-100. Defaults to 10 for new channels. | false | None | None |
| `labels` | Text labels used for extra metadata and/or filtering **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | None | None |
| `expire_time` | The time at which the channel will be automatically deleted. If null, the channel will not be automatically deleted. This field is present in the output whether it's set directly or via the `ttl` field. | false | None | None |
| `ttl` | Input only. A time-to-live for this channel. Sets `expire_time` to the provided duration past the time of the request. A duration in seconds with up to nine fractional digits, terminated by 's'. Example: "86400s" (one day). | false | None | None |
