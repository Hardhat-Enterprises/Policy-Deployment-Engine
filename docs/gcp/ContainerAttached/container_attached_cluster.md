## 🛡️ Policy Deployment Engine: `container_attached_cluster`

This section provides a concise policy evaluation for the `container_attached_cluster` resource in GCP.

Reference: [Terraform Registry – container_attached_cluster](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/container_attached_cluster)

---

## 1. Argument Reference

### `location`
- Description: (Required) The location for the resource
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Required) The name of this resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `oidc_config`
- Description: (Required) OIDC discovery information of the target cluster. Kubernetes Service Account (KSA) tokens are JWT tokens signed by the cluster API server. This fields indicates how GCP services validate KSA tokens in order to allow system workloads (such as GKE Connect and telemetry agents) to authenticate back to GCP. Both clusters with public and private issuer URLs are supported. Clusters with public issuers only need to specify the `issuer_url` field while clusters with private issuers need to provide both `issuer_url` and `jwks`. Structure is [documented below](#nested_oidc_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `platform_version`
- Description: (Required) The platform version for the cluster (e.g. `1.23.0-gke.1`).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `distribution`
- Description: (Required) The Kubernetes distribution of the underlying attached cluster. Supported values: "eks", "aks", "generic". The generic distribution provides the ability to register or migrate any CNCF conformant cluster.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `fleet`
- Description: (Required) Fleet configuration. Structure is [documented below](#nested_fleet).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) A human readable description of this attached cluster. Cannot be longer than 255 UTF-8 encoded bytes.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `annotations`
- Description: (Optional) Optional. Annotations on the cluster. This field has the same restrictions as Kubernetes annotations. The total size of all keys and values combined is limited to 256k. Key can have 2 segments: prefix (optional) and name (required), separated by a slash (/). Prefix must be a DNS subdomain. Name must be 63 characters or less, begin and end with alphanumerics, with dashes (-), underscores (_), dots (.), and alphanumerics between. **Note**: This field is non-authoritative, and will only manage the annotations present in your configuration. Please refer to the field `effective_annotations` for all of the annotations present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `logging_config`
- Description: (Optional) Logging configuration. Structure is [documented below](#nested_logging_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `authorization`
- Description: (Optional) Configuration related to the cluster RBAC settings. Structure is [documented below](#nested_authorization).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `monitoring_config`
- Description: (Optional) Monitoring configuration. Structure is [documented below](#nested_monitoring_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `binary_authorization`
- Description: (Optional) Binary Authorization configuration. Structure is [documented below](#nested_binary_authorization).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `proxy_config`
- Description: (Optional) Support for proxy configuration. Structure is [documented below](#nested_proxy_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `security_posture_config`
- Description: (Optional, Deprecated) Enable/Disable Security Posture API features for the cluster. Structure is [documented below](#nested_security_posture_config). ~> **Warning:** `security_posture_config` is deprecated and will be removed in a future major release.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `deletion_policy`
- Description: <a name="nested_oidc_config"></a>The `oidc_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `issuer_url`
- Description: (Required) A JSON Web Token (JWT) issuer URI. `issuer` must start with `https://`
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `jwks`
- Description: (Optional) OIDC verification keys in JWKS format (RFC 7517). <a name="nested_fleet"></a>The `fleet` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `membership`
- Description: (Output) The name of the managed Hub Membership resource associated to this cluster. Membership names are formatted as projects/<project-number>/locations/global/membership/<cluster-id>.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: (Required) The number of the Fleet host project where this cluster will be registered. <a name="nested_logging_config"></a>The `logging_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `component_config`
- Description: (Optional) The configuration of the logging components Structure is [documented below](#nested_logging_config_component_config). <a name="nested_logging_config_component_config"></a>The `component_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enable_components`
- Description: (Optional) The components to be enabled. Each value may be one of: `SYSTEM_COMPONENTS`, `WORKLOADS`. <a name="nested_authorization"></a>The `authorization` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `admin_users`
- Description: (Optional) Users that can perform operations as a cluster admin. A managed ClusterRoleBinding will be created to grant the `cluster-admin` ClusterRole to the users. Up to ten admin users can be provided. For more info on RBAC, see https://kubernetes.io/docs/reference/access-authn-authz/rbac/#user-facing-roles
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `admin_groups`
- Description: (Optional) Groups that can perform operations as a cluster admin. A managed ClusterRoleBinding will be created to grant the `cluster-admin` ClusterRole to the groups. Up to ten admin groups can be provided. For more info on RBAC, see https://kubernetes.io/docs/reference/access-authn-authz/rbac/#user-facing-roles <a name="nested_monitoring_config"></a>The `monitoring_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `managed_prometheus_config`
- Description: (Optional) Enable Google Cloud Managed Service for Prometheus in the cluster. Structure is [documented below](#nested_monitoring_config_managed_prometheus_config). <a name="nested_monitoring_config_managed_prometheus_config"></a>The `managed_prometheus_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enabled`
- Description: (Optional) Enable Managed Collection. <a name="nested_binary_authorization"></a>The `binary_authorization` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `evaluation_mode`
- Description: (Optional) Configure Binary Authorization evaluation mode. Possible values are: `DISABLED`, `PROJECT_SINGLETON_POLICY_ENFORCE`. <a name="nested_proxy_config"></a>The `proxy_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `kubernetes_secret`
- Description: (Optional) The Kubernetes Secret resource that contains the HTTP(S) proxy configuration. Structure is [documented below](#nested_proxy_config_kubernetes_secret). <a name="nested_proxy_config_kubernetes_secret"></a>The `kubernetes_secret` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Required) Name of the kubernetes secret containing the proxy config.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `namespace`
- Description: (Required) Namespace of the kubernetes secret containing the proxy config. <a name="nested_security_posture_config"></a>The `security_posture_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `vulnerability_mode`
- Description: (Required) Sets the mode of the Kubernetes security posture API's workload vulnerability scanning. Possible values are: `VULNERABILITY_DISABLED`, `VULNERABILITY_ENTERPRISE`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
