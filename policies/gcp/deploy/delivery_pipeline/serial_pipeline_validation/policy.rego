package terraform.gcp.security.deploy.delivery_pipeline.serial_pipeline_validation
import data.terraform.gcp.helpers
import data.terraform.gcp.security.deploy.delivery_pipeline.vars

conditions := [
    [
        {"situation_description": "Delivery Pipeline missing serial pipeline configuration",
         "remedies": ["Delivery Pipeline must have serial pipeline stages defined for controlled deployment"]},
        {
            "condition": "Delivery Pipeline has serial pipeline configured",
            "attribute_path": ["serial_pipeline"],
            "values": [[]],
            "policy_type": "blacklist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details