package terraform.gcp.security.Cloud_Run.google_cloud_run_v2_job.service_account # Edit here 
import data.terraform.gcp.helpers
import data.terraform.gcp.security.Cloud_Run.google_cloud_run_v2_job.vars

attribute_path := "template.template.service_account" # Edit here (eg., "storage_class")
compliant_values := [
    "cloud-run-sa@your-project-id.iam.gserviceaccount.com"
]

summary := helpers.get_summary(vars.resource_type, attribute_path, compliant_values, vars.friendly_resource_name)