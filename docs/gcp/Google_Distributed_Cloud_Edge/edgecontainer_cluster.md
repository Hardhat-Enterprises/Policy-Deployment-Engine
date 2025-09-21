## 🛡️ Policy Deployment Engine: `edgecontainer_cluster`

This section provides a concise policy evaluation for the `edgecontainer_cluster` resource in GCP.

Reference: [Terraform Registry – edgecontainer_cluster](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/edgecontainer_cluster)

---

## Argument Reference
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `fleet` | Fleet related configuration. Fleets are a Google Cloud concept for logically organizing clusters, letting you use and manage multi-cluster capabilities and apply consistent policies across your systems. | true | true | Proper fleet configuration ensures clusters are organized in a secure and manageable way with consistent policy enforcement. | Properly formatted project reference using project number | Hardcoded project numbers or incorrect formatting |
| `networking` | Network configuration for the cluster including CIDR blocks for pods and services. | true | true | Proper network segmentation prevents unauthorized access and contains potential security breaches. | Properly scoped RFC1918 CIDR blocks | Overly permissive CIDR ranges (0.0.0.0/0) |
| `authorization` | RBAC policy that will be applied and managed by GEC. | true | true | Proper RBAC configuration ensures only authorized users have administrative access to the cluster. | Authorized admin users with proper email addresses | Unauthorized or invalid admin email addresses |
| `location` | The location of the resource. | true | true | Location selection impacts data residency, latency, and compliance with regional regulations. | australia-southeast1 | Unapproved or restricted regions |
| `name` | The GDCE cluster name. | true | false | Cluster name is an identifier and doesn't directly impact security. | None | None |
| `labels` | User-defined labels for the edgecloud cluster. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | true | Proper labeling ensures resources can be properly identified, tracked, and managed according to organizational policies. | Contains required labels: owner, environment, cost-center | Missing required labels or using non-standard label names |
| `default_max_pods_per_node` | The default maximum number of pods per node used if a maximum value is not specified explicitly for a node pool in this cluster. If unspecified, the Kubernetes default value will be used. | false | true | Excessive pods per node can lead to resource contention and reduced security isolation between workloads. | 30 | 110 (exceeds reasonable limits) |
| `maintenance_policy` | Cluster-wide maintenance policy configuration. | false | true | Proper maintenance windows ensure cluster updates occur during approved times with minimal business impact. | Defined maintenance window with proper recurrence pattern | No maintenance policy configured |
| `control_plane` | The configuration of the cluster control plane. | false | true | Control plane configuration impacts cluster stability, performance, and security isolation. | Properly configured control plane with appropriate node count and location | Misconfigured or insecure control plane settings |
| `system_addons_config` | Config that customers are allowed to define for GDCE system add-ons. | false | true | System addons configuration impacts cluster functionality and security posture. | Properly configured addons with secure settings | Misconfigured or insecure addon settings |
| `external_load_balancer_ipv4_address_pools` | Address pools for cluster data plane external load balancing. | false | true | Load balancer address pools should use properly scoped IP ranges to prevent unauthorized access. | Proper RFC1918 address ranges | Overly permissive or public IP ranges |
| `control_plane_encryption` | Remote control plane disk encryption options. This field is only used when enabling CMEK support. | false | true | Control plane encryption protects sensitive cluster data at rest and should use customer-managed keys when required. | Properly configured customer-managed encryption keys | Missing encryption or misconfigured KMS keys |
| `target_version` | The target cluster version. For example: "1.5.0". | false | true | Cluster version should be kept current to ensure security patches and bug fixes are applied. | 1.5.0 (current supported version) | 1.0.0 (outdated version with potential vulnerabilities) |
| `release_channel` | The release channel a cluster is subscribed to. Possible values are: `RELEASE_CHANNEL_UNSPECIFIED`, `NONE`, `REGULAR`. | false | true | Release channel selection impacts stability and security update frequency. | REGULAR (balanced stability and updates) | NONE (no automatic security updates) |
| `project` | If it is not provided, the provider project is used. | false | true | Project selection impacts resource isolation, billing, and access controls. | Proper project reference | Incorrect or unauthorized project |
| `admin_users` | Administrative users configuration for the cluster. | false | true | Admin users should be properly authorized individuals with valid organizational credentials. | Authorized organizational email addresses | Unauthorized or invalid email addresses |
| `window` | Maintenance window configuration. | false | true | Proper maintenance windows ensure updates occur during approved times with minimal business impact. | Properly configured maintenance window | Missing or improperly configured window |
| `recurring_window` | Recurring maintenance window configuration. | false | true | Proper recurring window configuration ensures maintenance occurs predictably and during approved times. | Properly configured window with recurrence | Missing or improperly configured recurrence |
| `maintenance_exclusions` | Maintenance exclusion configuration. | false | true | Maintenance exclusions prevent updates during critical business periods but should be used judiciously. | Properly defined exclusions with unique IDs | Excessive or improperly configured exclusions |
| `remote` | Remote control plane configuration. | false | true | Remote control plane configuration impacts where control plane components run and their network accessibility. | Properly configured remote control plane in approved locations | Misconfigured or unapproved remote control plane settings |
| `local` | Local control plane configuration. | false | true | Local control plane configuration impacts high availability, resource isolation, and security boundaries. | Properly configured local control plane with appropriate security settings | Misconfigured or insecure local control plane settings |
| `ingress` | Ingress add-on configuration for external access to cluster services. | false | true | Ingress configuration controls external access to cluster services and significantly impacts the cluster's security posture. | Properly secured ingress configuration | Misconfigured or overly permissive ingress settings |

