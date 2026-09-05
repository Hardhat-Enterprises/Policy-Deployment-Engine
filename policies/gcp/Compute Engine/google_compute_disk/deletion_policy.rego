package terraform.gcp.security.compute_engine.google_compute_disk.deletion_policy
import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_disk.vars
conditions := [
    [
        {
            "situation_description": "Compute disk deletion policy is not set to PREVENT, allowing unrestricted deletion and risking permanent data loss.",
            "remedies":  package terraform.gcp.security.compute_engine.google_compute_disk.deletion_policy
import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_disk.vars
conditions := [
    [
        {
            "situation_description": "Compute disk deletion policy is not set to PREVENT, allowing unrestricted deletion and risking permanent data loss.",
            "remedies": ["Set deletion_policy to PREVENT to block accidental or unauthorised destruction of the disk."]
        },
        {
            "condition": "deletion_policy must be set to PREVENT.",
            "attribute_path": ["deletion_policy"],
            "values": ["PREVENT"],
            "policy_type": "whitelist"
        }
    ]
]
result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details.Groups[1].Value -replace '\.','_' 
        },
        {
            "condition": "deletion_policy must be set to PREVENT.",
            "attribute_path":  package terraform.gcp.security.compute_engine.google_compute_disk.deletion_policy
import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_disk.vars
conditions := [
    [
        {
            "situation_description": "Compute disk deletion policy is not set to PREVENT, allowing unrestricted deletion and risking permanent data loss.",
            "remedies": ["Set deletion_policy to PREVENT to block accidental or unauthorised destruction of the disk."]
        },
        {
            "condition": "deletion_policy must be set to PREVENT.",
            "attribute_path": ["deletion_policy"],
            "values": ["PREVENT"],
            "policy_type": "whitelist"
        }
    ]
]
result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details.Groups[1].Value -replace '\.','_' ,
            "values":  package terraform.gcp.security.compute_engine.google_compute_disk.deletion_policy
import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_disk.vars
conditions := [
    [
        {
            "situation_description": "Compute disk deletion policy is not set to PREVENT, allowing unrestricted deletion and risking permanent data loss.",
            "remedies": ["Set deletion_policy to PREVENT to block accidental or unauthorised destruction of the disk."]
        },
        {
            "condition": "deletion_policy must be set to PREVENT.",
            "attribute_path": ["deletion_policy"],
            "values": ["PREVENT"],
            "policy_type": "whitelist"
        }
    ]
]
result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details.Groups[1].Value -replace '\.','_' ,
            "policy_type": "whitelist"
        }
    ]
]
result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details