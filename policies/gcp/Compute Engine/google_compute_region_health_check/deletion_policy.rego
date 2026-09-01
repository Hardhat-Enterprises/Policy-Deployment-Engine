package terraform.gcp.security.compute.google_compute_region_health_check.deletion_policy
import data.terraform.helpers
import data.terraform.gcp.security.compute.google_compute_region_health_check.vars

conditions := [
    [
    {"situation_description" : "Health check deletion_policy is set to ABANDON, removing it from IaC governance",
    "remedies":[ "Set deletion_policy to DELETE or PREVENT so the resource stays under Terraform management instead of being abandoned as unmanaged drift"]},
    {
        "condition": "Health check deletion_policy allows the resource to be abandoned outside Terraform management",
        "attribute_path" : ["deletion_policy"],
        "values" : ["ABANDON"],
        "policy_type" : "blacklist"
    }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
