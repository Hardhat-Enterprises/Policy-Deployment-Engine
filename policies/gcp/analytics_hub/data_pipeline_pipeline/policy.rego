package terraform.gcp.data_pipeline_pipeline.naming_standard

# Collect violations as array of objects
deny := [r |
  rc := input.resource_changes[_]
  rc.type == "google_data_pipeline_pipeline"
  ex := rc.change.after

  # Must be lowercase with hyphens/underscores
  not regex.match("^[a-z0-9-_]+$", ex.display_name)

  r := {
    "msg": sprintf("resource %s: display_name '%s' must be lowercase alphanumeric with - or _ only", [rc.address, ex.display_name]),
    "resource": rc.type,
  }
]
