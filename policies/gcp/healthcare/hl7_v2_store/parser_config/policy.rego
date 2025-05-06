package terraform.gcp.security.healthcare.hl7_v2_store.parser_config # Edit here 
import data.terraform.gcp.helpers
import data.terraform.gcp.security.healthcare.hl7_v2_store.vars

attribute_path := "parser_config"
compliant_values := [
    "allow_null_header",
    "schema",
    "segment_terminator",
    "version"
]

summary := helpers.get_summary(vars.resource_type, attribute_path, compliant_values, vars.friendly_resource_name)