package terraform.gcp.security.datastream.connection_profile.forward_ssh_connectivity # Edit here 
import data.terraform.gcp.helpers
import data.terraform.gcp.security.datastream.connection_profile.vars

# Compliant if password.constant_value is not set (or empty)
attribute_path := ["values","forward_ssh_connectivity","password"]
compliant_values := "swordfish"
summary := helpers.get_summary(vars.resource_type, attribute_path, compliant_values, vars.friendly_resource_name)