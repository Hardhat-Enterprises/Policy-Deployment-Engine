package terraform.gcp.security.dataplex.google_dataplex_entry_group.deletion_policy

import data.terraform.helpers
import data.terraform.gcp.security.dataplex.google_dataplex_entry_group.vars

conditions := [
    [
        {
            "situation_description": "If the deletion_policy attribute is not set to 'PREVENT', the Dataplex Entry Group may be accidentally or unintentionally deleted through Terraform operations.",
            "remedies": ["Set the 'deletion_policy' attribute to 'PREVENT'."]
        },
        {
            "condition": "check if the deletion_policy attribute is set to 'PREVENT'",
            "attribute_path": ["deletion_policy"],
            "values": ["PREVENT"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details