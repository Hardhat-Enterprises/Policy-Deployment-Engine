## 🛡️ Policy Deployment Engine: `dns_response_policy`

This section provides a concise policy evaluation for the `dns_response_policy` resource in GCP.

Reference: [Terraform Registry – dns_response_policy](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/dns_response_policy)

---

## 1. Argument Reference

### `response_policy_name`
- Description: (Required) The user assigned name for this Response Policy, such as `myresponsepolicy`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) The description of the response policy, such as `My new response policy`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `networks`
- Description: (Optional) The list of network names specifying networks to which this policy is applied. Structure is [documented below](#nested_networks).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `gke_clusters`
- Description: (Optional) The list of Google Kubernetes Engine clusters that can see this zone. Structure is [documented below](#nested_gke_clusters).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_networks"></a>The `networks` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `network_url`
- Description: (Required) The fully qualified URL of the VPC network to bind to. This should be formatted like `https://www.googleapis.com/compute/v1/projects/{project}/global/networks/{network}` <a name="nested_gke_clusters"></a>The `gke_clusters` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `gke_cluster_name`
- Description: (Required) The resource name of the cluster to bind this ManagedZone to. This should be specified in the format like `projects/*/locations/*/clusters/*`
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
