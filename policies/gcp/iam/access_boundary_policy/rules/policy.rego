package terraform.gcp.security.iam.access_boundary_policy.rules.access_boundary_rule.available_condition.description # Edit here 
import data.terraform.gcp.helpers
import data.terraform.gcp.security.storage.bucket.vars

attribute_path := "" # Edit here (eg., "storage_class")
compliant_values := [
    "A",
    "B",
    "C"
]

summary := helpers.get_summary(vars.resource_type, attribute_path, compliant_values, vars.friendly_resource_name)