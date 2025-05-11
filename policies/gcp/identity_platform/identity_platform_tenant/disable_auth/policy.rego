package terraform.gcp.identity_platform.inbound_saml_config

default allow = false

# Validate the display_name is set and not blank
valid_display_name(resource) {
  resource.display_name != ""
}

# Validate presence of idp_config block
has_idp_config(resource) {
  count(resource.idp_config) > 0
}

# Validate presence of sp_config block
has_sp_config(resource) {
  count(resource.sp_config) > 0
}

# Main policy rule
allow {
  input.resource_type == "google_identity_platform_inbound_saml_config"
  valid_display_name(input)
  has_idp_config(input)
  has_sp_config(input)
}

deny[msg] {
  input.resource_type == "google_identity_platform_inbound_saml_config"
  not valid_display_name(input)
  msg := "display_name must be set and non-empty"
}

deny[msg] {
  input.resource_type == "google_identity_platform_inbound_saml_config"
  not has_idp_config(input)
  msg := "idp_config block is missing"
}

deny[msg] {
  input.resource_type == "google_identity_platform_inbound_saml_config"
  not has_sp_config(input)
  msg := "sp_config block is missing"
}
