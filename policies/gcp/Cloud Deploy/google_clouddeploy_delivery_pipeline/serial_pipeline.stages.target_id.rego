package terraform.gcp.security.deploy.google_clouddeploy_delivery_pipeline.serial_pipeline_stages_target_id
import data.terraform.helpers
import data.terraform.gcp.security.deploy.google_clouddeploy_delivery_pipeline.vars

conditions := [
    [
        {"situation_description": "Delivery Pipeline missing serial pipeline configuration",
         "remedies": ["Delivery Pipeline must have serial pipeline stages defined for controlled deployment"]},
        {
            "condition": "Delivery Pipeline has serial pipeline configured",
            "attribute_path": ["serial_pipeline", 0, "stages", 0, "target_id"],
            "values": [null],
            "policy_type": "blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message

details := result.details