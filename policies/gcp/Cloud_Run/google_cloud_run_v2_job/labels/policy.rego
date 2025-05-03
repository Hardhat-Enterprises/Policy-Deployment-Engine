package terraform.gcp.security.Cloud_Run.google_cloud_run_v2_job.labels # Edit here 
import data.terraform.gcp.helpers
import data.terraform.gcp.security.Cloud_Run.google_cloud_run_v2_job.vars

attribute_path := ["expressions", "labels", "constant_value"] # Edit here (eg., "storage_class")
compliant_values := ["cost_center", "managed_by", "compliance", "owner_team"]

summary := helpers.get_summary(vars.resource_type, attribute_path, compliant_values, vars.friendly_resource_name)