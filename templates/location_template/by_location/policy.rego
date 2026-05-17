package terraform.gcp.security.<service>.<resource_type>.<policy_name> # Edit here 
import data.terraform.helpers
import data.terraform.gcp.security.<service>.<resource_type>.vars # to be edited

conditions := [
    [
        {
            "situation_description": "Resource location is outside approved Australian regions",
            "remedies": [
                "Set location to australia-southeast1 (Sydney)",
                "Set location to australia-southeast2 (Melbourne)"
            ]
        },
        {
            "condition": "location must be an approved Australian region",
            "attribute_path": ["location"], # make sure this matches the plan.json path for your resource e.g eg. ["location",0] or [location]
            "values": [ "australia-southeast1",  "australia-southeast2"],
            "policy_type": "whitelist"
        }
    ]
]

result  := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