### fleet Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `project` | The name of the Fleet host project where this cluster will be registered. Project names are formatted as `projects/<project-number>`. | true | true | Correct project reference format ensures proper cluster registration and management within the intended fleet. | projects/1234567890 | projects/gdce-dev (using project ID instead of number) |
| `membership` | (Output) The name of the managed Hub Membership resource associated to this cluster. Membership names are formatted as `projects/<project-number>/locations/global/membership/<cluster-id>`. | false | false | Output-only field used for tracking cluster membership, no security impact. | None | None |

### networking Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `cluster_ipv4_cidr_blocks` | All pods in the cluster are assigned an RFC1918 IPv4 address from these blocks. Only a single block is supported. This field cannot be changed after creation. | true | true | Properly scoped CIDR blocks prevent overly permissive network access between pods. | 10.0.0.0/16 | 0.0.0.0/0 |
| `services_ipv4_cidr_blocks` | All services in the cluster are assigned an RFC1918 IPv4 address from these blocks. Only a single block is supported. This field cannot be changed after creation. | true | true | Properly scoped CIDR blocks prevent overly permissive network access to services. | 10.1.0.0/16 | 0.0.0.0/0 |
| `cluster_ipv6_cidr_blocks` | If specified, dual stack mode is enabled and all pods in the cluster are assigned an IPv6 address from these blocks alongside from an IPv4 address. Only a single block is supported. This field cannot be changed after creation. | false | true | IPv6 CIDR blocks should follow proper network segmentation principles similar to IPv4. | 2001:db8::/32 | ::/0 |
| `services_ipv6_cidr_blocks` | If specified, dual stack mode is enabled and all services in the cluster are assigned an IPv6 address from these blocks alongside from an IPv4 address. Only a single block is supported. This field cannot be changed after creation. | false | true | IPv6 service CIDR blocks should follow proper network segmentation principles. | 2001:db8:1::/48 | ::/0 |
| `network_type` | (Output) IP addressing type of this cluster i.e. SINGLESTACK_V4 vs DUALSTACK_V4_V6. | false | false | Output-only field indicating network configuration type, no security impact. | None | None |

### authorization Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `admin_users` | User that will be granted the cluster-admin role on the cluster, providing full access to the cluster. Currently, this is a singular field, but will be expanded to allow multiple admins in the future. | true | true | Admin users should be properly vetted and authorized individuals with valid organizational email addresses. | authorized.user@company.com | invalid@example.com |

### maintenance_policy Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `window` | Specifies the maintenance window in which maintenance may be performed. | true | true | Maintenance windows should be scheduled during low-usage periods with proper recurrence patterns. | Properly configured recurring window | Missing or improperly configured window |
| `maintenance_exclusions` | Exclusions to automatic maintenance. Non-emergency maintenance should not occur in these windows. Each exclusion has a unique name and may be active or expired. The max number of maintenance exclusions allowed at a given time is 3. | false | true | Maintenance exclusions prevent updates during critical business periods but should be used judiciously. | Properly defined exclusions with unique IDs | Excessive or improperly configured exclusions |

