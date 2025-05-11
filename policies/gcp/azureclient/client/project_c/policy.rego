package terraform.gcp.security.azureclient.client.project_c

import data.terraform.gcp.helpers
import data.terraform.gcp.security.azureclient.client.vars


attribute_path := "tenant id"
compliant_values := [
    "12345678-aaaa-bbbb-cccc-1234567890ab"
]

summary := helpers.get_summary(vars.resource_type, attribute_path, compliant_values, vars.friendly_resource_name)