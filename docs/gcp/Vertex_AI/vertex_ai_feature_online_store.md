## 🛡️ Policy Deployment Engine: `vertex_ai_feature_online_store`

This section provides a concise policy evaluation for the `vertex_ai_feature_online_store` resource in GCP.

Reference: [Terraform Registry – vertex_ai_feature_online_store](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/vertex_ai_feature_online_store)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | The resource name of the Feature Online Store. This value may be up to 60 characters, and valid characters are [a-z0-9_]. The first character cannot be a number. | true | None | None |
| `labels` | The labels with user-defined metadata to organize your feature online stores. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | None | None |
| `optimized` | Settings for the Optimized store that will be created to serve featureValues for all FeatureViews under this FeatureOnlineStore | false | None | None |
| `region` | The region of feature online store. eg us-central1 | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |
| `force_destroy` |  | none | None | None |

### bigtable Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `auto_scaling` | Autoscaling config applied to Bigtable Instance. Structure is [documented below](#nested_bigtable_auto_scaling). | true | None | None |

### dedicated_serving_endpoint Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `public_endpoint_domain_name` | (Output) Domain name to use for this FeatureOnlineStore | none | None | None |
| `service_attachment` | (Output) Name of the service attachment resource. Applicable only if private service connect is enabled and after FeatureViewSync is created. | none | None | None |
| `private_service_connect_config` | Private service connect config. Structure is [documented below](#nested_dedicated_serving_endpoint_private_service_connect_config). | false | None | None |

### embedding_management Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `enabled` | Enable embedding management. | false | None | None |

### auto_scaling Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `min_node_count` | The minimum number of nodes to scale down to. Must be greater than or equal to 1. | true | None | None |
| `max_node_count` | The maximum number of nodes to scale up to. Must be greater than or equal to minNodeCount, and less than or equal to 10 times of 'minNodeCount'. | true | None | None |
| `cpu_utilization_target` | A percentage of the cluster's CPU capacity. Can be from 10% to 80%. When a cluster's CPU utilization exceeds the target that you have set, Bigtable immediately adds nodes to the cluster. When CPU utilization is substantially lower than the target, Bigtable removes nodes. If not set will default to 50%. | false | None | None |

### private_service_connect_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `enable_private_service_connect` | If set to true, customers will use private service connection to send request. Otherwise, the connection will set to public endpoint. | true | None | None |
| `project_allowlist` | A list of Projects from which the forwarding rule will target the service attachment. | false | None | None |
