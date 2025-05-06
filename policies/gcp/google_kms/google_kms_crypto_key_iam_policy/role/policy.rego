package terraform.gcp.security.google_kms.google_kms_crypto_key_iam_policy.role
import data.terraform.gcp.helpers
import data.terraform.gcp.security.google_kms.google_kms_crypto_key_iam_policy.vars
import future.keywords

# --- Configuration -------------------------------------------------------

# Only this role is allowed
allowed_roles      := {"roles/cloudkms.cryptoKeyEncrypterDecrypter"}

# Forbidden member patterns
forbidden_members  := {"allUsers", "allAuthenticatedUsers"}

# Must match user:... or serviceAccount:...
valid_member_regex := "^(user|serviceAccount):[A-Za-z0-9@._-]+$"

# --- Helpers -------------------------------------------------------------

# Decode the JSON string in policy_data
decode_policy(resource) = decoded if {
  pd := resource.values.policy_data
  decoded := json.unmarshal(pd)
}

# All matching resources
all_resources := [
  r |
  r := input.planned_values.root_module.resources[_]
  helpers.resource_type_match(r, vars.resource_type)
]

# --- Build Violation Messages Safely ------------------------------------

# 1) No bindings defined
no_bindings := [
  sprintf("%s '%s' has no IAM bindings defined", [vars.friendly_resource_name, r.name]) |
  r := all_resources[_]
  decoded := decode_policy(r)
  count(decoded.bindings) == 0
]

# 2) Disallowed roles
disallowed_roles := [
  sprintf("%s '%s' uses unapproved role: '%s'", [vars.friendly_resource_name, r.name, b.role]) |
  r := all_resources[_]
  decoded := decode_policy(r)
  b := decoded.bindings[_]
  not allowed_roles[b.role]
]

# 3) Forbidden members
forbidden_members_violations := [
  sprintf("%s '%s' uses forbidden member: '%s'", [vars.friendly_resource_name, r.name, m]) |
  r := all_resources[_]
  decoded := decode_policy(r)
  b := decoded.bindings[_]
  m := b.members[_]
  forbidden_members[m]
]

# 4) Invalid member formats
invalid_member_format := [
  sprintf("%s '%s' has invalid member format: '%s'", [vars.friendly_resource_name, r.name, m]) |
  r := all_resources[_]
  decoded := decode_policy(r)
  b := decoded.bindings[_]
  m := b.members[_]
  not forbidden_members[m]
  not regex.match(valid_member_regex, m)
]

# Aggregate all messages into one list
# Single nested call
messages := array.concat(
  array.concat(
    array.concat(no_bindings,disallowed_roles),
    forbidden_members_violations
  ),
  invalid_member_format
)

# --- Summary -------------------------------------------------------------

summary := {
  "message": array.concat(
    [
      sprintf("Total %s detected: %d", [vars.friendly_resource_name, count(all_resources)]),
      sprintf("Non-compliant %s: %d", [vars.friendly_resource_name, count(messages)])
    ],
    messages
  )
}
