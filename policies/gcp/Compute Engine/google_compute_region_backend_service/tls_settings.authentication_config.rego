package terraform.gcp.security.compute_engine.google_compute_region_backend_service.tls_settings_authentication_config

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_region_backend_service.vars

# The path deliberately omits the block index: for a list of blocks the helper
# collects the non-null values, so a present 'tls_settings' block with no
# 'authentication_config' yields [] (flagged), while a resource with no
# 'tls_settings' block at all yields null (not flagged).
conditions := [
  [
    {
      "situation_description": "Backend TLS settings are used without an authentication config, so backend connections are not authenticated.",
      "remedies": ["Set 'tls_settings.authentication_config' to a BackendAuthenticationConfig resource."]
    },
    {
      "condition": "'tls_settings.authentication_config' must be set when 'tls_settings' is used",
      "attribute_path": ["tls_settings", "authentication_config"],
      "values": [[], ""],
      "policy_type": "blacklist"
    }
  ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message
details := summary.details
