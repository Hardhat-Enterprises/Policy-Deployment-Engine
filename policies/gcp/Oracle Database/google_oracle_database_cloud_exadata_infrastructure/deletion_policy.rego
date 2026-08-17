package terraform.gcp.security.oracle_database.google_oracle_database_cloud_exadata_infrastructure.deletion_policy
 
import data.terraform.helpers

import data.terraform.gcp.security.oracle_database.google_oracle_database_cloud_exadata_infrastructure.vars
 
conditions := [

    [

        {

            "situation_description": "Exadata infrastructure can be destroyed by Terraform, risking loss of a critical database platform.",

            "remedies": [

                "Set deletion_policy to PREVENT."

            ]

        },

        {

            "condition": "Check if deletion_policy is PREVENT",

            "attribute_path": ["deletion_policy"],

            "values": ["PREVENT"],

            "policy_type": "whitelist"

        }

    ]

]
 
result := helpers.get_multi_summary(conditions, vars.variables)
 
message := result.message

details := result.details