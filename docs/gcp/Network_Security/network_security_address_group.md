## 🛡️ Policy Deployment Engine: `network_security_address_group`

This section provides a concise policy evaluation for the `network_security_address_group` resource in GCP.

Reference: [Terraform Registry – network_security_address_group](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/network_security_address_group)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `type` | The type of the Address Group. Possible values are "IPV4" or "IPV6". | true | true | This policy only permits the value "IPV4" for the type attribute. The compliant configuration uses "IPV4", while the non-compliant configuration uses "IPV6". Enforcing IPV4 ensures the address group matches the approved security requirement. | ['"IPV4"'] | ['"IPV6"'] |
| `capacity` | Capacity of the Address Group. | true | false | None | None | None |
| `name` | Name of the AddressGroup resource. | true | false | None | None | None |
| `location` | The location of the gateway security policy. The default value is `global`. | true | false | None | None | None |
| `description` | Free-text description of the resource. | false | false | None | None | None |
| `labels` | Set of label tags associated with the AddressGroup resource. An object containing a list of "key": value pairs. Example: { "name": "wrench", "mass": "1.3kg", "count": "3" }. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | false | None | None | None |
| `items` | List of IP addresses or CIDR ranges allowed in the address group. | false | true | Only the specific CIDR block 10.10.0.1/30 is permitted to enforce strict network access control and minimize attack surface. | ['10.10.0.1/30'] | ['8.8.8.8'] |
| `purpose` | List of supported purposes of the Address Group. Each value may be one of: `DEFAULT`, `CLOUD_ARMOR`. | false | true | Restricting purpose to CLOUD_ARMOR enforces consistent security usage and prevents misconfiguration of address groups in non-secure or unintended contexts. | ['"CLOUD_ARMOR"'] | ['"DEFAULT"'] |
| `parent` | The name of the parent this address group belongs to. Format: organizations/{organization_id} or projects/{project_id}. | false | false | None | None | None |
