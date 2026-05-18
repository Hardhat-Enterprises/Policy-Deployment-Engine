## 🛡️ Policy Deployment Engine: `access_context_manager_access_levels`

This section provides a concise policy evaluation for the `access_context_manager_access_levels` resource in GCP.

Reference: [Terraform Registry – access_context_manager_access_levels](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/access_context_manager_access_levels)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `parent` | The AccessPolicy this AccessLevel lives in. Format: accessPolicies/{policy_id} | true | false | None | None | None |
| `access_levels` | The desired Access Levels that should replace all existing Access Levels in the Access Policy. Structure is [documented below](#nested_access_levels). | false | false | None | None | None |
| `basic` |  | false | false | None | None | None |
| `conditions` |  | false | false | None | None | None |
| `device_policy` |  | false | false | None | None | None |
| `os_constraints` |  | false | false | None | None | None |
| `vpc_network_sources` |  | false | false | None | None | None |
| `vpc_subnetwork` |  | false | false | None | None | None |
| `custom` |  | false | false | None | None | None |
| `expr` |  | false | false | None | None | None |

### access_levels Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `name` | Resource name for the Access Level. The short_name component must begin with a letter and only include alphanumeric and '_'. Format: accessPolicies/{policy_id}/accessLevels/{short_name} | true | false | None | None | None |
| `title` | Human readable title. Must be unique within the Policy. | true | false | None | None | None |
| `description` | Description of the AccessLevel and its use. Does not affect behavior. | false | false | None | None | None |
| `basic` | A set of predefined conditions for the access level and a combining function. Structure is [documented below](#nested_access_levels_access_levels_basic). | false | false | None | None | None |
| `custom` | Custom access level conditions are set using the Cloud Common Expression Language to represent the necessary conditions for the level to apply to a request. See CEL spec at: https://github.com/google/cel-spec. Structure is [documented below](#nested_access_levels_access_levels_custom). | false | false | None | None | None |

### basic Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `combining_function` | How the conditions list should be combined to determine if a request is granted this AccessLevel. If AND is used, each Condition in conditions must be satisfied for the AccessLevel to be applied. If OR is used, at least one Condition in conditions must be satisfied for the AccessLevel to be applied. Default value is `AND`. Possible values are: `AND`, `OR`. | false | false | None | None | None |
| `conditions` | A set of requirements for the AccessLevel to be granted. Structure is [documented below](#nested_access_levels_access_levels_basic_conditions). | true | false | None | None | None |

### conditions Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `ip_subnetworks` | A list of CIDR block IP subnetwork specification. May be IPv4 or IPv6. Note that for a CIDR IP address block, the specified IP address portion must be properly truncated (i.e. all the host bits must be zero) or the input is considered malformed. For example, "192.0.2.0/24" is accepted but "192.0.2.1/24" is not. Similarly, for IPv6, "2001:db8::/32" is accepted whereas "2001:db8::1/32" is not. The originating IP of a request must be in one of the listed subnets in order for this Condition to be true. If empty, all IP addresses are allowed. | false | true | Limits the source of access requests to specific IP blocks. | ['192.168.100.14/24'] | ['10.0.0.0/8'] |
| `required_access_levels` | A list of other access levels defined in the same Policy, referenced by resource name. Referencing an AccessLevel which does not exist is an error. All access levels listed must be granted for the Condition to be true. Format: accessPolicies/{policy_id}/accessLevels/{short_name} | false | true | Ensures compliance with upstream security dependencies. | ['accessPolicies/123456789/accessLevels/base_level'] | ['accessPolicies/123456789/accessLevels/nc'] |
| `members` | An allowed list of members (users, service accounts). Using groups is not supported yet. The signed-in user originating the request must be a part of one of the provided members. If not specified, a request may come from any user (logged in/not logged in, not present in any groups, etc.). Formats: `user:{emailid}`, `serviceAccount:{emailid}` | false | true | Validates that only approved accounts can trigger this access level. | ['user:admin@example.com'] | ['user:hacker@example.com'] |
| `negate` | Whether to negate the Condition. If true, the Condition becomes a NAND over its non-empty fields, each field must be false for the Condition overall to be satisfied. Defaults to false. | false | true | Blocks logic inversion to maintain a positive security model. | ['false'] | ['true'] |
| `device_policy` | Device specific restrictions, all restrictions must hold for the Condition to be true. If not specified, all devices are allowed. Structure is [documented below](#nested_access_levels_access_levels_basic_conditions_conditions_device_policy). | false | false | None | None | None |
| `regions` | The request must originate from one of the provided countries/regions. Format: A valid ISO 3166-1 alpha-2 code. | false | false | None | None | None |
| `vpc_network_sources` | The request must originate from one of the provided VPC networks in Google Cloud. Cannot specify this field together with `ip_subnetworks`. Structure is [documented below](#nested_access_levels_access_levels_basic_conditions_conditions_vpc_network_sources). | false | false | None | None | None |

### device_policy Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `require_screen_lock` | Whether or not screenlock is required for the DevicePolicy to be true. Defaults to false. | false | false | None | None | None |
| `allowed_encryption_statuses` | A list of allowed encryptions statuses. An empty list allows all statuses. Each value may be one of: `ENCRYPTION_UNSPECIFIED`, `ENCRYPTION_UNSUPPORTED`, `UNENCRYPTED`, `ENCRYPTED`. | false | false | None | None | None |
| `allowed_device_management_levels` | A list of allowed device management levels. An empty list allows all management levels. Each value may be one of: `MANAGEMENT_UNSPECIFIED`, `NONE`, `BASIC`, `COMPLETE`. | false | true | Confirms devices are under corporate control before granting access. | ['COMPLETE'] | ['NONE'] |
| `os_constraints` | A list of allowed OS versions. An empty list allows all types and all versions. Structure is [documented below](#nested_access_levels_access_levels_basic_conditions_conditions_device_policy_os_constraints). | false | false | None | None | None |
| `require_admin_approval` | Whether the device needs to be approved by the customer admin. | false | true | Mandates a manual review process for high risk access requests. | ['true'] | ['false'] |
| `require_corp_owned` | Whether the device needs to be corp owned. | false | true | Limits access to company issued hardware to reduce data leak risks. | ['true'] | ['false'] |

### os_constraints Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `minimum_version` | The minimum allowed OS version. If not set, any version of this OS satisfies the constraint. Format: "major.minor.patch" such as "10.5.301", "9.2.1". | false | true | Validates that the endpoint operating system is patched and current. | ['10.0.0'] | ['9.0.0'] |
| `os_type` | The operating system type of the device. Possible values are: `OS_UNSPECIFIED`, `DESKTOP_MAC`, `DESKTOP_WINDOWS`, `DESKTOP_LINUX`, `DESKTOP_CHROME_OS`, `ANDROID`, `IOS`. | true | false | None | None | None |

### vpc_network_sources Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `vpc_subnetwork` | Sub networks within a VPC network. Structure is [documented below](#nested_access_levels_access_levels_basic_conditions_conditions_vpc_network_sources_vpc_network_sources_vpc_subnetwork). | false | false | None | None | None |

### vpc_subnetwork Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `network` | Required. Network name to be allowed by this Access Level. Networks of foreign organizations requires `compute.network.get` permission to be granted to caller. | true | false | None | None | None |
| `vpc_ip_subnetworks` | CIDR block IP subnetwork specification. Must be IPv4. | false | false | None | None | None |

### custom Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `expr` | Represents a textual expression in the Common Expression Language (CEL) syntax. CEL is a C-like expression language. This page details the objects and attributes that are used to the build the CEL expressions for custom access levels - https://cloud.google.com/access-context-manager/docs/custom-access-level-spec. Structure is [documented below](#nested_access_levels_access_levels_custom_expr). | true | false | None | None | None |

### expr Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `expression` | Textual representation of an expression in Common Expression Language syntax. | true | false | None | None | None |
| `title` | Title for the expression, i.e. a short string describing its purpose. | false | false | None | None | None |
| `description` | Description of the expression | false | false | None | None | None |
| `location` | String indicating the location of the expression for error reporting, e.g. a file name and a position in the file | false | false | None | None | None |
