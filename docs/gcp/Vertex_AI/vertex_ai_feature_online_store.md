## 🛡️ Policy Deployment Engine: `vertex_ai_feature_online_store`

This section provides a concise policy evaluation for the `vertex_ai_feature_online_store` resource in GCP.

Reference: [Terraform Registry – vertex_ai_feature_online_store](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/vertex_ai_feature_online_store)

---

## 1. Argument Reference

### `name`
- Description: (Required) The resource name of the Feature Online Store. This value may be up to 60 characters, and valid characters are [a-z0-9_]. The first character cannot be a number.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) The labels with user-defined metadata to organize your feature online stores. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `bigtable`
- Description: (Optional) Settings for Cloud Bigtable instance that will be created to serve featureValues for all FeatureViews under this FeatureOnlineStore. Structure is [documented below](#nested_bigtable).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `optimized`
- Description: (Optional) Settings for the Optimized store that will be created to serve featureValues for all FeatureViews under this FeatureOnlineStore
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `dedicated_serving_endpoint`
- Description: (Optional) The dedicated serving endpoint for this FeatureOnlineStore, which is different from common vertex service endpoint. Only need to be set when you choose Optimized storage type or enable EmbeddingManagement. Will use public endpoint by default. Structure is [documented below](#nested_dedicated_serving_endpoint).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `embedding_management`
- Description: (Optional, [Beta](https://terraform.io/docs/providers/google/guides/provider_versions.html), Deprecated) The settings for embedding management in FeatureOnlineStore. Embedding management can only be set for BigTable. It is enabled by default for optimized storagetype. Structure is [documented below](#nested_embedding_management). ~> **Warning:** `embedding_management` is deprecated. This field is no longer needed anymore and embedding management is automatically enabled when specifying Optimized storage type
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `region`
- Description: (Optional) The region of feature online store. eg us-central1
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `force_destroy`
- Description: <a name="nested_bigtable"></a>The `bigtable` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `auto_scaling`
- Description: (Required) Autoscaling config applied to Bigtable Instance. Structure is [documented below](#nested_bigtable_auto_scaling). <a name="nested_bigtable_auto_scaling"></a>The `auto_scaling` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `min_node_count`
- Description: (Required) The minimum number of nodes to scale down to. Must be greater than or equal to 1.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `max_node_count`
- Description: (Required) The maximum number of nodes to scale up to. Must be greater than or equal to minNodeCount, and less than or equal to 10 times of 'minNodeCount'.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cpu_utilization_target`
- Description: (Optional) A percentage of the cluster's CPU capacity. Can be from 10% to 80%. When a cluster's CPU utilization exceeds the target that you have set, Bigtable immediately adds nodes to the cluster. When CPU utilization is substantially lower than the target, Bigtable removes nodes. If not set will default to 50%. <a name="nested_dedicated_serving_endpoint"></a>The `dedicated_serving_endpoint` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `public_endpoint_domain_name`
- Description: (Output) Domain name to use for this FeatureOnlineStore
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `service_attachment`
- Description: (Output) Name of the service attachment resource. Applicable only if private service connect is enabled and after FeatureViewSync is created.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `private_service_connect_config`
- Description: (Optional) Private service connect config. Structure is [documented below](#nested_dedicated_serving_endpoint_private_service_connect_config). <a name="nested_dedicated_serving_endpoint_private_service_connect_config"></a>The `private_service_connect_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enable_private_service_connect`
- Description: (Required) If set to true, customers will use private service connection to send request. Otherwise, the connection will set to public endpoint.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project_allowlist`
- Description: (Optional) A list of Projects from which the forwarding rule will target the service attachment. <a name="nested_embedding_management"></a>The `embedding_management` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enabled`
- Description: (Optional) Enable embedding management.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
