package terraform.gcp.security.healthcare.hl7_v2_store.notification_configs # Edit here 
import data.terraform.gcp.helpers
import data.terraform.gcp.security.healthcare.hl7_v2_store.vars

attribute_path := "notification_configs"
compliant_values := [
    "filter",
    "pubsub_topic"
]

summary := helpers.get_summary(vars.resource_type, attribute_path, compliant_values, vars.friendly_resource_name)