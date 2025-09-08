package terraform.gcp.security.data_pipeline.pipeline.naming_standard

import data.terraform.gcp.helpers
import data.terraform.gcp.security.data_pipeline.pipeline.vars

# STEP 1: STUDY YOUR RESOURCE AND ITS ATTRIBUTES, THEN FILL IN THE VARS FILE

# STEP 2: CREATE SCENARIOS (conditions)
conditions := [
    [
        {
            "situation_description": "Pipeline display_name must be lowercase alphanumeric with hyphens or underscores",
            "remedies": [
                "Rename display_name to use only lowercase letters, digits, hyphens (-), and underscores (_)",
                "Update Terraform config to enforce the correct naming convention"
            ]
        },
        {
            "condition": "Check if display_name matches the required regex",
            "attribute_path": ["display_name"],
            "values": ["^[a-z0-9-_]+$"],
            "policy_type": "pattern whitelist"
        }
    ],
    [
        {
            "situation_description": "Pipeline must be deployed only in allowed regions",
            "remedies": [
                "Restrict region to one of the approved regions in vars.allowed_regions",
                "Update Terraform resource to set region correctly"
            ]
        },
        {
            "condition": "Check if region is allowed",
            "attribute_path": ["region"],
            "values": vars.variables.allowed_regions,
            "policy_type": "whitelist"
        }
    ],
    [
        {
            "situation_description": "Pipeline must use the required pipeline type",
            "remedies": [
                "Set pipeline type to the required value",
                "Update Terraform resource to enforce required_type"
            ]
        },
        {
            "condition": "Check if type matches the required value",
            "attribute_path": ["type"],
            "values": [vars.variables.required_type],
            "policy_type": "whitelist"
        }
    ]
]

# Displays a general message about policy compliance
message := helpers.get_multi_summary(conditions, vars.variables).message

# Displays a detailed summary of each resource’s compliance
details := helpers.get_multi_summary(conditions, vars.variables).details
