package terraform.gcp.security.storage.bucket.storage_class # Edit here 
import data.terraform.gcp.helpers
import data.terraform.gcp.security.storage.bucket.vars

attribute_path := "storage_class" # Edit here (eg., "storage_class")
compliant_values := [
    "STANDARD",
]

summary := helpers.get_summary(vars.resource_type, attribute_path, compliant_values, vars.friendly_resource_name)