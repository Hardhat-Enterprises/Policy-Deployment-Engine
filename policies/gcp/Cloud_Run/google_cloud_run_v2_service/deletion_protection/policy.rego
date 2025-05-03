package terraform.gcp.security.Cloud_Run.google_cloud_run_v2_service.deletion_protection # Edit here 
import data.terraform.gcp.helpers
import data.terraform.gcp.security.Cloud_Run.google_cloud_run_v2_service.vars

attribute_path := ["expressions","name"]
compliant_values := [
    "cloud_run_service-c"
]

summary := helpers.get_summary(vars.resource_type, attribute_path, compliant_values, vars.friendly_resource_name)