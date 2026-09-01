package terraform.gcp.security.apigee.google_apigee_security_profile_v2.profile_assessment_configs_weight
import data.terraform.helpers
import data.terraform.gcp.security.apigee.google_apigee_security_profile_v2.vars
conditions := [
    [
        {
            "situation_description": "profile_assessment_configs weight must not be MINOR to ensure security checks carry meaningful impact",
            "remedies": [
                "Set profile_assessment_configs weight to MODERATE or MAJOR to ensure security assessment findings drive remediation"
            ]
        },
        {
            "condition": "check profile_assessment_configs weight is not MINOR",
            "attribute_path": ["profile_assessment_configs", "weight"],
            "values": ["MINOR"],
            "policy_type": "blacklist"
        }
    ]
]
result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
