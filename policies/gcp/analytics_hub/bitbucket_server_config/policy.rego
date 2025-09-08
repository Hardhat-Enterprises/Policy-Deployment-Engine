package terraform.gcp.cloudbuild.bitbucket_server_config.naming_standard

# Collect all violations as an ARRAY of objects
deny := [r |
  rc := input.resource_changes[_]
  rc.type == "google_cloudbuild_bitbucket_server_config"
  ex := rc.change.after

  # Naming convention: must be lowercase with hyphens
  not regex.match("^[a-z0-9\\-]+$", ex.config_id)

  r := {
    "msg": sprintf(
      "resource %s: BitbucketServerConfig ID '%s' must be lowercase alphanumeric with hyphens",
      [rc.address, ex.config_id]
    ),
    "resource": rc.type,
  }
]
