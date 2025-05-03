package terraform.gcp.security.Cloud_Run.google_cloud_run_v2_service.service_account # Edit here 
import data.terraform.gcp.helpers
import data.terraform.gcp.security.Cloud_Run.google_cloud_run_v2_service.vars

attribute_path := ["expressions","template","containers","service_account"]
compliant_values := [
   "my-custom-sa@my-project.iam.gserviceaccount.com"
]

summary := helpers.get_summary(vars.resource_type, attribute_path, compliant_values, vars.friendly_resource_name)