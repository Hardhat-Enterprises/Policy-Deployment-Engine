## 🛡️ Policy Deployment Engine: `edgecontainer_cluster`

This section provides a concise policy evaluation for the `edgecontainer_cluster` resource in GCP.

Reference: [Terraform Registry – edgecontainer_cluster](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/edgecontainer_cluster)

---

## 1. Argument Reference

### `fleet`
- Description: (Required) Fleet related configuration. Fleets are a Google Cloud concept for logically organizing clusters, letting you use and manage multi-cluster capabilities and apply consistent policies across your systems. Structure is [documented below](#nested_fleet).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `networking`
- Description: (Required) Fleet related configuration. Fleets are a Google Cloud concept for logically organizing clusters, letting you use and manage multi-cluster capabilities and apply consistent policies across your systems. Structure is [documented below](#nested_networking).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `authorization`
- Description: (Required) RBAC policy that will be applied and managed by GEC. Structure is [documented below](#nested_authorization).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Required) The location of the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Required) The GDCE cluster name.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) User-defined labels for the edgecloud cluster. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `default_max_pods_per_node`
- Description: (Optional) The default maximum number of pods per node used if a maximum value is not specified explicitly for a node pool in this cluster. If unspecified, the Kubernetes default value will be used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `maintenance_policy`
- Description: (Optional) Cluster-wide maintenance policy configuration. Structure is [documented below](#nested_maintenance_policy).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `control_plane`
- Description: (Optional) The configuration of the cluster control plane. Structure is [documented below](#nested_control_plane).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `system_addons_config`
- Description: (Optional) Config that customers are allowed to define for GDCE system add-ons. Structure is [documented below](#nested_system_addons_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `external_load_balancer_ipv4_address_pools`
- Description: (Optional) Address pools for cluster data plane external load balancing.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `control_plane_encryption`
- Description: (Optional) Remote control plane disk encryption options. This field is only used when enabling CMEK support. Structure is [documented below](#nested_control_plane_encryption).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `target_version`
- Description: (Optional) The target cluster version. For example: "1.5.0".
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `release_channel`
- Description: (Optional) The release channel a cluster is subscribed to. Possible values are: `RELEASE_CHANNEL_UNSPECIFIED`, `NONE`, `REGULAR`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_fleet"></a>The `fleet` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: (Required) The name of the Fleet host project where this cluster will be registered. Project names are formatted as `projects/<project-number>`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `membership`
- Description: (Output) The name of the managed Hub Membership resource associated to this cluster. Membership names are formatted as `projects/<project-number>/locations/global/membership/<cluster-id>`. <a name="nested_networking"></a>The `networking` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cluster_ipv4_cidr_blocks`
- Description: (Required) All pods in the cluster are assigned an RFC1918 IPv4 address from these blocks. Only a single block is supported. This field cannot be changed after creation.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `services_ipv4_cidr_blocks`
- Description: (Required) All services in the cluster are assigned an RFC1918 IPv4 address from these blocks. Only a single block is supported. This field cannot be changed after creation.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cluster_ipv6_cidr_blocks`
- Description: (Optional) If specified, dual stack mode is enabled and all pods in the cluster are assigned an IPv6 address from these blocks alongside from an IPv4 address. Only a single block is supported. This field cannot be changed after creation.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `services_ipv6_cidr_blocks`
- Description: (Optional) If specified, dual stack mode is enabled and all services in the cluster are assigned an IPv6 address from these blocks alongside from an IPv4 address. Only a single block is supported. This field cannot be changed after creation.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `network_type`
- Description: (Output) IP addressing type of this cluster i.e. SINGLESTACK_V4 vs DUALSTACK_V4_V6. <a name="nested_authorization"></a>The `authorization` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `admin_users`
- Description: (Required) User that will be granted the cluster-admin role on the cluster, providing full access to the cluster. Currently, this is a singular field, but will be expanded to allow multiple admins in the future. Structure is [documented below](#nested_authorization_admin_users). <a name="nested_authorization_admin_users"></a>The `admin_users` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `username`
- Description: (Required) An active Google username. <a name="nested_maintenance_policy"></a>The `maintenance_policy` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `window`
- Description: (Required) Specifies the maintenance window in which maintenance may be performed. Structure is [documented below](#nested_maintenance_policy_window).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `maintenance_exclusions`
- Description: (Optional) Exclusions to automatic maintenance. Non-emergency maintenance should not occur in these windows. Each exclusion has a unique name and may be active or expired. The max number of maintenance exclusions allowed at a given time is 3. Structure is [documented below](#nested_maintenance_policy_maintenance_exclusions). <a name="nested_maintenance_policy_window"></a>The `window` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `recurring_window`
- Description: (Required) Represents an arbitrary window of time that recurs. Structure is [documented below](#nested_maintenance_policy_window_recurring_window). <a name="nested_maintenance_policy_window_recurring_window"></a>The `recurring_window` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `window`
- Description: (Optional) Represents an arbitrary window of time. Structure is [documented below](#nested_maintenance_policy_window_recurring_window_window).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `recurrence`
- Description: (Optional) An RRULE (https://tools.ietf.org/html/rfc5545#section-3.8.5.3) for how this window recurs. They go on for the span of time between the start and end time. <a name="nested_maintenance_policy_window_recurring_window_window"></a>The `window` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `start_time`
- Description: (Optional) The time that the window first starts.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `end_time`
- Description: (Optional) The time that the window ends. The end time must take place after the start time. <a name="nested_maintenance_policy_maintenance_exclusions"></a>The `maintenance_exclusions` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `window`
- Description: (Optional) Represents an arbitrary window of time. Structure is [documented below](#nested_maintenance_policy_maintenance_exclusions_maintenance_exclusions_window).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `id`
- Description: (Optional) A unique (per cluster) id for the window. <a name="nested_maintenance_policy_maintenance_exclusions_maintenance_exclusions_window"></a>The `window` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `start_time`
- Description: (Optional) The time that the window first starts.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `end_time`
- Description: (Optional) The time that the window ends. The end time must take place after the start time. <a name="nested_control_plane"></a>The `control_plane` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `remote`
- Description: (Optional) Remote control plane configuration. Structure is [documented below](#nested_control_plane_remote).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `local`
- Description: (Optional) Local control plane configuration. Structure is [documented below](#nested_control_plane_local). <a name="nested_control_plane_remote"></a>The `remote` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `node_location`
- Description: (Optional) Name of the Google Distributed Cloud Edge zones where this node pool will be created. For example: `us-central1-edge-customer-a`. <a name="nested_control_plane_local"></a>The `local` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `node_location`
- Description: (Optional) Name of the Google Distributed Cloud Edge zones where this node pool will be created. For example: `us-central1-edge-customer-a`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `node_count`
- Description: (Optional) The number of nodes to serve as replicas of the Control Plane. Only 1 and 3 are supported.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `machine_filter`
- Description: (Optional) Only machines matching this filter will be allowed to host control plane nodes. The filtering language accepts strings like "name=<name>", and is documented here: [AIP-160](https://google.aip.dev/160).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `shared_deployment_policy`
- Description: (Optional) Policy configuration about how user applications are deployed. Possible values are: `SHARED_DEPLOYMENT_POLICY_UNSPECIFIED`, `ALLOWED`, `DISALLOWED`. <a name="nested_system_addons_config"></a>The `system_addons_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ingress`
- Description: (Optional) Config for the Ingress add-on which allows customers to create an Ingress object to manage external access to the servers in a cluster. The add-on consists of istiod and istio-ingress. Structure is [documented below](#nested_system_addons_config_ingress). <a name="nested_system_addons_config_ingress"></a>The `ingress` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `disabled`
- Description: (Optional) Whether Ingress is disabled.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ipv4_vip`
- Description: (Optional) Ingress VIP. <a name="nested_control_plane_encryption"></a>The `control_plane_encryption` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `kms_key`
- Description: (Optional) The Cloud KMS CryptoKey e.g. projects/{project}/locations/{location}/keyRings/{keyRing}/cryptoKeys/{cryptoKey} to use for protecting control plane disks. If not specified, a Google-managed key will be used instead.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `kms_key_active_version`
- Description: (Output) The Cloud KMS CryptoKeyVersion currently in use for protecting control plane disks. Only applicable if kms_key is set.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `kms_key_state`
- Description: (Output) Availability of the Cloud KMS CryptoKey. If not `KEY_AVAILABLE`, then nodes may go offline as they cannot access their local data. This can be caused by a lack of permissions to use the key, or if the key is disabled or deleted.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `kms_status`
- Description: (Output) Error status returned by Cloud KMS when using this key. This field may be populated only if `kms_key_state` is not `KMS_KEY_STATE_KEY_AVAILABLE`. If populated, this field contains the error status reported by Cloud KMS. Structure is [documented below](#nested_control_plane_encryption_kms_status). <a name="nested_control_plane_encryption_kms_status"></a>The `kms_status` block contains:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `code`
- Description: (Output) The status code, which should be an enum value of google.rpc.Code.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `message`
- Description: (Output) A developer-facing error message, which should be in English. Any user-facing error message should be localized and sent in the google.rpc.Status.details field, or localized by the client.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
