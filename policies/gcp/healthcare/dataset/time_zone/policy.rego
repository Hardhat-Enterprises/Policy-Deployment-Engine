package terraform.gcp.security.healthcare.dataset.time_zone # Edit here 
import data.terraform.gcp.helpers
import data.terraform.gcp.security.healthcare.dataset.vars

attribute_path := "time_zone"
compliant_values := [
    "UTC+10:00"
]

summary := helpers.get_summary(vars.resource_type, attribute_path, compliant_values, vars.friendly_resource_name)