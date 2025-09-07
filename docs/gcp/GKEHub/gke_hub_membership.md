## 🛡️ Policy Deployment Engine: `gke_hub_membership`

This section provides a concise policy evaluation for the `gke_hub_membership` resource in GCP.

Reference: [Terraform Registry – gke_hub_membership](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/gke_hub_membership)

---

## 1. Argument Reference

### `membership_id`
- Description: (Required) The client-provided identifier of the membership.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional, [Beta](https://terraform.io/docs/providers/google/guides/provider_versions.html), Deprecated) The name of this entity type to be displayed on the console. This field is unavailable in v1 of the API. ~> **Warning:** `description` is deprecated and will be removed in a future major release.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) Labels to apply to this membership. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `endpoint`
- Description: (Optional) If this Membership is a Kubernetes API server hosted on GKE, this is a self link to its GCP resource. Structure is [documented below](#nested_endpoint).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `authority`
- Description: (Optional) Authority encodes how Google will recognize identities from this Membership. See the workload identity documentation for more details: https://cloud.google.com/kubernetes-engine/docs/how-to/workload-identity Structure is [documented below](#nested_authority).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Optional) Location of the membership. The default value is `global`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_endpoint"></a>The `endpoint` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `gke_cluster`
- Description: (Optional) If this Membership is a Kubernetes API server hosted on GKE, this is a self link to its GCP resource. Structure is [documented below](#nested_endpoint_gke_cluster). <a name="nested_endpoint_gke_cluster"></a>The `gke_cluster` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `resource_link`
- Description: (Required) Self-link of the GCP resource for the GKE cluster. For example: `//container.googleapis.com/projects/my-project/locations/us-west1-a/clusters/my-cluster`. It can be at the most 1000 characters in length. If the cluster is provisioned with Terraform, this can be `"//container.googleapis.com/${google_container_cluster.my-cluster.id}"` or `google_container_cluster.my-cluster.id`. <a name="nested_authority"></a>The `authority` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `issuer`
- Description: (Required) A JSON Web Token (JWT) issuer URI. `issuer` must start with `https://` and // be a valid with length <2000 characters. For example: `https://container.googleapis.com/v1/projects/my-project/locations/us-west1/clusters/my-cluster`. If the cluster is provisioned with Terraform, this is `"https://container.googleapis.com/v1/${google_container_cluster.my-cluster.id}"`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
