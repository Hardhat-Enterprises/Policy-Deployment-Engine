## 🛡️ Policy Deployment Engine: `container_attached_cluster`

This section provides a concise policy evaluation for the `container_attached_cluster` resource in GCP.

Reference: [Terraform Registry – container_attached_cluster](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/container_attached_cluster)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `location` | The location for the resource | true | false | None | None | None |
| `name` | The name of this resource. | true | false | None | None | None |
| `oidc_config` | OIDC discovery information of the target cluster. Kubernetes Service Account (KSA) tokens are JWT tokens signed by the cluster API server. This fields indicates how GCP services validate KSA tokens in order to allow system workloads (such as GKE Connect and telemetry agents) to authenticate back to GCP. Both clusters with public and private issuer URLs are supported. Clusters with public issuers only need to specify the `issuer_url` field while clusters with private issuers need to provide both `issuer_url` and `jwks`. Structure is [documented below](#nested_oidc_config). | true | false | None | None | None |
| `platform_version` | The platform version for the cluster (e.g. `1.23.0-gke.1`). | true | true | Using outdated or unsupported platform versions exposes the cluster to known security vulnerabilities and potential integration failures with GCP services. Maintaining a modern platform version ensures that the latest security patches and performance improvements are applied. | 1.29.1-gke.1 | 1.29.0-gke.1 |
| `distribution` | The Kubernetes distribution of the underlying attached cluster. Supported values: "eks", "aks", "generic". The generic distribution provides the ability to register or migrate any CNCF conformant cluster. | true | true | Restricting distributions to 'eks' or 'aks' ensures that the cluster benefits from cloud-specific security optimizations and maintained compatibility with GCP's management layer. Using 'generic' distributions for production can lead to a lack of automated security features and potential integration failures. | aks | generic |
| `fleet` | Fleet configuration. Structure is [documented below](#nested_fleet). | true | false | None | None | None |
| `description` | A human readable description of this attached cluster. Cannot be longer than 255 UTF-8 encoded bytes. | false | false | None | None | None |
| `annotations` | Optional. Annotations on the cluster. This field has the same restrictions as Kubernetes annotations. The total size of all keys and values combined is limited to 256k. Key can have 2 segments: prefix (optional) and name (required), separated by a slash (/). Prefix must be a DNS subdomain. Name must be 63 characters or less, begin and end with alphanumerics, with dashes (-), underscores (_), dots (.), and alphanumerics between. **Note**: This field is non-authoritative, and will only manage the annotations present in your configuration. Please refer to the field `effective_annotations` for all of the annotations present on the resource. | false | false | None | None | None |
| `logging_config` | Logging configuration. Structure is [documented below](#nested_logging_config). | false | false | None | None | None |
| `authorization` | Configuration related to the cluster RBAC settings. Structure is [documented below](#nested_authorization). | false | true | Restricting cluster admin groups to verified corporate domains (e.g., '@company.com') ensures that only authorized internal entities can exercise full control over the cluster. Allowing personal accounts or unapproved domains bypasses centralized identity management and increases the risk of unauthorized access or data exfiltration. | abc@company.com | xyz@random.com |
| `monitoring_config` | Monitoring configuration. Structure is [documented below](#nested_monitoring_config). | false | false | None | None | None |
| `binary_authorization` | Binary Authorization configuration. Structure is [documented below](#nested_binary_authorization). | false | true | Enabling Binary Authorization enforcement ensures that only verified, signed images are allowed to run on the cluster. Disabling this feature or leaving it unset allows unverified or potentially malicious container images to be deployed, significantly increasing the risk of a security breach. | PROJECT_SINGLETON_POLICY_ENFORCE | DISABLED |
| `proxy_config` | Support for proxy configuration. Structure is [documented below](#nested_proxy_config). | false | false | None | None | None |
| `security_posture_config` | , Deprecated) Enable/Disable Security Posture API features for the cluster. Structure is [documented below](#nested_security_posture_config). ~> **Warning:** `security_posture_config` is deprecated and will be removed in a future major release. | false | false | None | None | None |
| `project` | If it is not provided, the provider project is used. | false | false | None | None | None |
| `deletion_policy` | Policy of the resource deletion. | true | true | Setting the deletion policy to 'DELETE' ensures that the GCP control plane properly cleans up all associated metadata and memberships when the resource is destroyed. Using 'DELETE_IGNORE_ERRORS' can result in orphaned resources and an inconsistent state, making it difficult to re-register clusters or audit the infrastructure accurately. | DELETE | DELETE_IGNORE_ERRORS |
| `component_config` |  | false | false | None | None | None |
| `managed_prometheus_config` | Enable Google Cloud Managed Service for Prometheus in the cluster. | false | false | None | None | None |
| `kubernetes_secret` |  | false | false | None | None | None |

### oidc_config Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `issuer_url` | A JSON Web Token (JWT) issuer URI. `issuer` must start with `https://` | true | true | Restricting OIDC issuer URLs to approved identity providers prevents unauthorized authentication into the Kubernetes cluster. Using unapproved providers or non-HTTPS URIs could allow attackers to spoof identities and gain access to cluster resources. | https://oidc.issuer.url | http://oidc.issuer.url |
| `jwks` | OIDC verification keys in JWKS format (RFC 7517). | false | true | A valid, Base64-encoded JSON Web Key Set (JWKS) is essential for the cluster to securely validate identity tokens. If the JWKS is missing, empty, or improperly formatted, the cluster cannot verify signatures on incoming JWTs, which breaks the secure authentication chain for system workloads. | eyJrZXlzIjpbeyJrdHkiOiJSU0EiLCJub20iOiIifV19 |  |

### fleet Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `membership` | (Output) The name of the managed Hub Membership resource associated to this cluster. Membership names are formatted as projects/<project-number>/locations/global/membership/<cluster-id>. | false | false | None | None | None |
| `project` | The number of the Fleet host project where this cluster will be registered. | true | false | None | None | None |

### logging_config Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `component_config` | The configuration of the logging components Structure is [documented below](#nested_logging_config_component_config). | false | false | None | None | None |

### authorization Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `admin_users` | Users that can perform operations as a cluster admin. A managed ClusterRoleBinding will be created to grant the `cluster-admin` ClusterRole to the users. Up to ten admin users can be provided. For more info on RBAC, see https://kubernetes.io/docs/reference/access-authn-authz/rbac/#user-facing-roles | false | false | None | None | None |
| `admin_groups` | Groups that can perform operations as a cluster admin. A managed ClusterRoleBinding will be created to grant the `cluster-admin` ClusterRole to the groups. Up to ten admin groups can be provided. For more info on RBAC, see https://kubernetes.io/docs/reference/access-authn-authz/rbac/#user-facing-roles | false | false | None | None | None |

### monitoring_config Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `managed_prometheus_config` | Enable Google Cloud Managed Service for Prometheus in the cluster. Structure is [documented below](#nested_monitoring_config_managed_prometheus_config). | false | false | None | None | None |

### binary_authorization Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `evaluation_mode` | Configure Binary Authorization evaluation mode. Possible values are: `DISABLED`, `PROJECT_SINGLETON_POLICY_ENFORCE`. | false | false | None | None | None |

### proxy_config Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `kubernetes_secret` | The Kubernetes Secret resource that contains the HTTP(S) proxy configuration. Structure is [documented below](#nested_proxy_config_kubernetes_secret). | false | false | None | None | None |

### security_posture_config Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `vulnerability_mode` | Sets the mode of the Kubernetes security posture API's workload vulnerability scanning. Possible values are: `VULNERABILITY_DISABLED`, `VULNERABILITY_ENTERPRISE`. | true | false | None | None | None |

### component_config Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `enable_components` | The components to be enabled. Each value may be one of: `SYSTEM_COMPONENTS`, `WORKLOADS`. | false | true | Configuring specific logging components ensures that critical system-level data is streamed to Google Cloud Logging for long-term retention and analysis. | SYSTEM_COMPONENTS | WORKLOADS |

### managed_prometheus_config Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `enabled` | Enable Managed Collection. | false | true | Managed Prometheus provides a scalable, secure way to collect metrics from the cluster. Disabling it creates a blind spot in the infrastructure's security posture. | True | False |

### kubernetes_secret Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `name` | Name of the kubernetes secret containing the proxy config. | true | false | None | None | None |
| `namespace` | Namespace of the kubernetes secret containing the proxy config. | true | true | Restricting the namespace to 'kube-system' or 'gatekeeper-system' ensures that only administrative users with high-level permissions can manage the proxy lifecycle, maintaining the integrity of the cluster's network egress path. | kube-system | dev-team |
