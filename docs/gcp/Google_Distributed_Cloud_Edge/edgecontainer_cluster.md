## 🛡️ Policy Deployment Engine: `edgecontainer_cluster`

This section provides a concise policy evaluation for the `edgecontainer_cluster` resource in GCP.

Reference: [Terraform Registry – edgecontainer_cluster](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/edgecontainer_cluster)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `location` | The location of the resource. | true | None | None |
| `name` | The GDCE cluster name. | true | None | None |
| `labels` | User-defined labels for the edgecloud cluster. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | None | None |
| `default_max_pods_per_node` | The default maximum number of pods per node used if a maximum value is not specified explicitly for a node pool in this cluster. If unspecified, the Kubernetes default value will be used. | false | None | None |
| `external_load_balancer_ipv4_address_pools` | Address pools for cluster data plane external load balancing. | false | None | None |
| `target_version` | The target cluster version. For example: "1.5.0". | false | None | None |
| `release_channel` | The release channel a cluster is subscribed to. Possible values are: `RELEASE_CHANNEL_UNSPECIFIED`, `NONE`, `REGULAR`. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### fleet Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `project` | The name of the Fleet host project where this cluster will be registered. Project names are formatted as `projects/<project-number>`. | true | None | None |
| `membership` | (Output) The name of the managed Hub Membership resource associated to this cluster. Membership names are formatted as `projects/<project-number>/locations/global/membership/<cluster-id>`. | none | None | None |

### networking Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `cluster_ipv4_cidr_blocks` | All pods in the cluster are assigned an RFC1918 IPv4 address from these blocks. Only a single block is supported. This field cannot be changed after creation. | true | None | None |
| `services_ipv4_cidr_blocks` | All services in the cluster are assigned an RFC1918 IPv4 address from these blocks. Only a single block is supported. This field cannot be changed after creation. | true | None | None |
| `cluster_ipv6_cidr_blocks` | If specified, dual stack mode is enabled and all pods in the cluster are assigned an IPv6 address from these blocks alongside from an IPv4 address. Only a single block is supported. This field cannot be changed after creation. | false | None | None |
| `services_ipv6_cidr_blocks` | If specified, dual stack mode is enabled and all services in the cluster are assigned an IPv6 address from these blocks alongside from an IPv4 address. Only a single block is supported. This field cannot be changed after creation. | false | None | None |
| `network_type` | (Output) IP addressing type of this cluster i.e. SINGLESTACK_V4 vs DUALSTACK_V4_V6. | none | None | None |

### authorization Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `admin_users` | User that will be granted the cluster-admin role on the cluster, providing full access to the cluster. Currently, this is a singular field, but will be expanded to allow multiple admins in the future. Structure is [documented below](#nested_authorization_admin_users). | true | None | None |

### maintenance_policy Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `window` | Specifies the maintenance window in which maintenance may be performed. Structure is [documented below](#nested_maintenance_policy_window). | true | None | None |
| `maintenance_exclusions` | Exclusions to automatic maintenance. Non-emergency maintenance should not occur in these windows. Each exclusion has a unique name and may be active or expired. The max number of maintenance exclusions allowed at a given time is 3. Structure is [documented below](#nested_maintenance_policy_maintenance_exclusions). | false | None | None |

### control_plane Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `remote` | Remote control plane configuration. Structure is [documented below](#nested_control_plane_remote). | false | None | None |
| `local` | Local control plane configuration. Structure is [documented below](#nested_control_plane_local). | false | None | None |

### system_addons_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `ingress` | Config for the Ingress add-on which allows customers to create an Ingress object to manage external access to the servers in a cluster. The add-on consists of istiod and istio-ingress. Structure is [documented below](#nested_system_addons_config_ingress). | false | None | None |

### control_plane_encryption Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `kms_key` | The Cloud KMS CryptoKey e.g. projects/{project}/locations/{location}/keyRings/{keyRing}/cryptoKeys/{cryptoKey} to use for protecting control plane disks. If not specified, a Google-managed key will be used instead. | false | None | None |
| `kms_key_active_version` | (Output) The Cloud KMS CryptoKeyVersion currently in use for protecting control plane disks. Only applicable if kms_key is set. | none | None | None |
| `kms_key_state` | (Output) Availability of the Cloud KMS CryptoKey. If not `KEY_AVAILABLE`, then nodes may go offline as they cannot access their local data. This can be caused by a lack of permissions to use the key, or if the key is disabled or deleted. | none | None | None |
| `kms_status` | (Output) Error status returned by Cloud KMS when using this key. This field may be populated only if `kms_key_state` is not `KMS_KEY_STATE_KEY_AVAILABLE`. If populated, this field contains the error status reported by Cloud KMS. Structure is [documented below](#nested_control_plane_encryption_kms_status). The `kms_status` block contains: | none | None | None |
| `code` | (Output) The status code, which should be an enum value of google.rpc.Code. | none | None | None |
| `message` | (Output) A developer-facing error message, which should be in English. Any user-facing error message should be localized and sent in the google.rpc.Status.details field, or localized by the client. | none | None | None |

### admin_users Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `username` | An active Google username. | true | None | None |

### window Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `recurring_window` | Represents an arbitrary window of time that recurs. Structure is [documented below](#nested_maintenance_policy_window_recurring_window). | true | None | None |
| `start_time` | The time that the window first starts. | false | None | None |
| `end_time` | The time that the window ends. The end time must take place after the start time. | false | None | None |

### recurring_window Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `window` | Represents an arbitrary window of time. Structure is [documented below](#nested_maintenance_policy_window_recurring_window_window). | false | None | None |
| `recurrence` | An RRULE (https://tools.ietf.org/html/rfc5545#section-3.8.5.3) for how this window recurs. They go on for the span of time between the start and end time. | false | None | None |

### maintenance_exclusions Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `window` | Represents an arbitrary window of time. Structure is [documented below](#nested_maintenance_policy_maintenance_exclusions_maintenance_exclusions_window). | false | None | None |
| `id` | A unique (per cluster) id for the window. | false | None | None |

### remote Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `node_location` | Name of the Google Distributed Cloud Edge zones where this node pool will be created. For example: `us-central1-edge-customer-a`. | false | None | None |

### local Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `node_location` | Name of the Google Distributed Cloud Edge zones where this node pool will be created. For example: `us-central1-edge-customer-a`. | false | None | None |
| `node_count` | The number of nodes to serve as replicas of the Control Plane. Only 1 and 3 are supported. | false | None | None |
| `machine_filter` | Only machines matching this filter will be allowed to host control plane nodes. The filtering language accepts strings like "name=<name>", and is documented here: [AIP-160](https://google.aip.dev/160). | false | None | None |
| `shared_deployment_policy` | Policy configuration about how user applications are deployed. Possible values are: `SHARED_DEPLOYMENT_POLICY_UNSPECIFIED`, `ALLOWED`, `DISALLOWED`. | false | None | None |

### ingress Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `disabled` | Whether Ingress is disabled. | false | None | None |
| `ipv4_vip` | Ingress VIP. | false | None | None |
