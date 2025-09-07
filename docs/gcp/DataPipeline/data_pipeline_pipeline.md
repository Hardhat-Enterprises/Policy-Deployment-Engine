## 🛡️ Policy Deployment Engine: `data_pipeline_pipeline`

This section provides a concise policy evaluation for the `data_pipeline_pipeline` resource in GCP.

Reference: [Terraform Registry – data_pipeline_pipeline](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/data_pipeline_pipeline)

---

## 1. Argument Reference

### `name`
- Description: (Required) "The pipeline name. For example': 'projects/PROJECT_ID/locations/LOCATION_ID/pipelines/PIPELINE_ID." "- PROJECT_ID can contain letters ([A-Za-z]), numbers ([0-9]), hyphens (-), colons (:), and periods (.). For more information, see Identifying projects." "LOCATION_ID is the canonical ID for the pipeline's location. The list of available locations can be obtained by calling google.cloud.location.Locations.ListLocations. Note that the Data Pipelines service is not available in all regions. It depends on Cloud Scheduler, an App Engine application, so it's only available in App Engine regions." "PIPELINE_ID is the ID of the pipeline. Must be unique for the selected project and location."
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `type`
- Description: (Required) The type of the pipeline. This field affects the scheduling of the pipeline and the type of metrics to show for the pipeline. https://cloud.google.com/dataflow/docs/reference/data-pipelines/rest/v1/projects.locations.pipelines#pipelinetype Possible values are: `PIPELINE_TYPE_UNSPECIFIED`, `PIPELINE_TYPE_BATCH`, `PIPELINE_TYPE_STREAMING`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `state`
- Description: (Required) The state of the pipeline. When the pipeline is created, the state is set to 'PIPELINE_STATE_ACTIVE' by default. State changes can be requested by setting the state to stopping, paused, or resuming. State cannot be changed through pipelines.patch requests. https://cloud.google.com/dataflow/docs/reference/data-pipelines/rest/v1/projects.locations.pipelines#state Possible values are: `STATE_UNSPECIFIED`, `STATE_RESUMING`, `STATE_ACTIVE`, `STATE_STOPPING`, `STATE_ARCHIVED`, `STATE_PAUSED`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `display_name`
- Description: (Optional) The display name of the pipeline. It can contain only letters ([A-Za-z]), numbers ([0-9]), hyphens (-), and underscores (_).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `workload`
- Description: (Optional) Workload information for creating new jobs. https://cloud.google.com/dataflow/docs/reference/data-pipelines/rest/v1/projects.locations.pipelines#workload Structure is [documented below](#nested_workload).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `schedule_info`
- Description: (Optional) Internal scheduling information for a pipeline. If this information is provided, periodic jobs will be created per the schedule. If not, users are responsible for creating jobs externally. https://cloud.google.com/dataflow/docs/reference/data-pipelines/rest/v1/projects.locations.pipelines#schedulespec Structure is [documented below](#nested_schedule_info).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `scheduler_service_account_email`
- Description: (Optional) Optional. A service account email to be used with the Cloud Scheduler job. If not specified, the default compute engine service account will be used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `pipeline_sources`
- Description: (Optional) The sources of the pipeline (for example, Dataplex). The keys and values are set by the corresponding sources during pipeline creation. An object containing a list of "key": value pairs. Example: { "name": "wrench", "mass": "1.3kg", "count": "3" }.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `region`
- Description: (Optional) A reference to the region
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_workload"></a>The `workload` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `dataflow_launch_template_request`
- Description: (Optional) Template information and additional parameters needed to launch a Dataflow job using the standard launch API. https://cloud.google.com/dataflow/docs/reference/data-pipelines/rest/v1/projects.locations.pipelines#launchtemplaterequest Structure is [documented below](#nested_workload_dataflow_launch_template_request).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `dataflow_flex_template_request`
- Description: (Optional) Template information and additional parameters needed to launch a Dataflow job using the flex launch API. https://cloud.google.com/dataflow/docs/reference/data-pipelines/rest/v1/projects.locations.pipelines#launchflextemplaterequest Structure is [documented below](#nested_workload_dataflow_flex_template_request). <a name="nested_workload_dataflow_launch_template_request"></a>The `dataflow_launch_template_request` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project_id`
- Description: (Required) The ID of the Cloud Platform project that the job belongs to.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `validate_only`
- Description: (Optional)
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `launch_parameters`
- Description: (Optional) The parameters of the template to launch. This should be part of the body of the POST request. https://cloud.google.com/dataflow/docs/reference/data-pipelines/rest/v1/projects.locations.pipelines#launchtemplateparameters Structure is [documented below](#nested_workload_dataflow_launch_template_request_launch_parameters).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Optional) The regional endpoint to which to direct the request.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `gcs_path`
- Description: (Optional) A Cloud Storage path to the template from which to create the job. Must be a valid Cloud Storage URL, beginning with 'gs://'. <a name="nested_workload_dataflow_launch_template_request_launch_parameters"></a>The `launch_parameters` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `job_name`
- Description: (Required) The job name to use for the created job.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `parameters`
- Description: (Optional) The runtime parameters to pass to the job. 'An object containing a list of "key": value pairs. Example: { "name": "wrench", "mass": "1.3kg", "count": "3" }.'
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `environment`
- Description: (Optional) The runtime environment for the job. https://cloud.google.com/dataflow/docs/reference/data-pipelines/rest/v1/projects.locations.pipelines#RuntimeEnvironment Structure is [documented below](#nested_workload_dataflow_launch_template_request_launch_parameters_environment).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `update`
- Description: (Optional) If set, replace the existing pipeline with the name specified by jobName with this pipeline, preserving state.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `transform_name_mapping`
- Description: (Optional) Map of transform name prefixes of the job to be replaced to the corresponding name prefixes of the new job. Only applicable when updating a pipeline. 'An object containing a list of "key": value pairs. Example: { "name": "wrench", "mass": "1.3kg", "count": "3" }.' <a name="nested_workload_dataflow_launch_template_request_launch_parameters_environment"></a>The `environment` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `num_workers`
- Description: (Optional) The initial number of Compute Engine instances for the job.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `max_workers`
- Description: (Optional) The maximum number of Compute Engine instances to be made available to your pipeline during execution, from 1 to 1000.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `zone`
- Description: (Optional) The Compute Engine availability zone for launching worker instances to run your pipeline. In the future, workerZone will take precedence.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `service_account_email`
- Description: (Optional) The email address of the service account to run the job as.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `temp_location`
- Description: (Optional) The Cloud Storage path to use for temporary files. Must be a valid Cloud Storage URL, beginning with gs://.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `bypass_temp_dir_validation`
- Description: (Optional) Whether to bypass the safety checks for the job's temporary directory. Use with caution.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `machine_type`
- Description: (Optional) The machine type to use for the job. Defaults to the value from the template if not specified.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `additional_experiments`
- Description: (Optional) Additional experiment flags for the job.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `network`
- Description: (Optional) Network to which VMs will be assigned. If empty or unspecified, the service will use the network "default".
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `subnetwork`
- Description: (Optional) Subnetwork to which VMs will be assigned, if desired. You can specify a subnetwork using either a complete URL or an abbreviated path. Expected to be of the form "https://www.googleapis.com/compute/v1/projects/HOST_PROJECT_ID/regions/REGION/subnetworks/SUBNETWORK" or "regions/REGION/subnetworks/SUBNETWORK". If the subnetwork is located in a Shared VPC network, you must use the complete URL.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `additional_user_labels`
- Description: (Optional) Additional user labels to be specified for the job. Keys and values should follow the restrictions specified in the labeling restrictions page. An object containing a list of key/value pairs. 'Example: { "name": "wrench", "mass": "1kg", "count": "3" }.' 'An object containing a list of "key": value pairs. Example: { "name": "wrench", "mass": "1.3kg", "count": "3" }.'
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `kms_key_name`
- Description: (Optional) 'Name for the Cloud KMS key for the job. The key format is: projects//locations//keyRings//cryptoKeys/'
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ip_configuration`
- Description: (Optional) Configuration for VM IPs. https://cloud.google.com/dataflow/docs/reference/data-pipelines/rest/v1/projects.locations.pipelines#WorkerIPAddressConfiguration Possible values are: `WORKER_IP_UNSPECIFIED`, `WORKER_IP_PUBLIC`, `WORKER_IP_PRIVATE`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `worker_region`
- Description: (Optional) The Compute Engine region (https://cloud.google.com/compute/docs/regions-zones/regions-zones) in which worker processing should occur, e.g. "us-west1". Mutually exclusive with workerZone. If neither workerRegion nor workerZone is specified, default to the control plane's region.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `worker_zone`
- Description: (Optional) The Compute Engine zone (https://cloud.google.com/compute/docs/regions-zones/regions-zones) in which worker processing should occur, e.g. "us-west1-a". Mutually exclusive with workerRegion. If neither workerRegion nor workerZone is specified, a zone in the control plane's region is chosen based on available capacity. If both workerZone and zone are set, workerZone takes precedence.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enable_streaming_engine`
- Description: (Optional) Whether to enable Streaming Engine for the job. <a name="nested_workload_dataflow_flex_template_request"></a>The `dataflow_flex_template_request` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project_id`
- Description: (Required) The ID of the Cloud Platform project that the job belongs to.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `launch_parameter`
- Description: (Required) Parameter to launch a job from a Flex Template. https://cloud.google.com/dataflow/docs/reference/data-pipelines/rest/v1/projects.locations.pipelines#launchflextemplateparameter Structure is [documented below](#nested_workload_dataflow_flex_template_request_launch_parameter).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Required) The regional endpoint to which to direct the request. For example, us-central1, us-west1.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `validate_only`
- Description: (Optional) If true, the request is validated but not actually executed. Defaults to false. <a name="nested_workload_dataflow_flex_template_request_launch_parameter"></a>The `launch_parameter` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `job_name`
- Description: (Required) The job name to use for the created job. For an update job request, the job name should be the same as the existing running job.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `parameters`
- Description: (Optional) 'The parameters for the Flex Template. Example: {"numWorkers":"5"}' 'An object containing a list of "key": value pairs. Example: { "name": "wrench", "mass": "1.3kg", "count": "3" }.'
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `launch_options`
- Description: (Optional) Launch options for this Flex Template job. This is a common set of options across languages and templates. This should not be used to pass job parameters. 'An object containing a list of "key": value pairs. Example: { "name": "wrench", "mass": "1.3kg", "count": "3" }.'
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `environment`
- Description: (Optional) The runtime environment for the Flex Template job. https://cloud.google.com/dataflow/docs/reference/data-pipelines/rest/v1/projects.locations.pipelines#FlexTemplateRuntimeEnvironment Structure is [documented below](#nested_workload_dataflow_flex_template_request_launch_parameter_environment).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `update`
- Description: (Optional) Set this to true if you are sending a request to update a running streaming job. When set, the job name should be the same as the running job.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `transform_name_mappings`
- Description: (Optional) 'Use this to pass transform name mappings for streaming update jobs. Example: {"oldTransformName":"newTransformName",...}' 'An object containing a list of "key": value pairs. Example: { "name": "wrench", "mass": "1.3kg", "count": "3" }.'
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `container_spec_gcs_path`
- Description: (Optional) Cloud Storage path to a file with a JSON-serialized ContainerSpec as content. <a name="nested_workload_dataflow_flex_template_request_launch_parameter_environment"></a>The `environment` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `num_workers`
- Description: (Optional) The initial number of Compute Engine instances for the job.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `max_workers`
- Description: (Optional) The maximum number of Compute Engine instances to be made available to your pipeline during execution, from 1 to 1000.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `zone`
- Description: (Optional) The Compute Engine availability zone for launching worker instances to run your pipeline. In the future, workerZone will take precedence.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `service_account_email`
- Description: (Optional) The email address of the service account to run the job as.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `temp_location`
- Description: (Optional) The Cloud Storage path to use for temporary files. Must be a valid Cloud Storage URL, beginning with gs://.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `machine_type`
- Description: (Optional) The machine type to use for the job. Defaults to the value from the template if not specified.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `additional_experiments`
- Description: (Optional) Additional experiment flags for the job.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `network`
- Description: (Optional) Network to which VMs will be assigned. If empty or unspecified, the service will use the network "default".
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `subnetwork`
- Description: (Optional) Subnetwork to which VMs will be assigned, if desired. You can specify a subnetwork using either a complete URL or an abbreviated path. Expected to be of the form "https://www.googleapis.com/compute/v1/projects/HOST_PROJECT_ID/regions/REGION/subnetworks/SUBNETWORK" or "regions/REGION/subnetworks/SUBNETWORK". If the subnetwork is located in a Shared VPC network, you must use the complete URL.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `additional_user_labels`
- Description: (Optional) Additional user labels to be specified for the job. Keys and values should follow the restrictions specified in the labeling restrictions page. An object containing a list of key/value pairs. 'Example: { "name": "wrench", "mass": "1kg", "count": "3" }.' 'An object containing a list of "key": value pairs. Example: { "name": "wrench", "mass": "1.3kg", "count": "3" }.'
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `kms_key_name`
- Description: (Optional) 'Name for the Cloud KMS key for the job. The key format is: projects//locations//keyRings//cryptoKeys/'
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ip_configuration`
- Description: (Optional) Configuration for VM IPs. https://cloud.google.com/dataflow/docs/reference/data-pipelines/rest/v1/projects.locations.pipelines#WorkerIPAddressConfiguration Possible values are: `WORKER_IP_UNSPECIFIED`, `WORKER_IP_PUBLIC`, `WORKER_IP_PRIVATE`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `worker_region`
- Description: (Optional) The Compute Engine region (https://cloud.google.com/compute/docs/regions-zones/regions-zones) in which worker processing should occur, e.g. "us-west1". Mutually exclusive with workerZone. If neither workerRegion nor workerZone is specified, default to the control plane's region.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `worker_zone`
- Description: (Optional) The Compute Engine zone (https://cloud.google.com/compute/docs/regions-zones/regions-zones) in which worker processing should occur, e.g. "us-west1-a". Mutually exclusive with workerRegion. If neither workerRegion nor workerZone is specified, a zone in the control plane's region is chosen based on available capacity. If both workerZone and zone are set, workerZone takes precedence.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enable_streaming_engine`
- Description: (Optional) Whether to enable Streaming Engine for the job.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `flexrs_goal`
- Description: (Optional) Set FlexRS goal for the job. https://cloud.google.com/dataflow/docs/guides/flexrs https://cloud.google.com/dataflow/docs/reference/data-pipelines/rest/v1/projects.locations.pipelines#FlexResourceSchedulingGoal Possible values are: `FLEXRS_UNSPECIFIED`, `FLEXRS_SPEED_OPTIMIZED`, `FLEXRS_COST_OPTIMIZED`. <a name="nested_schedule_info"></a>The `schedule_info` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `schedule`
- Description: (Optional) Unix-cron format of the schedule. This information is retrieved from the linked Cloud Scheduler.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `time_zone`
- Description: (Optional) Timezone ID. This matches the timezone IDs used by the Cloud Scheduler API. If empty, UTC time is assumed.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `next_job_time`
- Description: (Output) When the next Scheduler job is going to run. A timestamp in RFC3339 UTC "Zulu" format, with nanosecond resolution and up to nine fractional digits. Examples: "2014-10-02T15:01:23Z" and "2014-10-02T15:01:23.045123456Z".
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
