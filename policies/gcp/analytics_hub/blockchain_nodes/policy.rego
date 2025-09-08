package terraform.gcp.blockchain_node_engine.blockchain_nodes.naming_standard

# Collect all violations as an ARRAY of objects
deny := [r |
  rc := input.resource_changes[_]
  rc.type == "google_blockchain_node_engine_blockchain_nodes"
  ex := rc.change.after

  # Enforce node_id naming convention
  not regex.match("^[a-z0-9\\-]+$", ex.blockchain_node_id)

  r := {
    "msg": sprintf(
      "resource %s: Blockchain node_id '%s' must be lowercase alphanumeric with hyphens",
      [rc.address, ex.blockchain_node_id]
    ),
    "resource": rc.type,
  }
]
