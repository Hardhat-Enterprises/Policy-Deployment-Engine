package terraform.gcp.security.Cloud_Run.google_cloud_run_v2_job.deletion_protection

import data.terraform.gcp.helpers
import data.terraform.gcp.security.cloud_run.google_cloud_run_v2_job.vars

attribute_path := ["expressions", "deletion_protection", "constant_value"]

compliant_values := [ true ]

summary := helpers.get_summary(vars.resource_type, attribute_path, compliant_values, vars.friendly_resource_name)