###   window Block
  | Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
  |----------|-------------|----------|-----------------|-----------|-----------|---------------|
  | `recurring_window` | Represents an arbitrary window of time that recurs. | true | true | Recurring windows provide predictable maintenance schedules that can be planned around. | Properly configured recurrence pattern | Missing or invalid recurrence pattern |

###   maintenance_exclusions Block
  | Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
  |----------|-------------|----------|-----------------|-----------|-----------|---------------|
  | `id` | A unique (per cluster) id for the window. | false | true | Unique IDs ensure proper tracking and management of maintenance exclusions. | unique-exclusion-id-001 | Duplicate or missing IDs |

### control_plane Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `remote` | Remote control plane configuration. | false | true | Remote control plane location impacts latency, availability, and data residency. | Properly configured edge zone location | Unapproved or insecure locations |
| `local` | Local control plane configuration. | false | true | Local control plane configuration impacts high availability, resource isolation, and deployment policies. | Proper node count (1 or 3) with appropriate machine filtering | Invalid node count or overly permissive machine filters |

###   remote Block
  | Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
  |----------|-------------|----------|-----------------|-----------|-----------|---------------|
  | `node_location` | Name of the Google Distributed Cloud Edge zones where this node pool will be created. For example: `us-central1-edge-customer-a`. | false | true | Node location should be in approved zones that meet data residency and performance requirements. | us-central1-edge-customer-a | Unapproved or restricted locations |

