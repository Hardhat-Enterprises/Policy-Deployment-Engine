## 🛡️ Policy Deployment Engine: `access_context_manager_access_level_condition`

This section provides a concise policy evaluation for the `access_context_manager_access_level_condition` resource in GCP.

Reference: [Terraform Registry – access_context_manager_access_level_condition](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/access_context_manager_access_level_condition)

---

## 1. Argument Reference

### `access_level`
- Description: (Required) The name of the Access Level to add this condition to.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ip_subnetworks`
- Description: (Optional) A list of CIDR block IP subnetwork specification. May be IPv4 or IPv6. Note that for a CIDR IP address block, the specified IP address portion must be properly truncated (i.e. all the host bits must be zero) or the input is considered malformed. For example, "192.0.2.0/24" is accepted but "192.0.2.1/24" is not. Similarly, for IPv6, "2001:db8::/32" is accepted whereas "2001:db8::1/32" is not. The originating IP of a request must be in one of the listed subnets in order for this Condition to be true. If empty, all IP addresses are allowed.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `required_access_levels`
- Description: (Optional) A list of other access levels defined in the same Policy, referenced by resource name. Referencing an AccessLevel which does not exist is an error. All access levels listed must be granted for the Condition to be true. Format: accessPolicies/{policy_id}/accessLevels/{short_name}
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `members`
- Description: (Optional) An allowed list of members (users, service accounts). Using groups is not supported yet. The signed-in user originating the request must be a part of one of the provided members. If not specified, a request may come from any user (logged in/not logged in, not present in any groups, etc.). Formats: `user:{emailid}`, `serviceAccount:{emailid}`
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `negate`
- Description: (Optional) Whether to negate the Condition. If true, the Condition becomes a NAND over its non-empty fields, each field must be false for the Condition overall to be satisfied. Defaults to false.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `device_policy`
- Description: (Optional) Device specific restrictions, all restrictions must hold for the Condition to be true. If not specified, all devices are allowed. Structure is [documented below](#nested_device_policy).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `regions`
- Description: (Optional) The request must originate from one of the provided countries/regions. Format: A valid ISO 3166-1 alpha-2 code.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `vpc_network_sources`
- Description: (Optional) The request must originate from one of the provided VPC networks in Google Cloud. Cannot specify this field together with `ip_subnetworks`. Structure is [documented below](#nested_vpc_network_sources). <a name="nested_device_policy"></a>The `device_policy` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `require_screen_lock`
- Description: (Optional) Whether or not screenlock is required for the DevicePolicy to be true. Defaults to false.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `allowed_encryption_statuses`
- Description: (Optional) A list of allowed encryptions statuses. An empty list allows all statuses. Each value may be one of: `ENCRYPTION_UNSPECIFIED`, `ENCRYPTION_UNSUPPORTED`, `UNENCRYPTED`, `ENCRYPTED`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `allowed_device_management_levels`
- Description: (Optional) A list of allowed device management levels. An empty list allows all management levels. Each value may be one of: `MANAGEMENT_UNSPECIFIED`, `NONE`, `BASIC`, `COMPLETE`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `os_constraints`
- Description: (Optional) A list of allowed OS versions. An empty list allows all types and all versions. Structure is [documented below](#nested_device_policy_os_constraints).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `require_admin_approval`
- Description: (Optional) Whether the device needs to be approved by the customer admin.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `require_corp_owned`
- Description: (Optional) Whether the device needs to be corp owned. <a name="nested_device_policy_os_constraints"></a>The `os_constraints` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `minimum_version`
- Description: (Optional) The minimum allowed OS version. If not set, any version of this OS satisfies the constraint. Format: "major.minor.patch" such as "10.5.301", "9.2.1".
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `os_type`
- Description: (Required) The operating system type of the device. Possible values are: `OS_UNSPECIFIED`, `DESKTOP_MAC`, `DESKTOP_WINDOWS`, `DESKTOP_LINUX`, `DESKTOP_CHROME_OS`, `ANDROID`, `IOS`. <a name="nested_vpc_network_sources"></a>The `vpc_network_sources` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `vpc_subnetwork`
- Description: (Optional) Sub networks within a VPC network. Structure is [documented below](#nested_vpc_network_sources_vpc_network_sources_vpc_subnetwork). <a name="nested_vpc_network_sources_vpc_network_sources_vpc_subnetwork"></a>The `vpc_subnetwork` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `network`
- Description: (Required) Required. Network name to be allowed by this Access Level. Networks of foreign organizations requires `compute.network.get` permission to be granted to caller.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `vpc_ip_subnetworks`
- Description: (Optional) CIDR block IP subnetwork specification. Must be IPv4.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
