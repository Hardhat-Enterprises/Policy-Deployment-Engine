package terraform.gcp.security.public_ca.external_account_key.location_whitelist.vars

variables := {
  "friendly_resource_name": "Public CA External Account Key",
  "resource_type": "google_public_ca_external_account_key",
  # Use a label that actually exists under values{} in your plan (this resource doesn't have name in values)
  "resource_value_name": "project"
}
