## 🛡️ Policy Deployment Engine: `edgecontainer_cluster`

This section provides a concise policy evaluation for the `edgecontainer_cluster` resource in GCP.

Reference: [Terraform Registry – edgecontainer_cluster](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/edgecontainer_cluster)

---

## Argument Reference
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `fleet` | Fleet related configuration. Fleets are a Google Cloud concept for logically organizing clusters, letting you use and manage multi-cluster capabilities and apply consistent policies across your systems. Structure is [documented below](#nested_fleet). | true | true | Fleet configuration ensures proper integration with Google Cloud governance and management systems. | Properly formatted project references | Hardcoded or invalid project references |
| `networking` | Fleet related configuration. Fleets are a Google Cloud concept for logically organizing clusters, letting you use and manage multi-cluster capabilities and apply consistent policies across your systems. Structure is [documented below](#nested_networking). | true | true | Network configuration defines isolation boundaries and connectivity rules which are fundamental to cluster security. | Properly scoped RFC1918 ranges | Overly permissive ranges like 0.0.0.0/0 |
| `authorization` | RBAC policy that will be applied and managed by GEC. Structure is [documented below](#nested_authorization). | true | true | Authorization controls define who has administrative access to the cluster. | Properly configured admin users with approved identities | Unauthorized or generic admin accounts |
| `location` | The location of the resource. | true | false | None | australia-southeast1 | None |
| `name` | The GDCE cluster name. | true | false | None | c | None |
| `labels` | User-defined labels for the edgecloud cluster. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | true | Proper labeling enables effective resource management, cost tracking, and security classification. | {owner = "Harsh", environment = "Developer", cost-center = "IT"} | Missing required labels or inconsistent labeling scheme |
| `default_max_pods_per_node` | The default maximum number of pods per node used if a maximum value is not specified explicitly for a node pool in this cluster. If unspecified, the Kubernetes default value will be used. | false | true | Limiting pods per node prevents resource exhaustion and improves cluster stability. | 30 | 110 |
| `maintenance_policy` | Cluster-wide maintenance policy configuration. Structure is [documented below](#nested_maintenance_policy). | false | true | Maintenance windows ensure predictable update schedules and minimize service disruption. | Regular maintenance windows with proper recurrence patterns | No maintenance policy configured |
| `control_plane` | The configuration of the cluster control plane. Structure is [documented below](#nested_control_plane). | false | false | None | None | None |
| `system_addons_config` | Config that customers are allowed to define for GDCE system add-ons. Structure is [documented below](#nested_system_addons_config). | false | true | System addons extend cluster functionality and must be properly secured and configured to prevent vulnerabilities. | Properly configured and secured system addons | Default or insecure addon configurations |
| `external_load_balancer_ipv4_address_pools` | Address pools for cluster data plane external load balancing. | false | true | External load balancer address pools must be properly scoped to prevent unauthorized external access to services. | Properly scoped address ranges for specific services | Overly permissive address ranges exposing internal services |
| `control_plane_encryption` | Remote control plane disk encryption options. This field is only used when enabling CMEK support. Structure is [documented below](#nested_control_plane_encryption). | false | true | Encryption protects sensitive cluster management data at rest and should use customer-managed keys for better control. | Customer-managed encryption keys with proper access controls | No encryption or using default Google-managed keys only |
| `target_version` | The target cluster version. For example: "1.5.0". | false | true | Running current versions ensures security patches and vulnerability fixes are applied. | 1.5.0 | 1.0.0 |
| `release_channel` | The release channel a cluster is subscribed to. Possible values are: `RELEASE_CHANNEL_UNSPECIFIED`, `NONE`, `REGULAR`. | false | true | Regular release channels ensure timely security updates and patches are applied to the cluster. | REGULAR | NONE |
| `project` | If it is not provided, the provider project is used. | false | false | None | None | None |
| `admin_users` |  | false | false | None | None | None |
| `window` |  | false | false | None | None | None |
| `recurring_window` |  | false | false | None | None | None |
| `maintenance_exclusions` |  | false | true | Maintenance exclusions should be used judiciously to avoid delaying critical security updates. | Limited, well-justified maintenance exclusions | Excessive exclusions delaying security updates |
| `remote` |  | false | false | None | None | None |
| `local` |  | false | false | None | None | None |
| `ingress` |  | false | false | None | None | None |

### fleet Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `project` | The name of the Fleet host project where this cluster will be registered. Project names are formatted as `projects/<project-number>`. | true | true | Project reference must be valid and properly formatted for fleet management to work correctly. | projects/gdce-dev | projects/1234567890 |
| `membership` | (Output) The name of the managed Hub Membership resource associated to this cluster. Membership names are formatted as `projects/<project-number>/locations/global/membership/<cluster-id>`. | false | false | None | None | None |

### networking Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `cluster_ipv4_cidr_blocks` | All pods in the cluster are assigned an RFC1918 IPv4 address from these blocks. Only a single block is supported. This field cannot be changed after creation. | true | true | Proper CIDR range selection prevents IP conflicts and ensures network isolation. | ["10.0.0.0/16"] | ["0.0.0.0/0"] |
| `services_ipv4_cidr_blocks` | All services in the cluster are assigned an RFC1918 IPv4 address from these blocks. Only a single block is supported. This field cannot be changed after creation. | true | true | Service CIDR ranges must be properly scoped to prevent exposure of internal services. | ["10.1.0.0/16"] | ["0.0.0.0/0"] |
| `cluster_ipv6_cidr_blocks` | If specified, dual stack mode is enabled and all pods in the cluster are assigned an IPv6 address from these blocks alongside from an IPv4 address. Only a single block is supported. This field cannot be changed after creation. | false | false | None | None | None |
| `services_ipv6_cidr_blocks` | If specified, dual stack mode is enabled and all services in the cluster are assigned an IPv6 address from these blocks alongside from an IPv4 address. Only a single block is supported. This field cannot be changed after creation. | false | false | None | None | None |
| `network_type` | (Output) IP addressing type of this cluster i.e. SINGLESTACK_V4 vs DUALSTACK_V4_V6. | false | false | None | None | None |

### authorization Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `admin_users` | User that will be granted the cluster-admin role on the cluster, providing full access to the cluster. Currently, this is a singular field, but will be expanded to allow multiple admins in the future. Structure is [documented below](#nested_authorization_admin_users). | true | true | Admin users have full cluster access and must be properly vetted and authorized. | Approved organizational email addresses | Generic or unauthorized accounts |

### maintenance_policy Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `window` | Specifies the maintenance window in which maintenance may be performed. Structure is [documented below](#nested_maintenance_policy_window). | true | false | None | Business-hour avoiding schedules | Peak hour maintenance windows |
| `maintenance_exclusions` | Exclusions to automatic maintenance. Non-emergency maintenance should not occur in these windows. Each exclusion has a unique name and may be active or expired. The max number of maintenance exclusions allowed at a given time is 3. Structure is [documented below](#nested_maintenance_policy_maintenance_exclusions). | false | false | None | None | None |

### control_plane Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `remote` | Remote control plane configuration. Structure is [documented below](#nested_control_plane_remote). | false | false | None | None | None |
| `local` | Local control plane configuration. Structure is [documented below](#nested_control_plane_local). | false | false | None | None | None |

### system_addons_config Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `ingress` | Config for the Ingress add-on which allows customers to create an Ingress object to manage external access to the servers in a cluster. The add-on consists of istiod and istio-ingress. Structure is [documented below](#nested_system_addons_config_ingress). | false | true | Ingress controllers expose services to external traffic and require proper security configuration. | Properly secured ingress with TLS and access controls | Unsecured ingress exposing services publicly |

### control_plane_encryption Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `kms_key` | The Cloud KMS CryptoKey e.g. projects/{project}/locations/{location}/keyRings/{keyRing}/cryptoKeys/{cryptoKey} to use for protecting control plane disks. If not specified, a Google-managed key will be used instead. | false | true | Customer-managed keys provide better control over encryption and access policies. | Properly formatted KMS key reference with appropriate permissions | Invalid or inaccessible KMS key reference |
| `kms_key_active_version` | (Output) The Cloud KMS CryptoKeyVersion currently in use for protecting control plane disks. Only applicable if kms_key is set. | false | false | None | None | None |
| `kms_key_state` | (Output) Availability of the Cloud KMS CryptoKey. If not `KEY_AVAILABLE`, then nodes may go offline as they cannot access their local data. This can be caused by a lack of permissions to use the key, or if the key is disabled or deleted. | false | false | None | None | None |
| `kms_status` | (Output) Error status returned by Cloud KMS when using this key. This field may be populated only if `kms_key_state` is not `KMS_KEY_STATE_KEY_AVAILABLE`. If populated, this field contains the error status reported by Cloud KMS. Structure is [documented below](#nested_control_plane_encryption_kms_status). The `kms_status` block contains: | false | false | None | None | None |
| `code` | (Output) The status code, which should be an enum value of google.rpc.Code. | false | false | None | None | None |
| `message` | (Output) A developer-facing error message, which should be in English. Any user-facing error message should be localized and sent in the google.rpc.Status.details field, or localized by the client. | false | false | None | None | None |

### admin_users Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `username` | An active Google username. | true | true | Admin usernames must be valid organizational identities with proper accountability. | hpandya368@gmail.com | invalid@example.com |

### window Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `recurring_window` | Represents an arbitrary window of time that recurs. Structure is [documented below](#nested_maintenance_policy_window_recurring_window). | true | false | None | Proper recurrence patterns | Irregular patterns |
| `start_time` | The time that the window first starts. | false | false | None | None | None |
| `end_time` | The time that the window ends. The end time must take place after the start time. | false | false | None | None | None |

### recurring_window Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `window` | Represents an arbitrary window of time. Structure is [documented below](#nested_maintenance_policy_window_recurring_window_window). | false | false | None | None | None |
| `recurrence` | An RRULE (https://tools.ietf.org/html/rfc5545#section-3.8.5.3) for how this window recurs. They go on for the span of time between the start and end time. | false | false | None | FREQ=WEEKLY;BYDAY=SA | No recurrence pattern defined |

### maintenance_exclusions Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `window` | Represents an arbitrary window of time. Structure is [documented below](#nested_maintenance_policy_maintenance_exclusions_maintenance_exclusions_window). | false | false | None | None | None |
| `id` | A unique (per cluster) id for the window. | false | false | None | None | None |

### remote Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `node_location` | Name of the Google Distributed Cloud Edge zones where this node pool will be created. For example: `us-central1-edge-customer-a`. | false | false | None | None | None |

### local Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `node_location` | Name of the Google Distributed Cloud Edge zones where this node pool will be created. For example: `us-central1-edge-customer-a`. | false | false | None | None | None |
| `node_count` | The number of nodes to serve as replicas of the Control Plane. Only 1 and 3 are supported. | false | false | None | None | None |
| `machine_filter` | Only machines matching this filter will be allowed to host control plane nodes. The filtering language accepts strings like "name=<name>", and is documented here: [AIP-160](https://google.aip.dev/160). | false | false | None | None | None |
| `shared_deployment_policy` | Policy configuration about how user applications are deployed. Possible values are: `SHARED_DEPLOYMENT_POLICY_UNSPECIFIED`, `ALLOWED`, `DISALLOWED`. | false | false | None | None | None |

### ingress Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `disabled` | Whether Ingress is disabled. | false | false | None | None | None |
| `ipv4_vip` | Ingress VIP. | false | false | None | None | None |
