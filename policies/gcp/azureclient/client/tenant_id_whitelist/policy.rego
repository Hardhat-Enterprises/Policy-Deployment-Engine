package terraform.gcp.security.azureclient.tenant_id_whitelist

import data.terraform.helpers.general

deny[res] {
  general.whitelist_violation({
    "input": input,
    "resource_type": "google_container_azure_client",
    "attribute": "tenant_id",
    "allowed": data.terraform.gcp.security.azureclient.tenant_id_whitelist.allowed_tenants,
    "resource_path": ["planned_values", "root_module", "resources"]
  }, res)
}




/* package terraform.gcp.security.azureclient.client.tenant_id_whitelist

import data.terraform.gcp.helpers
import data.terraform.gcp.security.azureclient.client.vars


attribute_path := "tenant id"
compliant_values := [
    "12345678-aaaa-bbbb-cccc-1234567890ab"
]

summary := helpers.get_summary(vars.resource_type, attribute_path, compliant_values, vars.friendly_resource_name)
*/