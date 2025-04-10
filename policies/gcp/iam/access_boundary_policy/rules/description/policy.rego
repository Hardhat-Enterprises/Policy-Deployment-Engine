package terraform.gcp.security.iam.access_boundary_policy.rules.description # Edit here 
import data.terraform.gcp.helpers
import data.terraform.gcp.security.iam.access_boundary_policy.vars

attribute_path := ["rules",0,"access_boundary_rule",0,"availability_condition",0,"description"] # Edit here (eg., "storage_class")

# description must not be empty
compliant_values := ["change me",222]

summary := helpers.get_summary(vars.resource_type, attribute_path, compliant_values, vars.friendly_resource_name)
#v := helpers.get_violations(vars.resource_type, attribute_path, compliant_values, vars.friendly_resource_name)
#v_count := count(v)
#nc := helpers.get_nc_resources(vars.resource_type, attribute_path, compliant_values)
#nc_count := count(nc)