## 🛡️ Policy Deployment Engine: `network_management_connectivity_test`

This section provides a concise policy evaluation for the `network_management_connectivity_test` resource in GCP.

Reference: [Terraform Registry – network_management_connectivity_test](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/network_management_connectivity_test)

---

## 1. Argument Reference

### `name`
- Description: (Required) Unique name for the connectivity test.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `source`
- Description: (Required) Required. Source specification of the Connectivity Test. You can use a combination of source IP address, URI of a supported endpoint, project ID, or VPC network to identify the source location. Reachability analysis might proceed even if the source location is ambiguous. However, the test result might include endpoints or use a source that you don't intend to test. Structure is [documented below](#nested_source).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `destination`
- Description: (Required) Required. Destination specification of the Connectivity Test. You can use a combination of destination IP address, URI of a supported endpoint, project ID, or VPC network to identify the destination location. Reachability analysis proceeds even if the destination location is ambiguous. However, the test result might include endpoints or use a destination that you don't intend to test. Structure is [documented below](#nested_destination).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) The user-supplied description of the Connectivity Test. Maximum of 512 characters.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `protocol`
- Description: (Optional) IP Protocol of the test. When not provided, "TCP" is assumed.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `related_projects`
- Description: (Optional) Other projects that may be relevant for reachability analysis. This is applicable to scenarios where a test can cross project boundaries.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) Resource labels to represent user-provided metadata. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `round_trip`
- Description: (Optional) Whether run analysis for the return path from destination to source. Default value is false.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `bypass_firewall_checks`
- Description: (Optional) Whether the analysis should skip firewall checking. Default value is false.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_source"></a>The `source` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ip_address`
- Description: (Optional) The IP address of the endpoint, which can be an external or internal IP.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `port`
- Description: (Optional) The IP protocol port of the endpoint. Only applicable when protocol is TCP or UDP.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `instance`
- Description: (Optional) A Compute Engine instance URI.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `gke_master_cluster`
- Description: (Optional) A cluster URI for Google Kubernetes Engine cluster control plane.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cloud_sql_instance`
- Description: (Optional) A Cloud SQL instance URI.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cloud_function`
- Description: (Optional) A Cloud Function. Structure is [documented below](#nested_source_cloud_function).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `app_engine_version`
- Description: (Optional) An App Engine service version. Structure is [documented below](#nested_source_app_engine_version).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cloud_run_revision`
- Description: (Optional) A Cloud Run revision. Structure is [documented below](#nested_source_cloud_run_revision).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `network`
- Description: (Optional) A VPC network URI.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `network_type`
- Description: (Optional) Type of the network where the endpoint is located. Possible values are: `GCP_NETWORK`, `NON_GCP_NETWORK`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project_id`
- Description: (Optional) Project ID where the endpoint is located. The project ID can be derived from the URI if you provide a endpoint or network URI. The following are two cases where you may need to provide the project ID: 1. Only the IP address is specified, and the IP address is within a Google Cloud project. 2. When you are using Shared VPC and the IP address that you provide is from the service project. In this case, the network that the IP address resides in is defined in the host project. <a name="nested_source_cloud_function"></a>The `cloud_function` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `uri`
- Description: (Optional) A Cloud Function name. <a name="nested_source_app_engine_version"></a>The `app_engine_version` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `uri`
- Description: (Optional) An App Engine service version name. <a name="nested_source_cloud_run_revision"></a>The `cloud_run_revision` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `uri`
- Description: (Optional) A Cloud Run revision URI. <a name="nested_destination"></a>The `destination` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ip_address`
- Description: (Optional) The IP address of the endpoint, which can be an external or internal IP.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `port`
- Description: (Optional) The IP protocol port of the endpoint. Only applicable when protocol is TCP or UDP.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `instance`
- Description: (Optional) A Compute Engine instance URI.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `forwarding_rule`
- Description: (Optional) Forwarding rule URI. Forwarding rules are frontends for load balancers, PSC endpoints, and Protocol Forwarding.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `gke_master_cluster`
- Description: (Optional) A cluster URI for Google Kubernetes Engine cluster control plane.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `fqdn`
- Description: (Optional) A DNS endpoint of Google Kubernetes Engine cluster control plane. Requires gke_master_cluster to be set, can't be used simultaneoulsly with ip_address or network. Applicable only to destination endpoint.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cloud_sql_instance`
- Description: (Optional) A Cloud SQL instance URI.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `redis_instance`
- Description: (Optional) A Redis Instance URI.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `redis_cluster`
- Description: (Optional) A Redis Cluster URI.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `network`
- Description: (Optional) A VPC network URI.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project_id`
- Description: (Optional) Project ID where the endpoint is located. The project ID can be derived from the URI if you provide a endpoint or network URI. The following are two cases where you may need to provide the project ID: 1. Only the IP address is specified, and the IP address is within a Google Cloud project. 2. When you are using Shared VPC and the IP address that you provide is from the service project. In this case, the network that the IP address resides in is defined in the host project.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
