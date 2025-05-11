package terraform.gcp.security.azurenodepool.node_pool.vm_size_whitelist

import data.terraform.gcp.helpers.resource
import data.terraform.gcp.helpers.message
import data.terraform.gcp.security.azurenodepool.node_pool.vars

default allow = true

_vm_size_whitelist_ := {
  "metadata": {
    "id": "VM_SIZE_WHITELIST",
    "version": "v1.0.0",
    "description": "Ensures that the VM size in Azure Node Pool config is from an approved list.",
    "custom": true
  },
  "policy": {
    "resource": "google_container_azure_node_pool",
    "select": {
      "field": "values.config.vm_size"
    },
    "condition": {
      "type": "in",
      "approved_list": vars.vm_size_whitelist
    },
    "message": {
      "type": "summary",
      "prefix": "GCP Azure Node Pool",
      "fields": ["values.name", "values.config.vm_size"],
      "suffix": "uses unapproved VM size"
    }
  }
}



/* package terraform.gcp.security.azurenodepool.node_pool.vm_size_whitelist

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
*/