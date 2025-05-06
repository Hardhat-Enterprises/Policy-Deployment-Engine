package terraform.gcp.security.healthcare.hl7_v2_store.labels # Edit here 
import data.terraform.gcp.helpers
import data.terraform.gcp.security.healthcare.hl7_v2_store.vars

attribute_path := "labels"
compliant_values := [
    "environment",
    "service"
]

summary := helpers.get_summary(vars.resource_type, attribute_path, compliant_values, vars.friendly_resource_name)