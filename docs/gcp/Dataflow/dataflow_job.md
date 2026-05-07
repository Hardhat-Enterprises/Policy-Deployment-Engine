## 🛡️ Policy Deployment Engine: `dataflow_job`

This section provides a concise policy evaluation for the `dataflow_job` resource in GCP.

Reference: [Terraform Registry – dataflow_job](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/dataflow_job)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `name` | A unique name for the resource, required by Dataflow. | true | false | N/A | N/A | N/A |
| `template_gcs_path` | The GCS path to the Dataflow job template. | true | false | N/A | N/A | N/A |
| `temp_gcs_location` | A writeable location on GCS for the Dataflow job to dump its temporary data. | true | false | N/A | N/A | N/A |
| `parameters` | Key/value pairs to be passed to the Dataflow job (as used in the template). Keys are case-sensitive based on the language on which the pipeline is coded, mostly Java. Note: do not configure Dataflow options here in parameters. | false | false | N/A | N/A | N/A |
| `labels` | User labels to be specified for the job. Keys and values should follow the restrictions specified in the labeling restrictions page. Note: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field effective_labels for all of the labels present on the resource. | false | false | N/A | N/A | N/A |
| `terraform_labels` | The combination of labels configured directly on the resource and default labels configured on the provider. | false | false | N/A | N/A | N/A |
| `effective_labels` | All of labels (key/value pairs) present on the resource in GCP, including the labels configured through Terraform, other clients and services. | false | false | N/A | N/A | N/A |
| `transform_name_mapping` | Only applicable when updating a pipeline. Map of transform name prefixes of the job to be replaced with the corresponding name prefixes of the new job. | false | false | N/A | N/A | N/A |
| `max_workers` | The number of workers permitted to work on the job. More workers may improve processing speed at additional cost. | false | false | N/A | N/A | N/A |
| `on_delete` | One of 'drain' or 'cancel'. Specifies behavior of deletion during terraform destroy. The 'drain' option causes Dataflow to finish processing in-flight data while not accepting new data. The 'cancel' option causes Dataflow to cancel the job immediately. | false | true | Using 'drain' ensures that in-flight data is fully processed before job termination, preventing data loss and maintaining data integrity in production pipelines. | drain | cancel |
| `skip_wait_on_job_termination` | If true, treat DRAINING and CANCELLING as terminal states and do not wait for further changes before removing from terraform state and moving on. | false | false | N/A | N/A | N/A |
| `project` | The project in which the resource belongs. If it is not provided, the provider project is used. | false | false | N/A | N/A | N/A |
| `zone` | The zone in which the created job should run. If it is not provided, the provider zone is used. | false | false | N/A | N/A | N/A |
| `region` | The region in which the created job should run. | false | false | N/A | N/A | N/A |
| `service_account_email` | The Service Account email used to create the job. This should be just an email e.g. myserviceaccount@myproject.iam.gserviceaccount.com. | false | true | Specifying a dedicated service account enforces the principle of least privilege. Without it, the default Compute Engine service account is used, which typically has overly broad permissions. | dataflow-sa@my-project.iam.gserviceaccount.com | (not set — uses default Compute Engine SA) |
| `network` | The network to which VMs will be assigned. If it is not provided, 'default' will be used. | false | true | The default VPC network lacks proper firewall rules and network segmentation. Using a dedicated VPC ensures that Dataflow workers operate within a controlled network boundary with appropriate security controls. | projects/my-project/global/networks/approved-vpc | default |
| `subnetwork` | The subnetwork to which VMs will be assigned. Should be of the form 'regions/REGION/subnetworks/SUBNETWORK'. | false | false | N/A | N/A | N/A |
| `machine_type` | The machine type to use for the job. | false | false | N/A | N/A | N/A |
| `kms_key_name` | The name for the Cloud KMS key for the job. Key format is: projects/PROJECT_ID/locations/LOCATION/keyRings/KEY_RING/cryptoKeys/KEY. | false | true | Customer-managed encryption keys (CMEK) ensure that data processed by Dataflow is encrypted with keys controlled by the organization, meeting compliance requirements and providing an additional layer of data protection. | projects/my-project/locations/us-central1/keyRings/my-keyring/cryptoKeys/my-key | (not set — uses Google-managed keys) |
| `ip_configuration` | The configuration for VM IPs. Options are 'WORKER_IP_PUBLIC' or 'WORKER_IP_PRIVATE'. | false | true | Assigning public IPs to Dataflow workers increases the attack surface by exposing VMs to the internet. Using private IPs ensures workers communicate only within the VPC, reducing the risk of unauthorized access. | WORKER_IP_PRIVATE | WORKER_IP_PUBLIC |
| `additional_experiments` | List of experiments that should be used by the job. | false | false | N/A | N/A | N/A |
| `enable_streaming_engine` | Indicates if the job should use the streaming engine feature. When enabled, the Dataflow service runs the pipeline steps on the Dataflow service backend, reducing the number of persistent disks and worker CPUs needed. | false | true | Streaming Engine offloads pipeline execution to the managed Dataflow service backend, reducing the number of worker VMs and persistent disks. This minimizes the attack surface and improves resource efficiency. | true | false |
