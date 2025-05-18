package terraform.gcp.security.secret.region_redundancy

default message := ""
default details := []

import data.terraform.gcp.security.secret.vars

# Filter resources of the correct type
resources := [r |
  r := input.planned_values.root_module.resources[_]
  r.type == vars.resource_type
]

# Find those using user-managed replication with < 2 replicas
non_compliant := [r.name |
  r := resources[_]
  user_managed := object.get(r.values.replication, "user_managed", null)
  replicas := object.get(user_managed, "replicas", [])
  count(replicas) < 2
]

message := sprintf("Secrets with fewer than 2 replica regions detected: %v", [non_compliant])
details := [{
  "situation": "Secret uses user-managed replication with fewer than 2 replica regions",
  "remedies": ["Add at least 2 replica regions under user-managed replication"],
  "non_compliant_resources": non_compliant
}]
