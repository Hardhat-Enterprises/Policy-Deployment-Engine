## 🛡️ Policy Deployment Engine: `dataflow_job`

This section provides a concise policy evaluation for the `dataflow_job` resource in GCP.

Reference: [Terraform Registry – dataflow_job](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/dataflow_job)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` |  | none | None | None |
| `template_gcs_path` |  | none | None | None |
| `temp_gcs_location` | - - - | none | None | None |
| `parameters` | case-sensitive based on the language on which the pipeline is coded, mostly Java. **Note**: do not configure Dataflow options here in parameters. | none | None | None |
| `labels` | specified in the [labeling restrictions](https://cloud.google.com/compute/docs/labeling-resources#restrictions) page. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | none | None | None |
| `terraform_labels` | The combination of labels configured directly on the resource and default labels configured on the provider. | none | None | None |
| `effective_labels` | All of labels (key/value pairs) present on the resource in GCP, including the labels configured through Terraform, other clients and services. | none | None | None |
| `transform_name_mapping` |  | none | None | None |
| `max_workers` |  | none | None | None |
| `on_delete` |  | none | None | None |
| `skip_wait_on_job_termination` |  | none | None | None |
| `project` |  | none | None | None |
| `zone` |  | none | None | None |
| `region` |  | none | None | None |
| `service_account_email` |  | none | None | None |
| `network` |  | none | None | None |
| `subnetwork` |  | none | None | None |
| `machine_type` |  | none | None | None |
| `kms_key_name` |  | none | None | None |
| `ip_configuration` |  | none | None | None |
| `additional_experiments` |  | none | None | None |
| `enable_streaming_engine` |  | none | None | None |
