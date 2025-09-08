## 🛡️ Policy Deployment Engine: `compute_public_delegated_prefix`

This section provides a concise policy evaluation for the `compute_public_delegated_prefix` resource in GCP.

Reference: [Terraform Registry – compute_public_delegated_prefix](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_public_delegated_prefix)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `region` | A region where the prefix will reside. | true | None | None |
| `name` | Name of the resource. The name must be 1-63 characters long, and comply with RFC1035. Specifically, the name must be 1-63 characters long and match the regular expression `[a-z]([-a-z0-9]*[a-z0-9])?` which means the first character must be a lowercase letter, and all following characters must be a dash, lowercase letter, or digit, except the last character, which cannot be a dash. | true | None | None |
| `parent_prefix` | The URL of parent prefix. Either PublicAdvertisedPrefix or PublicDelegatedPrefix. | true | None | None |
| `ip_cidr_range` | The IP address range, in CIDR format, represented by this public delegated prefix. | true | None | None |
| `description` | An optional description of this resource. | false | None | None |
| `is_live_migration` | If true, the prefix will be live migrated. | false | None | None |
| `mode` | Specifies the mode of this IPv6 PDP. MODE must be one of: DELEGATION, EXTERNAL_IPV6_FORWARDING_RULE_CREATION and EXTERNAL_IPV6_SUBNETWORK_CREATION. Possible values are: `DELEGATION`, `EXTERNAL_IPV6_FORWARDING_RULE_CREATION`, `EXTERNAL_IPV6_SUBNETWORK_CREATION`. | false | None | None |
| `allocatable_prefix_length` | The allocatable prefix length supported by this public delegated prefix. This field is optional and cannot be set for prefixes in DELEGATION mode. It cannot be set for IPv4 prefixes either, and it always defaults to 32. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |
