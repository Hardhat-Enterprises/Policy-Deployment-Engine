package terraform.gcp.security.azurenodepool.node_pool.vm_size_whitelist

resource_type := "google_container_azure_node_pool"
friendly_resource_name := "GCP Azure Node Pool"

compliant_vm_sizes := [
  "Standard_D2s_v3",
  "Standard_D4s_v3",
  "Standard_E4s_v3"
]

resources := [res |
  res := input.planned_values.root_module.resources[_]
  res.type == resource_type
]

violations := [res |
  res := input.planned_values.root_module.resources[_]
  res.type == resource_type
  res.values.config.vm_size != ""  # Ensure the field exists
  not res.values.config.vm_size in compliant_vm_sizes
]

summary.message := array.concat(
  [
    sprintf("Total %s detected: %d", [friendly_resource_name, count(resources)]),
    sprintf("Non-compliant %s: %d/%d", [friendly_resource_name, count(violations), count(resources)])
  ],
  [sprintf("%s '%s' uses unapproved VM size: '%s'", [friendly_resource_name, r.values.name, r.values.config.vm_size]) |
    r := violations[_]
  ]
)
