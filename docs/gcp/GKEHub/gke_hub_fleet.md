## 🛡️ Policy Deployment Engine: `gke_hub_fleet`

This section provides a concise policy evaluation for the `gke_hub_fleet` resource in GCP.

Reference: [Terraform Registry – gke_hub_fleet](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/gke_hub_fleet)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `display_name` | A user-assigned display name of the Fleet. When present, it must be between 4 to 30 characters. Allowed characters are: lowercase and uppercase letters, numbers, hyphen, single-quote, double-quote, space, and exclamation point. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### default_cluster_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `binary_authorization_config` | Enable/Disable binary authorization features for the cluster. Structure is [documented below](#nested_default_cluster_config_binary_authorization_config). | false | None | None |
| `security_posture_config` | Enable/Disable Security Posture features for the cluster. Structure is [documented below](#nested_default_cluster_config_security_posture_config). | false | None | None |

### binary_authorization_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `evaluation_mode` | Mode of operation for binauthz policy evaluation. Possible values are: `DISABLED`, `POLICY_BINDINGS`. | false | None | None |
| `policy_bindings` | Binauthz policies that apply to this cluster. Structure is [documented below](#nested_default_cluster_config_binary_authorization_config_policy_bindings). | false | None | None |

### policy_bindings Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | The relative resource name of the binauthz platform policy to audit. GKE platform policies have the following format: `projects/{project_number}/platforms/gke/policies/{policy_id}`. | false | None | None |

### security_posture_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `mode` | Sets which mode to use for Security Posture features. Possible values are: `DISABLED`, `BASIC`, `ENTERPRISE`. | false | None | None |
| `vulnerability_mode` | Sets which mode to use for vulnerability scanning. Possible values are: `VULNERABILITY_DISABLED`, `VULNERABILITY_BASIC`, `VULNERABILITY_ENTERPRISE`. | false | None | None |
