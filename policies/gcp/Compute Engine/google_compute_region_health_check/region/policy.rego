package terraform.gcp.security.compute.google_compute_region_health_check.region
import data.terraform.helpers
import data.terraform.gcp.security.compute.google_compute_region_health_check.vars

conditions := [
    [
    {"situation_description" : "Health check deployed outside approved data-residency regions",
    "remedies":[ "Set region to an approved Australian region, e.g. australia-southeast1 or australia-southeast2"]},
    {
        "condition": "Health check region is outside the approved data-residency whitelist",
        "attribute_path" : ["region"],
        "values" : ["australia-southeast1", "australia-southeast2"],
        "policy_type" : "whitelist"
    }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
