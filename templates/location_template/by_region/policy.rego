package terraform.gcp.security.<service>.<resource_type>.<policy_name> # Edit here 
import data.terraform.helpers
import data.terraform.gcp.security.<service>.<resource_type>.vars

conditions := [
    [
        {
            "situation_description": "Resource region is outside approved Australian regions",
            "remedies": [
                "Set region to australia-southeast1 (Sydney)",
                "Set region to australia-southeast2 (Melbourne)"
            ]
        },
        {
            "condition": "region must be an approved Australian region",
            "attribute_path": ["region"],
            "values": [ "australia-southeast1",  "australia-southeast2"],
            "policy_type": "whitelist"
        }
    ]
]

result  := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details