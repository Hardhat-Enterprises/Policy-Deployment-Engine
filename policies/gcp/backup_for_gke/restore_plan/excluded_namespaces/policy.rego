package terraform.gcp.security.backup_for_gke.restore_plan.excluded_namespaces

import rego.v1
import data.terraform.gcp.security.backup_for_gke.restore_plan.vars
import data.terraform.helpers.policies.element_blacklist

# Prevent exclusion of critical namespaces
violations := element_blacklist.get_violations(
    vars.variables,
    ["restore_config", 0, "excluded_namespaces", "namespaces"],
    ["kube-system", "kube-public", "kube-node-lease", "gke-system"]
)

message := [m | 
    some violation in violations
    m := violation.message
]