###   local Block
  | Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
  |----------|-------------|----------|-----------------|-----------|-----------|---------------|
  | `node_location` | Name of the Google Distributed Cloud Edge zones where this node pool will be created. For example: `us-central1-edge-customer-a`. | false | true | Node location should be in approved zones that meet data residency and performance requirements. | us-central1-edge-customer-a | Unapproved or restricted locations |
  | `node_count` | The number of nodes to serve as replicas of the Control Plane. Only 1 and 3 are supported. | false | true | Proper node count ensures high availability and fault tolerance for the control plane. | 3 (for high availability) | 2 (unsupported count) |
  | `machine_filter` | Only machines matching this filter will be allowed to host control plane nodes. The filtering language accepts strings like "name=<name>", and is documented here: [AIP-160](https://google.aip.dev/160). | false | true | Machine filters ensure control plane nodes run only on approved, properly configured hardware. | name=approved-control-plane-machine* | Overly permissive or missing filters |
  | `shared_deployment_policy` | Policy configuration about how user applications are deployed. Possible values are: `SHARED_DEPLOYMENT_POLICY_UNSPECIFIED`, `ALLOWED`, `DISALLOWED`. | false | true | Shared deployment policy controls whether user applications can run on control plane nodes, impacting security isolation. | DISALLOWED | ALLOWED (reduces security isolation) |

### system_addons_config Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `ingress` | Config for the Ingress add-on which allows customers to create an Ingress object to manage external access to the servers in a cluster. The add-on consists of istiod and istio-ingress. | false | true | Ingress configuration controls external access to cluster services and should be properly secured. | Properly configured ingress with secure VIP settings | Misconfigured or overly permissive ingress settings |

###   ingress Block
  | Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
  |----------|-------------|----------|-----------------|-----------|-----------|---------------|
  | `disabled` | Whether Ingress is disabled. | false | true | Disabling ingress when not needed reduces attack surface. | true (when external access not required) | false (when external access not properly secured) |
  | `ipv4_vip` | Ingress VIP. | false | true | Ingress VIP should use properly scoped IP addresses to prevent unauthorized access. | 192.168.1.100 | 0.0.0.0 (overly permissive) |

### control_plane_encryption Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `kms_key` | The Cloud KMS CryptoKey e.g. projects/{project}/locations/{location}/keyRings/{keyRing}/cryptoKeys/{cryptoKey} to use for protecting control plane disks. If not specified, a Google-managed key will be used instead. | false | true | Customer-managed keys provide better control over encryption and access policies. | projects/my-project/locations/us-central1/keyRings/my-keyring/cryptoKeys/my-key | Missing or improperly formatted KMS key reference |
| `kms_key_active_version` | (Output) The Cloud KMS CryptoKeyVersion currently in use for protecting control plane disks. Only applicable if kms_key is set. | false | false | Output-only field indicating current key version, no security impact. | None | None |
| `kms_key_state` | (Output) Availability of the Cloud KMS CryptoKey. If not `KEY_AVAILABLE`, then nodes may go offline as they cannot access their local data. This can be caused by a lack of permissions to use the key, or if the key is disabled or deleted. | false | false | Output-only field indicating key status, no security impact. | None | None |
| `kms_status` | (Output) Error status returned by Cloud KMS when using this key. This field may be populated only if `kms_key_state` is not `KMS_KEY_STATE_KEY_AVAILABLE`. If populated, this field contains the error status reported by Cloud KMS. | false | false | Output-only field for KMS error status, no security impact. | None | None |

### admin_users Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `username` | An active Google username. | true | true | Admin usernames should be valid organizational accounts with proper authorization. | authorized.user@company.com | invalid@example.com |

### window Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `recurring_window` | Represents an arbitrary window of time that recurs. | true | true | Recurring windows provide predictable maintenance schedules that can be planned around. | Properly configured recurrence pattern | Missing or invalid recurrence pattern |

### recurring_window Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `window` | Represents an arbitrary window of time. | false | true | Window timing should align with business low-usage periods to minimize impact. | Proper start and end times during low-usage periods | Window during peak business hours |
| `recurrence` | An RRULE (https://tools.ietf.org/html/rfc5545#section-3.8.5.3) for how this window recurs. They go on for the span of time between the start and end time. | false | true | Proper recurrence patterns ensure maintenance occurs at predictable intervals. | FREQ=WEEKLY;BYDAY=SA | Missing or invalid recurrence pattern |

### maintenance_exclusions Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `window` | Represents an arbitrary window of time. | false | true | Exclusion windows should be properly defined to prevent maintenance during critical periods. | Properly defined exclusion period | Overly broad exclusion windows |
| `id` | A unique (per cluster) id for the window. | false | true | Unique IDs ensure proper tracking and management of maintenance exclusions. | unique-exclusion-id-001 | Duplicate or missing IDs |

### remote Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `node_location` | Name of the Google Distributed Cloud Edge zones where this node pool will be created. For example: `us-central1-edge-customer-a`. | false | true | Remote node location should be in approved zones that meet security and compliance requirements. | us-central1-edge-customer-a | Unapproved or restricted edge zones |

### local Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `node_location` | Name of the Google Distributed Cloud Edge zones where this node pool will be created. For example: `us-central1-edge-customer-a`. | false | true | Local node location should be in approved zones that meet security and compliance requirements. | us-central1-edge-customer-a | Unapproved or restricted edge zones |
| `node_count` | The number of nodes to serve as replicas of the Control Plane. Only 1 and 3 are supported. | false | true | Proper node count ensures high availability and fault tolerance for the control plane. | 3 (for high availability) | 2 (unsupported count) or 1 (no redundancy) |
| `machine_filter` | Only machines matching this filter will be allowed to host control plane nodes. The filtering language accepts strings like "name=<name>", and is documented here: [AIP-160](https://google.aip.dev/160). | false | true | Machine filters ensure control plane nodes run only on approved, properly configured hardware with adequate security controls. | name=approved-control-plane-machine* | Overly permissive filters or missing filters |
| `shared_deployment_policy` | Policy configuration about how user applications are deployed. Possible values are: `SHARED_DEPLOYMENT_POLICY_UNSPECIFIED`, `ALLOWED`, `DISALLOWED`. | false | true | Shared deployment policy controls whether user applications can run on control plane nodes, impacting security isolation and attack surface. | DISALLOWED | ALLOWED (reduces security isolation) |

### ingress Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `disabled` | Whether Ingress is disabled. | false | true | Disabling ingress when not needed reduces the attack surface and prevents unauthorized external access. | true (when external access not required) | false (when external access is not properly secured) |
| `ipv4_vip` | Ingress VIP. | false | true | Ingress VIP should use properly scoped IP addresses within approved ranges to prevent unauthorized access. | 192.168.1.100 (within approved RFC1918 range) | 0.0.0.0 (overly permissive) or public IP addresses |
