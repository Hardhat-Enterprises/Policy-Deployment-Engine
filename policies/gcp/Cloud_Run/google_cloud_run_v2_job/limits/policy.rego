package terraform.gcp.security.Cloud_Run.google_cloud_run_v2_job.limits

import data.terraform.gcp.helpers
import data.terraform.gcp.security.Cloud_Run.google_cloud_run_v2_job.vars

attribute_path := "template.template.containers.resources.limits"

cpu_mem := {
  "cpu": "1",
  "memory": "512Mi"
}

compliant_values := [cpu_mem]

summary := helpers.get_summary( vars.resource_type, attribute_path, compliant_values, vars.friendly_resource_name
)