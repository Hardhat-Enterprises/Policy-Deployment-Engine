package terraform.gcp.security.Cloud_Run.google_cloud_run_v2_job_iam_binding.cloud_role

import data.terraform.gcp.helpers
import data.terraform.gcp.security.Cloud_Run.google_cloud_run_v2_job_iam_binding.vars

attribute_path := "role"

compliant_values := [
  "roles/run.invoker",
  "roles/viewer"
]

summary := helpers.get_summary( vars.resource_type, attribute_path, compliant_values, vars.friendly_resource_name
)
