package terraform.gcp.security.dataproc.google_dataproc_batch.runtime_config_properties

import data.terraform.helpers
import data.terraform.gcp.security.dataproc.google_dataproc_batch.vars

conditions := [
    [
        {
            "situation_description": "Dataproc Batch runtime properties do not enable Spark authentication.",
            "remedies": [
                "Set the runtime property 'spark.authenticate' to 'true' so Spark authenticates its internal connections."
            ]
        },
        {
            "condition": "Spark authentication must be enabled in the runtime properties.",
            "attribute_path": ["runtime_config", 0, "properties", "spark.authenticate"],
            "values": ["true"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
