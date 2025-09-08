## 🛡️ Policy Deployment Engine: `compute_interconnect`

This section provides a concise policy evaluation for the `compute_interconnect` resource in GCP.

Reference: [Terraform Registry – compute_interconnect](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_interconnect)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | Name of the resource. Provided by the client when the resource is created. The name must be 1-63 characters long, and comply with RFC1035. Specifically, the name must be 1-63 characters long and match the regular expression `[a-z]([-a-z0-9]*[a-z0-9])?` which means the first character must be a lowercase letter, and all following characters must be a dash, lowercase letter, or digit, except the last character, which cannot be a dash. | true | None | None |
| `location` | URL of the InterconnectLocation object that represents where this connection is to be provisioned. Specifies the location inside Google's Networks. | true | None | None |
| `link_type` | Type of link requested. Note that this field indicates the speed of each of the links in the bundle, not the speed of the entire bundle. Can take one of the following values: - LINK_TYPE_ETHERNET_10G_LR: A 10G Ethernet with LR optics. - LINK_TYPE_ETHERNET_100G_LR: A 100G Ethernet with LR optics. - LINK_TYPE_ETHERNET_400G_LR4: A 400G Ethernet with LR4 optics Possible values are: `LINK_TYPE_ETHERNET_10G_LR`, `LINK_TYPE_ETHERNET_100G_LR`, `LINK_TYPE_ETHERNET_400G_LR4`. | true | None | None |
| `requested_link_count` | Target number of physical links in the link bundle, as requested by the customer. | true | None | None |
| `interconnect_type` | Type of interconnect. Note that a value IT_PRIVATE has been deprecated in favor of DEDICATED. Can take one of the following values: - PARTNER: A partner-managed interconnection shared between customers though a partner. - DEDICATED: A dedicated physical interconnection with the customer. Possible values are: `DEDICATED`, `PARTNER`, `IT_PRIVATE`. | true | None | None |
| `description` | An optional description of this resource. Provide this property when you create the resource. | false | None | None |
| `admin_enabled` | Administrative status of the interconnect. When this is set to true, the Interconnect is functional and can carry traffic. When set to false, no packets can be carried over the interconnect and no BGP routes are exchanged over it. By default, the status is set to true. | false | None | None |
| `noc_contact_email` | Email address to contact the customer NOC for operations and maintenance notifications regarding this Interconnect. If specified, this will be used for notifications in addition to all other forms described, such as Cloud Monitoring logs alerting and Cloud Notifications. This field is required for users who sign up for Cloud Interconnect using workforce identity federation. | false | None | None |
| `customer_name` | Customer name, to put in the Letter of Authorization as the party authorized to request a crossconnect. This field is required for Dedicated and Partner Interconnect, should not be specified for cross-cloud interconnect. | false | None | None |
| `labels` | Labels for this resource. These can only be added or modified by the setLabels method. Each label key/value pair must comply with RFC1035. Label values may be empty. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | None | None |
| `macsec_enabled` | Enable or disable MACsec on this Interconnect connection. MACsec enablement fails if the MACsec object is not specified. | false | None | None |
| `remote_location` | Indicates that this is a Cross-Cloud Interconnect. This field specifies the location outside of Google's network that the interconnect is connected to. | false | None | None |
| `requested_features` | interconnects.list of features requested for this Interconnect connection. Options: IF_MACSEC ( If specified then the connection is created on MACsec capable hardware ports. If not specified, the default value is false, which allocates non-MACsec capable ports first if available). Note that MACSEC is still technically allowed for compatibility reasons, but it does not work with the API, and will be removed in an upcoming major version. Each value may be one of: `MACSEC`, `CROSS_SITE_NETWORK`, `IF_MACSEC`. | false | None | None |
| `aai_enabled` | , [Beta](https://terraform.io/docs/providers/google/guides/provider_versions.html)) Enable or disable the Application Aware Interconnect(AAI) feature on this interconnect. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### macsec Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `pre_shared_keys` | A keychain placeholder describing a set of named key objects along with their start times. A MACsec CKN/CAK is generated for each key in the key chain. Google router automatically picks the key with the most recent startTime when establishing or re-establishing a MACsec secure link. Structure is [documented below](#nested_macsec_pre_shared_keys). | true | None | None |
| `fail_open` | If set to true, the Interconnect connection is configured with a should-secure MACsec security policy, that allows the Google router to fallback to cleartext traffic if the MKA session cannot be established. By default, the Interconnect connection is configured with a must-secure security policy that drops all traffic if the MKA session cannot be established with your router. | false | None | None |

### application_aware_interconnect Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `profile_description` | , [Beta](https://terraform.io/docs/providers/google/guides/provider_versions.html)) A description for the AAI profile on this interconnect. | false | None | None |
| `strict_priority_policy` | , [Beta](https://terraform.io/docs/providers/google/guides/provider_versions.html)) Specify configuration for StrictPriorityPolicy. | false | None | None |
| `bandwidth_percentage_policy` | , [Beta](https://terraform.io/docs/providers/google/guides/provider_versions.html)) Bandwidth Percentage policy allows you to have granular control over how your Interconnect bandwidth is utilized among your workloads mapping to different traffic classes. Structure is [documented below](#nested_application_aware_interconnect_bandwidth_percentage_policy). | false | None | None |
| `shape_average_percentage` | , [Beta](https://terraform.io/docs/providers/google/guides/provider_versions.html)) Optional field to specify a list of shape average percentages to be applied in conjunction with StrictPriorityPolicy or BandwidthPercentagePolicy Structure is [documented below](#nested_application_aware_interconnect_shape_average_percentage). | false | None | None |

### pre_shared_keys Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | A name for this pre-shared key. The name must be 1-63 characters long, and comply with RFC1035. Specifically, the name must be 1-63 characters long and match the regular expression `[a-z]([-a-z0-9]*[a-z0-9])?` which means the first character must be a lowercase letter, and all following characters must be a dash, lowercase letter, or digit, except the last character, which cannot be a dash. | true | None | None |
| `start_time` | A RFC3339 timestamp on or after which the key is valid. startTime can be in the future. If the keychain has a single key, startTime can be omitted. If the keychain has multiple keys, startTime is mandatory for each key. The start times of keys must be in increasing order. The start times of two consecutive keys must be at least 6 hours apart. | false | None | None |
| `fail_open` | , Deprecated) If set to true, the Interconnect connection is configured with a should-secure MACsec security policy, that allows the Google router to fallback to cleartext traffic if the MKA session cannot be established. By default, the Interconnect connection is configured with a must-secure security policy that drops all traffic if the MKA session cannot be established with your router. ~> **Warning:** `failOpen` is deprecated and will be removed in a future major release. Use other `failOpen` instead. | false | None | None |

### bandwidth_percentage_policy Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `bandwidth_percentage` | , [Beta](https://terraform.io/docs/providers/google/guides/provider_versions.html)) Specify bandwidth percentages for various traffic classes for queuing type Bandwidth Percent. Structure is [documented below](#nested_application_aware_interconnect_bandwidth_percentage_policy_bandwidth_percentage). | false | None | None |

### bandwidth_percentage Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `traffic_class` | , [Beta](https://terraform.io/docs/providers/google/guides/provider_versions.html)) Enum representing the various traffic classes offered by AAI. Default value is `TC_UNSPECIFIED`. Possible values are: `TC_UNSPECIFIED`, `TC1`, `TC2`, `TC3`, `TC4`, `TC5`, `TC6`. | false | None | None |
| `percentage` | , [Beta](https://terraform.io/docs/providers/google/guides/provider_versions.html)) Bandwidth percentage for a specific traffic class. | false | None | None |

### shape_average_percentage Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `traffic_class` | , [Beta](https://terraform.io/docs/providers/google/guides/provider_versions.html)) Enum representing the various traffic classes offered by AAI. Default value is `TC_UNSPECIFIED`. Possible values are: `TC_UNSPECIFIED`, `TC1`, `TC2`, `TC3`, `TC4`, `TC5`, `TC6`. | false | None | None |
| `percentage` | , [Beta](https://terraform.io/docs/providers/google/guides/provider_versions.html)) Bandwidth percentage for a specific traffic class. | false | None | None |
