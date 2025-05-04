package terraform.gcp.security.datastream.stream.data_freshness # Edit here 
import data.terraform.gcp.helpers
import data.terraform.gcp.security.datastream.stream.vars

attribute_path := ["destination_config", "0", "bigquery_destination_config", "0", "data_freshness"]

compliant_values := [
    "300s",   # Compliant value example
    "600s",   # Another compliant value example
    "900s"    # Another compliant value example
]
summary := helpers.get_summary(vars.resource_type, attribute_path, compliant_values, vars.friendly_resource_name)