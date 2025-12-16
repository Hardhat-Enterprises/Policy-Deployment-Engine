package terraform.gcp.security.backup_for_gke.backup_plan.encryption_key

import rego.v1
import data.terraform.gcp.security.backup_for_gke.backup_plan.vars
import data.terraform.helpers.policies.pattern_whitelist

# CMEK must be in australia-southeast1 region
violations := pattern_whitelist.get_violations(
    vars.variables,
    ["backup_config", 0, "encryption_key", "kms_key_name"],
    ["projects/*/locations/*/keyRings/*/cryptoKeys/*", [[], ["australia-southeast1"], [], []]]
)

message := [m | 
    some violation in violations
    m := violation.message
]