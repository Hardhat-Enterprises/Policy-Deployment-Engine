## 🛡️ Policy Deployment Engine: `dataflow_job`

This section provides a concise policy evaluation for the `dataflow_job` resource in GCP.

Reference: [Terraform Registry – dataflow_job](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/dataflow_job)

---

## Argument Reference
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `name` | The name of the Dataflow job. Must be unique within the project. | true | false | Job names are identifiers and do not impact security. | my-dataflow-job-prod |  |
| `template_gcs_path` | The Google Cloud Storage path to the Dataflow job template. | true | false | Template location does not impact security directly. | gs://my-bucket/templates/my-template | http://example.com/template |
| `temp_gcs_location` | A Google Cloud Storage path for temporary files used during job execution. | true | true | Temporary data may contain sensitive information and should be stored securely. | gs://secure-bucket/dataflow-temp/ | gs://public-bucket/dataflow-temp/ |
| `parameters` | Job parameters passed to the pipeline. Case-sensitive and language-dependent. Do not configure Dataflow options here. | false | false | Parameters are for pipeline logic, not security settings. | {"input":"gs://bucket/input.txt"} | None |
| `labels` | Key/value pairs for organizing and identifying resources. See [labeling restrictions](https://cloud.google.com/compute/docs/labeling-resources#restrictions). | false | false | Labels are for organization and do not impact security. | {"env":"prod"} | None |
| `terraform_labels` | Combined labels from the resource and provider defaults. | false | false | Informational only. | {"team":"analytics"} | None |
| `effective_labels` | All labels present on the resource in GCP, including those set by Terraform and other clients. | false | false | Informational only. | {"env":"prod","team":"analytics"} | None |
| `transform_name_mapping` | Mapping of transform names for template jobs. | false | false | Does not impact security. | None | None |
| `max_workers` | Maximum number of workers to use for the job. | false | false | Controls resource usage, not security. | 10 | None |
| `on_delete` | Action to take on job deletion (e.g., drain, cancel). | false | false | Job deletion policy does not impact security. | drain | cancel |
| `skip_wait_on_job_termination` | If true, Terraform will not wait for job termination. | false | false | Affects deployment speed, not security. | True | False |
| `project` | The GCP project in which the job will run. | true | false | Project selection does not impact job security directly. | my-gcp-project | None |
| `zone` | The zone in which the job will run (if applicable). | false | false | Zone selection does not impact security directly. | us-central1-a | None |
| `region` | The region in which the job will run. | true | false | Region selection does not impact security directly. | us-central1 | None |
| `service_account_email` | The email address of the service account to run the job. | false | true | Service account permissions control job access to resources. | dataflow-sa@my-gcp-project.iam.gserviceaccount.com | default-compute@my-gcp-project.iam.gserviceaccount.com |
| `network` | The VPC network to which the Dataflow job will connect. | true | true | Restricting jobs to approved networks is critical for data security and compliance. | projects/my-gcp-project/global/networks/dataflow-network-prod | projects/my-gcp-project/global/networks/default |
| `subnetwork` | The subnetwork to which the Dataflow job will connect. | true | true | Restricting jobs to approved subnetworks is critical for data security and compliance. | projects/my-gcp-project/regions/us-central1/subnetworks/dataflow-subnet-prod | projects/my-gcp-project/regions/us-central1/subnetworks/default |
| `machine_type` | The type of machine to use for workers. | false | false | Machine type affects performance, not security. | n1-standard-4 | None |
| `kms_key_name` | The Cloud KMS key to use for encrypting Dataflow job resources. | false | true | Using a customer-managed key ensures control over encryption. | projects/my-gcp-project/locations/us/keyRings/my-kr/cryptoKeys/my-key | None |
| `ip_configuration` | The IP configuration for the Dataflow job (e.g., WORKER_IP_PRIVATE). | false | true | Private IPs restrict public access to workers, improving security. | WORKER_IP_PRIVATE | WORKER_IP_PUBLIC |
| `additional_experiments` | List of additional experiments to enable for the job. | false | false | Experiments are for feature testing, not security. | None | None |
| `enable_streaming_engine` | Enable the Dataflow Streaming Engine for the job. | false | false | Streaming Engine is a performance feature, not a security control. | True | False |
