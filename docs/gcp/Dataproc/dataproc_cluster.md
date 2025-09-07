## 🛡️ Policy Deployment Engine: `dataproc_cluster`

This section provides a concise policy evaluation for the `dataproc_cluster` resource in GCP.

Reference: [Terraform Registry – dataproc_cluster](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/dataproc_cluster)

---

## 1. Argument Reference

### `name`
- Description: zone. - - -
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: is not provided, the provider project is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `region`
- Description: Defaults to `global`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: instances in the cluster. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `terraform_labels`
- Description: The combination of labels configured directly on the resource and default labels configured on the provider.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `effective_labels`
- Description: instances in the cluster. GCP generates some itself including `goog-dataproc-cluster-name` which is the name of the cluster.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `virtual_cluster_config`
- Description: Structure [defined below](#nested_virtual_cluster_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cluster_config`
- Description: Structure [defined below](#nested_cluster_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `graceful_decommission_timeout`
- Description: Does not affect auto scaling decomissioning from an autoscaling policy. Graceful decommissioning allows removing nodes from the cluster without interrupting jobs in progress. Timeout specifies how long to wait for jobs in progress to finish before forcefully removing nodes (and potentially interrupting jobs). Default timeout is 0 (for forceful decommission), and the maximum allowed timeout is 1 day. (see JSON representation of [Duration](https://developers.google.com/protocol-buffers/docs/proto3#json)). Only supported on Dataproc image versions 1.2 and higher. For more context see the [docs](https://cloud.google.com/dataproc/docs/reference/rest/v1/projects.regions.clusters/patch#query-parameters) - - - <a name="nested_virtual_cluster_config"></a>The `virtual_cluster_config` block supports: ```hcl virtual_cluster_config { auxiliary_services_config { ... } kubernetes_cluster_config { ... } } ```
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `staging_bucket`
- Description: such as Hadoop jars, between client machines and the cluster. Note: If you don't explicitly specify a `staging_bucket` then GCP will auto create / assign one for you. However, you are not guaranteed an auto generated bucket which is solely dedicated to your cluster; it may be shared with other clusters in the same region/zone also choosing to use the auto generation option.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `staging_bucket`
- Description: such as Hadoop jars, between client machines and the cluster. Note: If you don't explicitly specify a `staging_bucket` then GCP will auto create / assign one for you. However, you are not guaranteed an auto generated bucket which is solely dedicated to your cluster; it may be shared with other clusters in the same region/zone also choosing to use the auto generation option.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `temp_bucket`
- Description: and jobs data, such as Spark and MapReduce history files. Note: If you don't explicitly specify a `temp_bucket` then GCP will auto create / assign one for you.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cluster_tier`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `zone`
- Description: the master and the worker nodes will be created in). If `region` is set to 'global' (default) then `zone` is mandatory, otherwise GCP is able to make use of [Auto Zone Placement](https://cloud.google.com/dataproc/docs/concepts/auto-zone) to determine this automatically for you. Note: This setting additionally determines and restricts which computing resources are available for use with other configs such as `cluster_config.master_config.machine_type` and `cluster_config.worker_config.machine_type`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `network`
- Description: network to the cluster will be part of. Conflicts with `subnetwork`. If neither is specified, this defaults to the "default" network.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `subnetwork`
- Description: subnetwork the cluster will be part of. Conflicts with `network`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `service_account`
- Description: If not specified, the "default" service account is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `service_account_scopes`
- Description: to be made available on all of the node VMs under the `service_account` specified. Both OAuth2 URLs and gcloud short names are supported. To allow full access to all Cloud APIs, use the `cloud-platform` scope. See a complete list of scopes [here](https://cloud.google.com/sdk/gcloud/reference/alpha/compute/instances/set-scopes#--scopes).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `tags`
- Description: Tags are used to identify valid sources or targets for network firewalls.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `internal_ip_only`
- Description: and will have ephemeral external IP addresses assigned to each instance. If set to true, all instances in the cluster will only have internal IP addresses. Note: Private Google Access (also known as `privateIpGoogleAccess`) must be enabled on the subnetwork that the cluster will be launched in.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `metadata`
- Description: (see [Project and instance metadata](https://cloud.google.com/compute/docs/storing-retrieving-metadata#project_and_instance_metadata)).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `reservation_affinity`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `consume_reservation_type`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `key`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `values`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `node_group_affinity`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `node_group_uri`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `confidential_instance_config`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enable_confidential_compute`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

---

## 2. `cluster_config.gce_cluster_config.shielded_instance_config` Block

### `enable_secure_boot`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enable_vtpm`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enable_integrity_monitoring`
- Description: - - - <a name="nested_master_config"></a>The `cluster_config.master_config` block supports: ```hcl cluster_config { master_config { num_instances    = 1 machine_type     = "e2-medium" min_cpu_platform = "Intel Skylake" disk_config { boot_disk_type    = "pd-ssd" boot_disk_size_gb = 30 num_local_ssds    = 1 } } } ```
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `machine_type`
- Description: to create for the master. If not specified, GCP will default to a predetermined computed value (currently `n1-standard-4`).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `min_cpu_platform`
- Description: for the master. If not specified, GCP will default to a predetermined computed value for each zone. See [the guide](https://cloud.google.com/compute/docs/instances/specify-min-cpu-platform) for details about which CPU families are available (and defaulted) for each zone.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `boot_disk_type`
- Description: One of `"pd-ssd"` or `"pd-standard"`. Defaults to `"pd-standard"`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `boot_disk_size_gb`
- Description: in GB. The primary disk contains the boot volume and system libraries, and the smallest allowed disk size is 10GB. GCP will default to a predetermined computed value if not set (currently 500GB). Note: If SSDs are not attached, it also contains the HDFS data blocks and Hadoop working directories.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `num_local_ssds`
- Description: attached to each master cluster node. Defaults to 0.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `local_ssd_interface`
- Description: Valid values: "scsi" (Small Computer System Interface), "nvme" (Non-Volatile Memory Express). See [local SSD performance](https://cloud.google.com/compute/docs/disks/local-ssd#performance).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `accelerator_type`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `accelerator_count`
- Description: ~> The Cloud Dataproc API can return unintuitive error messages when using accelerators; even when you have defined an accelerator, Auto Zone Placement does not exclusively select zones that have that accelerator available. If you get a 400 error that the accelerator can't be found, this is a likely cause. Make sure you check [accelerator availability by zone](https://cloud.google.com/compute/docs/reference/rest/v1/acceleratorTypes/list) if you are trying to use accelerators in a given zone. - - - <a name="nested_worker_config"></a>The `cluster_config.worker_config` block supports: ```hcl cluster_config { worker_config { num_instances    = 3 machine_type     = "e2-medium" min_cpu_platform = "Intel Skylake" min_num_instance = 2 disk_config { boot_disk_type    = "pd-standard" boot_disk_size_gb = 30 num_local_ssds    = 1 } } } ```
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `machine_type`
- Description: to create for the worker nodes. If not specified, GCP will default to a predetermined computed value (currently `n1-standard-4`).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `min_cpu_platform`
- Description: for the master. If not specified, GCP will default to a predetermined computed value for each zone. See [the guide](https://cloud.google.com/compute/docs/instances/specify-min-cpu-platform) for details about which CPU families are available (and defaulted) for each zone.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `boot_disk_type`
- Description: One of `"pd-ssd"` or `"pd-standard"`. Defaults to `"pd-standard"`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `boot_disk_size_gb`
- Description: in GB. The smallest allowed disk size is 10GB. GCP will default to a predetermined computed value if not set (currently 500GB). Note: If SSDs are not attached, it also contains the HDFS data blocks and Hadoop working directories.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `num_local_ssds`
- Description: attached to each worker cluster node. Defaults to 0.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `accelerator_type`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `accelerator_count`
- Description: ~> The Cloud Dataproc API can return unintuitive error messages when using accelerators; even when you have defined an accelerator, Auto Zone Placement does not exclusively select zones that have that accelerator available. If you get a 400 error that the accelerator can't be found, this is a likely cause. Make sure you check [accelerator availability by zone](https://cloud.google.com/compute/docs/reference/rest/v1/acceleratorTypes/list) if you are trying to use accelerators in a given zone. - - - <a name="nested_preemptible_worker_config"></a>The `cluster_config.preemptible_worker_config` block supports: ```hcl cluster_config { preemptible_worker_config { num_instances = 1 disk_config { boot_disk_type    = "pd-standard" boot_disk_size_gb = 30 num_local_ssds    = 1 } instance_flexibility_policy { instance_selection_list { machine_types = ["n2-standard-2","n1-standard-2"] rank          = 1 } instance_selection_list { machine_types = ["n2d-standard-2"] rank          = 3 } provisioning_model_mix { standard_capacity_base = 1 standard_capacity_percent_above_base = 50 } } } } ``` Note: Unlike `worker_config`, you cannot set the `machine_type` value directly. This will be set for you based on whatever was set for the `worker_config.machine_type` value.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `boot_disk_type`
- Description: One of `"pd-ssd"` or `"pd-standard"`. Defaults to `"pd-standard"`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `boot_disk_size_gb`
- Description: in GB. The smallest allowed disk size is 10GB. GCP will default to a predetermined computed value if not set (currently 500GB). Note: If SSDs are not attached, it also contains the HDFS data blocks and Hadoop working directories.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `num_local_ssds`
- Description: attached to each preemptible worker node. Defaults to 0.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `instance_selection_list`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `machine_types`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `rank`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `provisioning_model_mix`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `standard_capacity_base`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `standard_capacity_percent_above_base`
- Description: - - - <a name="nested_software_config"></a>The `cluster_config.software_config` block supports: ```hcl cluster_config { # Override or set some custom properties software_config { image_version = "2.0.35-debian10" override_properties = { "dataproc:dataproc.allow.zero.workers" = "true" } } } ```
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `image_version`
- Description: for the cluster - this controls the sets of software versions installed onto the nodes when you create clusters. If not specified, defaults to the latest version. For a list of valid versions see [Cloud Dataproc versions](https://cloud.google.com/dataproc/docs/concepts/dataproc-versions)
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `override_properties`
- Description: used to modify various aspects of the common configuration files used when creating a cluster. For a list of valid properties please see [Cluster properties](https://cloud.google.com/dataproc/docs/concepts/cluster-properties)
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `optional_components`
- Description: - - - <a name="nested_security_config"></a>The `cluster_config.security_config` block supports: ```hcl cluster_config { # Override or set some custom properties security_config { kerberos_config { kms_key_uri = "projects/projectId/locations/locationId/keyRings/keyRingId/cryptoKeys/keyId" root_principal_password_uri = "bucketId/o/objectId" } identity_config { user_service_account_mapping = { "user@company.com" = "service-account@iam.gserviceaccounts.com" } } } } ```
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cross_realm_trust_admin_server`
- Description: remote trusted realm in a cross realm trust relationship.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cross_realm_trust_kdc`
- Description: remote trusted realm in a cross realm trust relationship.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cross_realm_trust_realm`
- Description: trust, should the user enable cross realm trust.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cross_realm_trust_shared_password_uri`
- Description: encrypted file containing the shared password between the on-cluster Kerberos realm and the remote trusted realm, in a cross realm trust relationship.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enable_kerberos`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `kdc_db_key_uri`
- Description: the master key of the KDC database.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `key_password_uri`
- Description: the password to the user provided key. For the self-signed certificate, this password is generated by Dataproc.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `keystore_uri`
- Description: If not provided, Dataproc will provide a self-signed certificate.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `keystore_password_uri`
- Description: the password to the user provided keystore. For the self-signed certificated, the password is generated by Dataproc.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `kms_key_uri`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `realm`
- Description: uppercased domain of hostnames will be the realm.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `root_principal_password_uri`
- Description: containing the root principal password.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `tgt_lifetime_hours`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `truststore_password_uri`
- Description: containing the password to the user provided truststore. For the self-signed certificate, this password is generated by Dataproc.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `truststore_uri`
- Description: SSL encryption. If not provided, Dataproc will provide a self-signed certificate.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `user_service_account_mapping`
- Description: in a service account based multi-tenant cluster - - - <a name="nested_autoscaling_config"></a>The `cluster_config.autoscaling_config` block supports: ```hcl cluster_config { # Override or set some custom properties autoscaling_config { policy_uri = "projects/projectId/locations/region/autoscalingPolicies/policyId" } } ```
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `policy_uri`
- Description: Only resource names including projectid and location (region) are valid. Examples: `https://www.googleapis.com/compute/v1/projects/[projectId]/locations/[dataproc_region]/autoscalingPolicies/[policy_id]` `projects/[projectId]/locations/[dataproc_region]/autoscalingPolicies/[policy_id]` Note that the policy must be in the same project and Cloud Dataproc region. - - - <a name="nested_initialization_action"></a>The `initialization_action` block (Optional) can be specified multiple times and supports: ```hcl cluster_config { # You can define multiple initialization_action blocks initialization_action { script      = "gs://dataproc-initialization-actions/stackdriver/stackdriver.sh" timeout_sec = 500 } } ```
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `timeout_sec`
- Description: allowed to take to execute its action. GCP will default to a predetermined computed value if not set (currently 300). - - - <a name="nested_encryption_config"></a>The `encryption_config` block supports: ```hcl cluster_config { encryption_config { kms_key_name = "projects/projectId/locations/region/keyRings/keyRingName/cryptoKeys/keyName" } } ```
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `kms_key_name`
- Description: all instances in the cluster. - - - <a name="nested_dataproc_metric_config"></a>The `dataproc_metric_config` block supports: ```hcl dataproc_metric_config { metrics { metric_source = "HDFS" metric_overrides = ["yarn:ResourceManager:QueueMetrics:AppsCompleted"] } } ```
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `metrics`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `metric_source`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `metric_overrides`
- Description: - - - <a name="nested_auxiliary_node_groups"></a>The `auxiliary_node_groups` block supports: ```hcl auxiliary_node_groups{ node_group { roles = ["DRIVER"] node_group_config{ num_instances=2 machine_type="n1-standard-2" min_cpu_platform = "AMD Rome" disk_config { boot_disk_size_gb = 35 boot_disk_type = "pd-standard" num_local_ssds = 1 } accelerators { accelerator_count = 1 accelerator_type  = "nvidia-tesla-t4" } } } } ```
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `node_group`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `roles`
- Description: One of `"DRIVER"`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `node_group_config`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `machine_type`
- Description: to create for the node group. If not specified, GCP will default to a predetermined computed value (currently `n1-standard-4`).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `min_cpu_platform`
- Description: for the node group. If not specified, GCP will default to a predetermined computed value for each zone. See [the guide](https://cloud.google.com/compute/docs/instances/specify-min-cpu-platform) for details about which CPU families are available (and defaulted) for each zone.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `boot_disk_type`
- Description: One of `"pd-ssd"` or `"pd-standard"`. Defaults to `"pd-standard"`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `boot_disk_size_gb`
- Description: in GB. The primary disk contains the boot volume and system libraries, and the smallest allowed disk size is 10GB. GCP will default to a predetermined computed value if not set (currently 500GB). Note: If SSDs are not attached, it also contains the HDFS data blocks and Hadoop working directories.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `num_local_ssds`
- Description: Defaults to 0.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `accelerator_type`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `accelerator_count`
- Description: - - - <a name="nested_lifecycle_config"></a>The `lifecycle_config` block supports: ```hcl cluster_config { lifecycle_config { idle_delete_ttl = "10m" auto_delete_time = "2120-01-01T12:00:00.01Z" } } ```
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `idle_delete_ttl`
- Description: (no jobs running). After this TTL, the cluster will be deleted. Valid range: [10m, 14d].
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `auto_delete_time`
- Description: A timestamp in RFC3339 UTC "Zulu" format, accurate to nanoseconds. Example: "2014-10-02T15:01:23.045123456Z". - - - <a name="nested_endpoint_config"></a>The `endpoint_config` block (Optional, Computed, Beta) supports: ```hcl cluster_config { endpoint_config { enable_http_port_access = true } } ```
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enable_http_port_access`
- Description: on the cluster from external sources (aka Component Gateway). Defaults to false. <a name="nested_metastore_config"></a>The `metastore_config` block (Optional, Computed, Beta) supports: ```hcl cluster_config { metastore_config { dataproc_metastore_service = "projects/projectId/locations/region/services/serviceName" } } ```
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `dataproc_metastore_service`
- Description: Only resource names including projectid and location (region) are valid. Examples: `projects/[projectId]/locations/[dataproc_region]/services/[service-name]`
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
