## 🛡️ Policy Deployment Engine: `vertex_ai_index_endpoint_deployed_index`

This section provides a concise policy evaluation for the `vertex_ai_index_endpoint_deployed_index` resource in GCP.

Reference: [Terraform Registry – vertex_ai_index_endpoint_deployed_index](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/vertex_ai_index_endpoint_deployed_index)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `deployed_index_id` | The user specified ID of the DeployedIndex. The ID can be up to 128 characters long and must start with a letter and only contain letters, numbers, and underscores. The ID must be unique within the project it is created in. | true | None | None |
| `index` | The name of the Index this is the deployment of. | true | None | None |
| `index_endpoint` | Identifies the index endpoint. Must be in the format 'projects/{{project}}/locations/{{region}}/indexEndpoints/{{indexEndpoint}}' | true | None | None |
| `display_name` | The display name of the Index. The name can be up to 128 characters long and can consist of any UTF-8 characters. | false | None | None |
| `enable_access_logging` | If true, private endpoint's access logs are sent to Cloud Logging. | false | None | None |
| `reserved_ip_ranges` | A list of reserved ip ranges under the VPC network that can be used for this DeployedIndex. If set, we will deploy the index within the provided ip ranges. Otherwise, the index might be deployed to any ip ranges under the provided VPC network. The value should be the name of the address (https://cloud.google.com/compute/docs/reference/rest/v1/addresses) Example: ['vertex-ai-ip-range']. For more information about subnets and network IP ranges, please see https://cloud.google.com/vpc/docs/subnets#manually_created_subnet_ip_ranges. | false | None | None |
| `deployment_group` | The deployment group can be no longer than 64 characters (eg: 'test', 'prod'). If not set, we will use the 'default' deployment group. Creating deployment_groups with reserved_ip_ranges is a recommended practice when the peered network has multiple peering ranges. This creates your deployments from predictable IP spaces for easier traffic administration. Also, one deployment_group (except 'default') can only be used with the same reserved_ip_ranges which means if the deployment_group has been used with reserved_ip_ranges: [a, b, c], using it with [a, b] or [d, e] is disallowed. [See the official documentation here](https://cloud.google.com/vertex-ai/docs/reference/rest/v1/projects.locations.indexEndpoints#DeployedIndex.FIELDS.deployment_group). Note: we only support up to 5 deployment groups (not including 'default'). | false | None | None |
| `region` | The region of the index endpoint deployment. eg us-central1 | false | None | None |

### automatic_resources Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `min_replica_count` | The minimum number of replicas this DeployedModel will be always deployed on. If minReplicaCount is not set, the default value is 2 (we don't provide SLA when minReplicaCount=1). If traffic against it increases, it may dynamically be deployed onto more replicas up to [maxReplicaCount](https://cloud.google.com/vertex-ai/docs/reference/rest/v1/AutomaticResources#FIELDS.max_replica_count), and as traffic decreases, some of these extra replicas may be freed. If the requested value is too large, the deployment will error. | false | None | None |
| `max_replica_count` | The maximum number of replicas this DeployedModel may be deployed on when the traffic against it increases. If maxReplicaCount is not set, the default value is minReplicaCount. The max allowed replica count is 1000. The maximum number of replicas this DeployedModel may be deployed on when the traffic against it increases. If the requested value is too large, the deployment will error, but if deployment succeeds then the ability to scale the model to that many replicas is guaranteed (barring service outages). If traffic against the DeployedModel increases beyond what its replicas at maximum may handle, a portion of the traffic will be dropped. If this value is not provided, a no upper bound for scaling under heavy traffic will be assume, though Vertex AI may be unable to scale beyond certain replica number. | false | None | None |

### dedicated_resources Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `machine_spec` | The minimum number of replicas this DeployedModel will be always deployed on. Structure is [documented below](#nested_dedicated_resources_machine_spec). | true | None | None |
| `min_replica_count` | The minimum number of machine replicas this DeployedModel will be always deployed on. This value must be greater than or equal to 1. | true | None | None |
| `max_replica_count` | The maximum number of replicas this DeployedModel may be deployed on when the traffic against it increases. If maxReplicaCount is not set, the default value is minReplicaCount | false | None | None |

### deployed_index_auth_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `auth_provider` | Defines the authentication provider that the DeployedIndex uses. Structure is [documented below](#nested_deployed_index_auth_config_auth_provider). | false | None | None |

### machine_spec Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `machine_type` | The type of the machine. See the [list of machine types supported for prediction](https://cloud.google.com/vertex-ai/docs/predictions/configure-compute#machine-types) See the [list of machine types supported for custom training](https://cloud.google.com/vertex-ai/docs/training/configure-compute#machine-types). For [DeployedModel](https://cloud.google.com/vertex-ai/docs/reference/rest/v1/projects.locations.endpoints#DeployedModel) this field is optional, and the default value is n1-standard-2. For [BatchPredictionJob](https://cloud.google.com/vertex-ai/docs/reference/rest/v1/projects.locations.batchPredictionJobs#BatchPredictionJob) or as part of [WorkerPoolSpec](https://cloud.google.com/vertex-ai/docs/reference/rest/v1/CustomJobSpec#WorkerPoolSpec) this field is required. | false | None | None |

### auth_provider Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `audiences` | The list of JWT audiences. that are allowed to access. A JWT containing any of these audiences will be accepted. | false | None | None |
| `allowed_issuers` | A list of allowed JWT issuers. Each entry must be a valid Google service account, in the following format: service-account-name@project-id.iam.gserviceaccount.com | false | None | None |
