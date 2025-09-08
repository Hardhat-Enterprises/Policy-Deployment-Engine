package terraform.gcp.container_analysis_note.naming_standard

# Collect violations as an array of objects
deny := [r |
  rc := input.resource_changes[_]
  rc.type == "google_container_analysis_note"
  ex := rc.change.after

  # Name must be lowercase alphanumeric with hyphens
  not regex.match("^[a-z0-9-]+$", ex.name)

  r := {
    "msg": sprintf("resource %s: Note name '%s' must be lowercase alphanumeric with hyphens", [rc.address, ex.name]),
    "resource": rc.type,
  }
]
