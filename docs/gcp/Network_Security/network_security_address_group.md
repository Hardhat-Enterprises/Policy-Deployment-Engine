## 🛡️ Policy Deployment Engine: `network_security_address_group`

This section provides a concise policy evaluation for the `network_security_address_group` resource in GCP.

Reference: [Terraform Registry – network_security_address_group](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/network_security_address_group)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `type` | The type of the Address Group. Possible values are "IPV4" or "IPV6". Possible values are: `IPV4`, `IPV6`. | true | None | None |
| `capacity` | Capacity of the Address Group. | true | None | None |
| `name` | Name of the AddressGroup resource. | true | None | None |
| `location` | The location of the gateway security policy. The default value is `global`. | true | None | None |
| `description` | Free-text description of the resource. | false | None | None |
| `labels` | Set of label tags associated with the AddressGroup resource. An object containing a list of "key": value pairs. Example: { "name": "wrench", "mass": "1.3kg", "count": "3" }. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | None | None |
| `items` | List of items. | false | None | None |
| `purpose` | , [Beta](https://terraform.io/docs/providers/google/guides/provider_versions.html)) List of supported purposes of the Address Group. Each value may be one of: `DEFAULT`, `CLOUD_ARMOR`. | false | None | None |
| `parent` | The name of the parent this address group belongs to. Format: organizations/{organization_id} or projects/{project_id}. | false | None | None |
