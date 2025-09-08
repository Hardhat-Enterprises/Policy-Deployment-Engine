## 🛡️ Policy Deployment Engine: `network_management_connectivity_test`

This section provides a concise policy evaluation for the `network_management_connectivity_test` resource in GCP.

Reference: [Terraform Registry – network_management_connectivity_test](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/network_management_connectivity_test)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | Unique name for the connectivity test. | true | None | None |
| `description` | The user-supplied description of the Connectivity Test. Maximum of 512 characters. | false | None | None |
| `protocol` | IP Protocol of the test. When not provided, "TCP" is assumed. | false | None | None |
| `related_projects` | Other projects that may be relevant for reachability analysis. This is applicable to scenarios where a test can cross project boundaries. | false | None | None |
| `labels` | Resource labels to represent user-provided metadata. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | None | None |
| `round_trip` | Whether run analysis for the return path from destination to source. Default value is false. | false | None | None |
| `bypass_firewall_checks` | Whether the analysis should skip firewall checking. Default value is false. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### source Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `ip_address` | The IP address of the endpoint, which can be an external or internal IP. | false | None | None |
| `port` | The IP protocol port of the endpoint. Only applicable when protocol is TCP or UDP. | false | None | None |
| `instance` | A Compute Engine instance URI. | false | None | None |
| `gke_master_cluster` | A cluster URI for Google Kubernetes Engine cluster control plane. | false | None | None |
| `cloud_sql_instance` | A Cloud SQL instance URI. | false | None | None |
| `cloud_function` | A Cloud Function. Structure is [documented below](#nested_source_cloud_function). | false | None | None |
| `app_engine_version` | An App Engine service version. Structure is [documented below](#nested_source_app_engine_version). | false | None | None |
| `cloud_run_revision` | A Cloud Run revision. Structure is [documented below](#nested_source_cloud_run_revision). | false | None | None |
| `network` | A VPC network URI. | false | None | None |
| `network_type` | Type of the network where the endpoint is located. Possible values are: `GCP_NETWORK`, `NON_GCP_NETWORK`. | false | None | None |
| `project_id` | Project ID where the endpoint is located. The project ID can be derived from the URI if you provide a endpoint or network URI. The following are two cases where you may need to provide the project ID: 1. Only the IP address is specified, and the IP address is within a Google Cloud project. 2. When you are using Shared VPC and the IP address that you provide is from the service project. In this case, the network that the IP address resides in is defined in the host project. | false | None | None |

### destination Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `ip_address` | The IP address of the endpoint, which can be an external or internal IP. | false | None | None |
| `port` | The IP protocol port of the endpoint. Only applicable when protocol is TCP or UDP. | false | None | None |
| `instance` | A Compute Engine instance URI. | false | None | None |
| `forwarding_rule` | Forwarding rule URI. Forwarding rules are frontends for load balancers, PSC endpoints, and Protocol Forwarding. | false | None | None |
| `gke_master_cluster` | A cluster URI for Google Kubernetes Engine cluster control plane. | false | None | None |
| `fqdn` | A DNS endpoint of Google Kubernetes Engine cluster control plane. Requires gke_master_cluster to be set, can't be used simultaneoulsly with ip_address or network. Applicable only to destination endpoint. | false | None | None |
| `cloud_sql_instance` | A Cloud SQL instance URI. | false | None | None |
| `redis_instance` | A Redis Instance URI. | false | None | None |
| `redis_cluster` | A Redis Cluster URI. | false | None | None |
| `network` | A VPC network URI. | false | None | None |
| `project_id` | Project ID where the endpoint is located. The project ID can be derived from the URI if you provide a endpoint or network URI. The following are two cases where you may need to provide the project ID: 1. Only the IP address is specified, and the IP address is within a Google Cloud project. 2. When you are using Shared VPC and the IP address that you provide is from the service project. In this case, the network that the IP address resides in is defined in the host project. | false | None | None |

### cloud_function Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `uri` | A Cloud Function name. | false | None | None |

### app_engine_version Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `uri` | An App Engine service version name. | false | None | None |

### cloud_run_revision Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `uri` | A Cloud Run revision URI. | false | None | None |
