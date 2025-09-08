## 🛡️ Policy Deployment Engine: `container_attached_cluster`

This section provides a concise policy evaluation for the `container_attached_cluster` resource in GCP.

Reference: [Terraform Registry – container_attached_cluster](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/container_attached_cluster)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `location` | The location for the resource | true | None | None |
| `name` | The name of this resource. | true | None | None |
| `platform_version` | The platform version for the cluster (e.g. `1.23.0-gke.1`). | true | None | None |
| `distribution` | The Kubernetes distribution of the underlying attached cluster. Supported values: "eks", "aks", "generic". The generic distribution provides the ability to register or migrate any CNCF conformant cluster. | true | None | None |
| `description` | A human readable description of this attached cluster. Cannot be longer than 255 UTF-8 encoded bytes. | false | None | None |
| `annotations` | Optional. Annotations on the cluster. This field has the same restrictions as Kubernetes annotations. The total size of all keys and values combined is limited to 256k. Key can have 2 segments: prefix (optional) and name (required), separated by a slash (/). Prefix must be a DNS subdomain. Name must be 63 characters or less, begin and end with alphanumerics, with dashes (-), underscores (_), dots (.), and alphanumerics between. **Note**: This field is non-authoritative, and will only manage the annotations present in your configuration. Please refer to the field `effective_annotations` for all of the annotations present on the resource. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |
| `deletion_policy` |  | none | None | None |

### oidc_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `issuer_url` | A JSON Web Token (JWT) issuer URI. `issuer` must start with `https://` | true | None | None |
| `jwks` | OIDC verification keys in JWKS format (RFC 7517). | false | None | None |

### fleet Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `membership` | (Output) The name of the managed Hub Membership resource associated to this cluster. Membership names are formatted as projects/<project-number>/locations/global/membership/<cluster-id>. | none | None | None |
| `project` | The number of the Fleet host project where this cluster will be registered. | true | None | None |

### logging_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `component_config` | The configuration of the logging components Structure is [documented below](#nested_logging_config_component_config). | false | None | None |

### authorization Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `admin_users` | Users that can perform operations as a cluster admin. A managed ClusterRoleBinding will be created to grant the `cluster-admin` ClusterRole to the users. Up to ten admin users can be provided. For more info on RBAC, see https://kubernetes.io/docs/reference/access-authn-authz/rbac/#user-facing-roles | false | None | None |
| `admin_groups` | Groups that can perform operations as a cluster admin. A managed ClusterRoleBinding will be created to grant the `cluster-admin` ClusterRole to the groups. Up to ten admin groups can be provided. For more info on RBAC, see https://kubernetes.io/docs/reference/access-authn-authz/rbac/#user-facing-roles | false | None | None |

### monitoring_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `managed_prometheus_config` | Enable Google Cloud Managed Service for Prometheus in the cluster. Structure is [documented below](#nested_monitoring_config_managed_prometheus_config). | false | None | None |

### binary_authorization Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `evaluation_mode` | Configure Binary Authorization evaluation mode. Possible values are: `DISABLED`, `PROJECT_SINGLETON_POLICY_ENFORCE`. | false | None | None |

### proxy_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `kubernetes_secret` | The Kubernetes Secret resource that contains the HTTP(S) proxy configuration. Structure is [documented below](#nested_proxy_config_kubernetes_secret). | false | None | None |

### security_posture_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `vulnerability_mode` | Sets the mode of the Kubernetes security posture API's workload vulnerability scanning. Possible values are: `VULNERABILITY_DISABLED`, `VULNERABILITY_ENTERPRISE`. | true | None | None |

### component_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `enable_components` | The components to be enabled. Each value may be one of: `SYSTEM_COMPONENTS`, `WORKLOADS`. | false | None | None |

### managed_prometheus_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `enabled` | Enable Managed Collection. | false | None | None |

### kubernetes_secret Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | Name of the kubernetes secret containing the proxy config. | true | None | None |
| `namespace` | Namespace of the kubernetes secret containing the proxy config. | true | None | None |
