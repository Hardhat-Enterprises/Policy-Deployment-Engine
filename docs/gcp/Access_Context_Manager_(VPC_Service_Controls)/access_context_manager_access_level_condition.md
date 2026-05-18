## 🛡️ Policy Deployment Engine: `access_context_manager_access_level_condition`

This section provides a concise policy evaluation for the `access_context_manager_access_level_condition` resource in GCP.

Reference: [Terraform Registry – access_context_manager_access_level_condition](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/access_context_manager_access_level_condition)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `access_level` | The name of the Access Level to add this condition to. | true | false | None | None | None |
| `ip_subnetworks` | A list of CIDR block IP subnetwork specification. May be IPv4 or IPv6. Note that for a CIDR IP address block, the specified IP address portion must be properly truncated (i.e. all the host bits must be zero) or the input is considered malformed. For example, "192.0.2.0/24" is accepted but "192.0.2.1/24" is not. Similarly, for IPv6, "2001:db8::/32" is accepted whereas "2001:db8::1/32" is not. The originating IP of a request must be in one of the listed subnets in order for this Condition to be true. If empty, all IP addresses are allowed. | false | true | Restricts access requests to authorized IP ranges to prevent unauthorized remote entry | ['192.168.1.0/24', '10.0.0.0/8', '8.8.8.8/32'] | ['172.16.0.0/12', '0.0.0.0/0', '1.1.1.1/32'] |
| `required_access_levels` | A list of other access levels defined in the same Policy, referenced by resource name. Referencing an AccessLevel which does not exist is an error. All access levels listed must be granted for the Condition to be true. Format: accessPolicies/{policy_id}/accessLevels/{short_name} | false | true | Mandates compliance with prerequisite access levels. | ['accessPolicies/123456789/accessLevels/base_level'] | ['accessPolicies/123456789/accessLevels/nc'] |
| `members` | An allowed list of members (users, service accounts). Using groups is not supported yet. The signed-in user originating the request must be a part of one of the provided members. If not specified, a request may come from any user (logged in/not logged in, not present in any groups, etc.). Formats: `user:{emailid}`, `serviceAccount:{emailid}` | false | true | Restricts access to a specific list of approved identities. | ['user:admin@example.com'] | ['user:hacker@example.com'] |
| `negate` | Whether to negate the Condition. If true, the Condition becomes a NAND over its non-empty fields, each field must be false for the Condition overall to be satisfied. Defaults to false. | false | true | Prevents logic inversion that could cause unintended broad access. | [False] | [True] |
| `device_policy` | Device specific restrictions, all restrictions must hold for the Condition to be true. If not specified, all devices are allowed. Structure is [documented below](#nested_device_policy). | false | false | None | None | None |
| `regions` | The request must originate from one of the provided countries/regions. Format: A valid ISO 3166-1 alpha-2 code. | false | false | None | None | None |
| `vpc_network_sources` | The request must originate from one of the provided VPC networks in Google Cloud. Cannot specify this field together with `ip_subnetworks`. Structure is [documented below](#nested_vpc_network_sources). | false | false | None | None | None |
| `os_constraints` |  | false | false | None | None | None |
| `vpc_subnetwork` |  | false | false | None | None | None |

### device_policy Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `require_screen_lock` | Whether or not screenlock is required for the DevicePolicy to be true. Defaults to false. | false | false | None | None | None |
| `allowed_encryption_statuses` | A list of allowed encryptions statuses. An empty list allows all statuses. Each value may be one of: `ENCRYPTION_UNSPECIFIED`, `ENCRYPTION_UNSUPPORTED`, `UNENCRYPTED`, `ENCRYPTED`. | false | true | Requires active device disk encryption to prevent physical data leaks. | ['ENCRYPTED'] | ['UNENCRYPTED', 'ENCRYPTION_UNSPECIFIED'] |
| `allowed_device_management_levels` | A list of allowed device management levels. An empty list allows all management levels. Each value may be one of: `MANAGEMENT_UNSPECIFIED`, `NONE`, `BASIC`, `COMPLETE`. | false | true | Ensures devices meet required management security tiers like COMPLETE | ['COMPLETE'] | ['NONE'] |
| `os_constraints` | A list of allowed OS versions. An empty list allows all types and all versions. Structure is [documented below](#nested_device_policy_os_constraints). | false | false | None | None | None |
| `require_admin_approval` | Whether the device needs to be approved by the customer admin. | false | false | None | None | None |
| `require_corp_owned` | Whether the device needs to be corp owned. | false | false | None | None | None |

### vpc_network_sources Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `vpc_subnetwork` | Sub networks within a VPC network. Structure is [documented below](#nested_vpc_network_sources_vpc_network_sources_vpc_subnetwork). | false | false | None | None | None |

### os_constraints Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `minimum_version` | The minimum allowed OS version. If not set, any version of this OS satisfies the constraint. Format: "major.minor.patch" such as "10.5.301", "9.2.1". | false | true | Enforces a baseline operating system version for endpoint security. | ['10.0.0'] | ['9.0.0'] |
| `os_type` | The operating system type of the device. Possible values are: `OS_UNSPECIFIED`, `DESKTOP_MAC`, `DESKTOP_WINDOWS`, `DESKTOP_LINUX`, `DESKTOP_CHROME_OS`, `ANDROID`, `IOS`. | true | false | None | None | None |

### vpc_subnetwork Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `network` | Required. Network name to be allowed by this Access Level. Networks of foreign organizations requires `compute.network.get` permission to be granted to caller. | true | false | None | None | None |
| `vpc_ip_subnetworks` | CIDR block IP subnetwork specification. Must be IPv4. | false | false | None | None | None |
