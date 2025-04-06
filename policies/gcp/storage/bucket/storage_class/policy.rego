package terraform.gcp.security.storage.bucket.storage_class 
import data.terraform.gcp.helpers
import data.terraform.gcp.security.storage.bucket.vars

attribute_path := "storage_class"
compliant_values := [
    "STANDARD",
    "REGIONAL",
    "NEARLINE",
    "COLDLINE",
    "ARCHIVE"
]

summary := helpers.get_summary(vars.resource_type, attribute_path, compliant_values, vars.friendly_resource_name)