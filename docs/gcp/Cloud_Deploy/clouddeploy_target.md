## 🛡️ Policy Deployment Engine: `clouddeploy_target`

This section provides a concise policy evaluation for the `clouddeploy_target` resource in GCP.

Reference: [Terraform Registry – clouddeploy_target](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/clouddeploy_target)

---

## 1. Argument Reference

### `location`
- Description: (Required) The location for the resource
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Required) Name of the `Target`. Format is `[a-z]([a-z0-9-]{0,61}[a-z0-9])?`. - - -
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `annotations`
- Description: (Optional) Optional. User annotations. These attributes can only be set and used by the user, and not by Google Cloud Deploy. See https://google.aip.dev/128#annotations for more details such as format and size limitations. **Note**: This field is non-authoritative, and will only manage the annotations present in your configuration. Please refer to the field `effective_annotations` for all of the annotations present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `anthos_cluster`
- Description: (Optional) Information specifying an Anthos Cluster.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `associated_entities`
- Description: (Optional) Optional. Map of entity IDs to their associated entities. Associated entities allows specifying places other than the deployment target for specific features. For example, the Gateway API canary can be configured to deploy the HTTPRoute to a different cluster(s) than the deployment cluster using associated entities. An entity ID must consist of lower-case letters, numbers, and hyphens, start with a letter and end with a letter or a number, and have a max length of 63 characters. In other words, it must match the following regex: `^[a-z]([a-z0-9-]{0,61}[a-z0-9])?$`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `custom_target`
- Description: (Optional) Optional. Information specifying a Custom Target.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `deploy_parameters`
- Description: (Optional) Optional. The deploy parameters to use for this target.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) Optional. Description of the `Target`. Max length is 255 characters.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `execution_configs`
- Description: (Optional) Configurations for all execution that relates to this `Target`. Each `ExecutionEnvironmentUsage` value may only be used in a single configuration; using the same value multiple times is an error. When one or more configurations are specified, they must include the `RENDER` and `DEPLOY` `ExecutionEnvironmentUsage` values. When no configurations are specified, execution will use the default specified in `DefaultPool`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `gke`
- Description: (Optional) Information specifying a GKE Cluster.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) Optional. Labels are attributes that can be set and used by both the user and by Google Cloud Deploy. Labels must meet the following constraints: * Keys and values can contain only lowercase letters, numeric characters, underscores, and dashes. * All characters must use UTF-8 encoding, and international characters are allowed. * Keys must start with a lowercase letter or international character. * Each resource is limited to a maximum of 64 labels. Both keys and values are additionally constrained to be <= 128 bytes. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `multi_target`
- Description: (Optional) Information specifying a multiTarget.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: (Optional) The project for the resource
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `require_approval`
- Description: (Optional) Optional. Whether or not the `Target` requires approval.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `run`
- Description: (Optional) Information specifying a Cloud Run deployment target.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

---

## 2. `anthos_cluster` Block

### `membership`
- Description: (Optional) Membership of the GKE Hub-registered cluster to which to apply the Skaffold configuration. Format is `projects/{project}/locations/{location}/memberships/{membership_name}`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

---

## 2. `associated_entities` Block

### `anthos_clusters`
- Description: (Optional) Optional. Information specifying Anthos clusters as associated entities.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `entity_id`
- Description: (Required) The name for the key in the map for which this object is mapped to in the API
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `gke_clusters`
- Description: (Optional) Optional. Information specifying GKE clusters as associated entities.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

---

## 2. `anthos_clusters` Block

### `membership`
- Description: (Optional) Optional. Membership of the GKE Hub-registered cluster to which to apply the Skaffold configuration. Format is `projects/{project}/locations/{location}/memberships/{membership_name}`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

---

## 2. `gke_clusters` Block

### `cluster`
- Description: (Optional) Optional. Information specifying a GKE Cluster. Format is `projects/{project_id}/locations/{location_id}/clusters/{cluster_id}`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `internal_ip`
- Description: (Optional) Optional. If true, `cluster` is accessed using the private IP address of the control plane endpoint. Otherwise, the default IP address of the control plane endpoint is used. The default IP address is the private IP address for clusters with private control-plane endpoints and the public IP address otherwise. Only specify this option when `cluster` is a [private GKE cluster](https://cloud.google.com/kubernetes-engine/docs/concepts/private-cluster-concept).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `proxy_url`
- Description: (Optional) Optional. If set, used to configure a [proxy](https://kubernetes.io/docs/concepts/configuration/organize-cluster-access-kubeconfig/#proxy) to the Kubernetes server.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

---

## 2. `custom_target` Block

### `custom_target_type`
- Description: (Required) Required. The name of the CustomTargetType. Format must be `projects/{project}/locations/{location}/customTargetTypes/{custom_target_type}`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

---

## 2. `execution_configs` Block

### `artifact_storage`
- Description: (Optional) Optional. Cloud Storage location in which to store execution outputs. This can either be a bucket ("gs://my-bucket") or a path within a bucket ("gs://my-bucket/my-dir"). If unspecified, a default bucket located in the same region will be used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `execution_timeout`
- Description: (Optional) Optional. Execution timeout for a Cloud Build Execution. This must be between 10m and 24h in seconds format. If unspecified, a default timeout of 1h is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `service_account`
- Description: (Optional) Optional. Google service account to use for execution. If unspecified, the project execution service account (-compute@developer.gserviceaccount.com) is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `usages`
- Description: (Required) Required. Usages when this configuration should be applied.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `verbose`
- Description: (Optional) Optional. If true, additional logging will be enabled when running builds in this execution environment.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `worker_pool`
- Description: (Optional) Optional. The resource name of the `WorkerPool`, with the format `projects/{project}/locations/{location}/workerPools/{worker_pool}`. If this optional field is unspecified, the default Cloud Build pool will be used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

---

## 2. `gke` Block

### `cluster`
- Description: (Optional) Information specifying a GKE Cluster. Format is `projects/{project_id}/locations/{location_id}/clusters/{cluster_id}.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `dns_endpoint`
- Description: (Optional) Optional. If set, the cluster will be accessed using the DNS endpoint. Note that both `dns_endpoint` and `internal_ip` cannot be set to true.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `internal_ip`
- Description: (Optional) Optional. If true, `cluster` is accessed using the private IP address of the control plane endpoint. Otherwise, the default IP address of the control plane endpoint is used. The default IP address is the private IP address for clusters with private control-plane endpoints and the public IP address otherwise. Only specify this option when `cluster` is a [private GKE cluster](https://cloud.google.com/kubernetes-engine/docs/concepts/private-cluster-concept).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `proxy_url`
- Description: (Optional) Optional. If set, used to configure a [proxy](https://kubernetes.io/docs/concepts/configuration/organize-cluster-access-kubeconfig/#proxy) to the Kubernetes server.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

---

## 2. `multi_target` Block

### `target_ids`
- Description: (Required) Required. The target_ids of this multiTarget.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

---

## 2. `run` Block

### `location`
- Description: (Required) Required. The location where the Cloud Run Service should be located. Format is `projects/{project}/locations/{location}`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
