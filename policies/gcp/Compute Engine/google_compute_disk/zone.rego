package terraform.gcp.security.compute_engine.google_compute_disk.zone
import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_disk.vars
conditions := [
    [
        {
            "situation_description": "Compute disk is not deployed in an approved Australian zone, which may violate data residency requirements.",
            "remedies": ["Set zone to an approved Australian zone such as australia-southeast1-a, australia-southeast1-b, or australia-southeast2-a."]
        },
        {
            "condition": "zone must be in an approved Australian region.",
            "attribute_path": ["zone"],
            "values": ["australia-southeast1-a", "australia-southeast1-b", "australia-southeast1-c", "australia-southeast2-a", "australia-southeast2-b", "australia-southeast2-c"],
            "policy_type": "whitelist"
        }
    ]
]
result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details