## 🛡️ Policy Deployment Engine: `dataflow_flex_template_job`

This section provides a concise policy evaluation for the `dataflow_flex_template_job` resource in GCP.

Reference: [Terraform Registry – dataflow_flex_template_job](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/dataflow_flex_template_job)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` |  | none | None | None |
| `container_spec_gcs_path` | Template. - - - | none | None | None |
| `additional_experiments` |  | none | None | None |
| `additional_pipeline_options` |  | none | None | None |
| `autoscaling_algorithm` |  | none | None | None |
| `parameters` | case-sensitive based on the language on which the pipeline is coded, mostly Java. **Note**: do not configure Dataflow options here in parameters. | none | None | None |
| `enable_streaming_engine` |  | none | None | None |
| `ip_configuration` |  | none | None | None |
| `kms_key_name` |  | none | None | None |
| `labels` | should follow the restrictions specified in the [labeling restrictions](https://cloud.google.com/compute/docs/labeling-resources#restrictions) page. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | none | None | None |
| `terraform_labels` | The combination of labels configured directly on the resource and default labels configured on the provider. | none | None | None |
| `effective_labels` | All of labels (key/value pairs) present on the resource in GCP, including the labels configured through Terraform, other clients and services. | none | None | None |
| `launcher_machine_type` |  | none | None | None |
| `machine_type` |  | none | None | None |
| `max_workers` |  | none | None | None |
| `network` |  | none | None | None |
| `num_workers` |  | none | None | None |
| `on_delete` | deletion during `terraform destroy`.  See above note. | none | None | None |
| `project` | provided, the provider project is used. | none | None | None |
| `region` |  | none | None | None |
| `sdk_container_image` |  | none | None | None |
| `service_account_email` |  | none | None | None |
| `skip_wait_on_job_termination` | treat `DRAINING` and `CANCELLING` as terminal states when deleting the resource, and will remove the resource from terraform state and move on.  See above note. | none | None | None |
| `staging_location` |  | none | None | None |
| `subnetwork` |  | none | None | None |
| `temp_location` |  | none | None | None |
| `transform_name_mapping` |  | none | None | None |
