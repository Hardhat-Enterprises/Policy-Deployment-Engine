package terraform.gcp.security.deploy.google_clouddeploy_delivery_pipeline.suspended
import data.terraform.helpers
import data.terraform.gcp.security.deploy.google_clouddeploy_delivery_pipeline.vars

conditions := [
    [
    {"situation_description" : "The delivery pipeline is suspended, so no release can be promoted through it — including a rollback or an urgent security patch — until someone notices and unsuspends it.",
    "remedies":[ "Set suspended = false so releases can be promoted through the pipeline again"]},
    {
        "condition": "Delivery pipeline is suspended",
        "attribute_path" : ["suspended"],
        "values" : [false],
        "policy_type" : "whitelist" 
    }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message

details := result.details
