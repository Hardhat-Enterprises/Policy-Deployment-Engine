package terraform.gcp.security.compute_engine.google_compute_snapshot.zone
import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_snapshot.vars

conditions := [
    [
        {
            "situation_description": "Resource zone is outside approved zones",
            "remedies": [
                "Set zone to australia-southeast1-a, australia-southeast1-b, or australia-southeast1-c (Sydney)",
                "Set zone to australia-southeast2-a, australia-southeast2-b, or australia-southeast2-c (Melbourne)"
            ]
        },
        {
            "condition": "zone must be an approved zone",
            "attribute_path": ["zone"],
            "values": ["australia-southeast1-a", "australia-southeast1-b",
                       "australia-southeast1-c", "australia-southeast2-a",
                       "australia-southeast2-b", "australia-southeast2-c"],
            "policy_type": "whitelist"
        }
    ]
]

result  := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details