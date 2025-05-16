package terraform.gcp.security.<service>.<resource_type>.<policy_name> # Edit here 
import data.terraform.gcp.helpers
import data.terraform.gcp.security.<service>.<resource_type>.vars

attribute_path := "" # Edit here (eg., "storage_class")
compliant_values := [
    "A",
    "B",
    "C"
]

summary := helpers.get_summary(vars.resource_type, attribute_path, compliant_values, vars.friendly_resource_name)