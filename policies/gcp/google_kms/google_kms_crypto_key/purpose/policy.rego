package terraform.gcp.security.google_kms.google_kms_crypto_key.purpose

import data.terraform.gcp.helpers as helpers
import data.terraform.gcp.security.google_kms.google_kms_crypto_key.vars as vars

# Parameters
resource_type          := vars.resource_type
friendly_name          := vars.friendly_resource_name
allowed_purposes       := {"ENCRYPT_DECRYPT", "ASYMMETRIC_SIGN"}
required_label_path    := ["labels", "signing"]
required_label_value   := "true"

# 1. Purpose Violations
purpose_violations := [
  msg |
  r := helpers.get_nc_resources(resource_type, "purpose", allowed_purposes)[_]
  msg := sprintf(
    "%s '%s' uses unapproved purpose: '%s'. Allowed: %v.",
    [friendly_name, r.values.name, r.values.purpose, allowed_purposes]
  )
]

# 2. Signing Label Violations
signing_label_violations := [
  msg |
  r := input.planned_values.root_module.resources[_]
  helpers.resource_type_match(r, resource_type)
  r.values.purpose == "ASYMMETRIC_SIGN"
  not helpers.array_contains(required_label_value, object.get(r.values, required_label_path, null))

  msg := sprintf(
    "%s '%s' is ASYMMETRIC_SIGN but missing label 'signing=true'",
    [friendly_name, r.values.name]
  )
]

# 3. Combine All Violations
all_violations := array.concat(purpose_violations, signing_label_violations)

# 4. Summary Message
summary := {
  "message": array.concat(
    [
      sprintf("Total %s detected: %d", [friendly_name, count(helpers.get_all_resources(resource_type))]),
      sprintf("Non-compliant %s: %d", [friendly_name, count(all_violations)])
    ],
    all_violations
  )
}
