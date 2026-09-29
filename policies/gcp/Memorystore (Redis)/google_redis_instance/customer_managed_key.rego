package terraform.gcp.security.memorystore_redis.google_redis_instance.customer_managed_key

import data.terraform.gcp.security.memorystore_redis.google_redis_instance.vars
import data.terraform.helpers.shared

conditions := []

customer_managed_key_path := ["customer_managed_key"]

resources := [
  resource |
  resource := input.planned_values.root_module.resources[_]
  resource.type == vars.variables.resource_type
]

non_compliant_resource(resource) if {
  key := shared.get_attribute_value(resource, customer_managed_key_path)
  not is_string(key)
}

non_compliant_resource(resource) if {
  key := shared.get_attribute_value(resource, customer_managed_key_path)
  is_string(key)
  not regex.match("^projects/[^/]+/locations/[^/]+/keyRings/[^/]+/cryptoKeys/[^/]+$", key)
}

non_compliant_resources := [
  resource |
  resource := resources[_]
  non_compliant_resource(resource)
]

non_compliant_names := [
  shared.get_resource_attribute(resource, vars.variables.resource_value_name) |
  resource := non_compliant_resources[_]
]

non_compliant_display := concat(", ", non_compliant_names) if {
  count(non_compliant_names) > 0
}

non_compliant_display := "None - All passed" if {
  count(non_compliant_names) == 0
}

message := [
  sprintf("Total %s detected: %d ", [vars.variables.friendly_resource_name, count(resources)]),
  "Situation 1: Redis must use a valid customer-managed encryption key.",
  sprintf("Non-Compliant Resources: %s", [non_compliant_display]),
  "Potential Remedies: Set customer_managed_key to a valid Cloud KMS crypto key resource path."
]

details := [{
  "situation": "Redis must use a valid customer-managed encryption key.",
  "remedies": [
    "Set customer_managed_key to a valid Cloud KMS crypto key resource path."
  ],
  "non_compliant_resources": non_compliant_names
}]