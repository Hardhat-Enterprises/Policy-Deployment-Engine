package terraform.gcp.security.compute.google_compute_router.deletion_policy
import data.terraform.helpers
import data.terraform.gcp.security.compute.google_compute_router.vars

conditions := [
    [
    {"situation_description" : "Router deletion_policy is set to ABANDON, removing it from IaC governance",
    "remedies":[ "Set deletion_policy to DELETE or PREVENT; ABANDON orphans the router while it keeps serving NAT/VPN/Interconnect traffic"]},
    {
        "condition": "Router deletion_policy allows the resource to be abandoned outside Terraform management",
        "attribute_path" : ["deletion_policy"],
        "values" : ["ABANDON"],
        "policy_type" : "blacklist"
    }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
