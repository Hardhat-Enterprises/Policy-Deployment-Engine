package terraform.gcp.security.compute_engine.google_compute_disk.enable_confidential_compute
import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_disk.vars
conditions := [
    [
        {
            "situation_description": "Compute disk does not have confidential compute enabled, leaving data unprotected while being processed in memory.",
            "remedies":  package terraform.gcp.security.compute_engine.google_compute_disk.enable_confidential_compute
import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_disk.vars
conditions := [
    [
        {
            "situation_description": "Compute disk does not have confidential compute enabled, leaving data unprotected while being processed in memory.",
            "remedies": ["Set enable_confidential_compute to true and provide a disk_encryption_key for workloads handling sensitive data."]
        },
        {
            "condition": "enable_confidential_compute must be true.",
            "attribute_path": ["enable_confidential_compute"],
            "values": [true],
            "policy_type": "whitelist"
        }
    ]
]
result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details.Groups[1].Value -replace '\.','_' 
        },
        {
            "condition": "enable_confidential_compute must be true.",
            "attribute_path":  package terraform.gcp.security.compute_engine.google_compute_disk.enable_confidential_compute
import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_disk.vars
conditions := [
    [
        {
            "situation_description": "Compute disk does not have confidential compute enabled, leaving data unprotected while being processed in memory.",
            "remedies": ["Set enable_confidential_compute to true and provide a disk_encryption_key for workloads handling sensitive data."]
        },
        {
            "condition": "enable_confidential_compute must be true.",
            "attribute_path": ["enable_confidential_compute"],
            "values": [true],
            "policy_type": "whitelist"
        }
    ]
]
result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details.Groups[1].Value -replace '\.','_' ,
            "values": [true],
            "policy_type": "whitelist"
        }
    ]
]
result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details