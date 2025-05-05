package terraform.gcp.security.secretmanager.secret.labels

import data.terraform.gcp.helpers
import data.terraform.gcp.security.secretmanager.secret.vars

attribute_path := "labels" 
compliant_values := []

summary := helpers.get_summary(vars.resource_type, attribute_path, compliant_values, vars.friendly_resource_name)

default is_compliant = false

is_compliant if {
  input.resource_type == vars.resource_type
  input[attribute_path]
  count(input[attribute_path]) > 0
}
