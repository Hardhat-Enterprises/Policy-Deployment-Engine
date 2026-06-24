package terraform.gcp.security.dataflow.google_dataflow_job.kms_key_name

import data.terraform.helpers
import data.terraform.gcp.security.dataflow.google_dataflow_job.vars

conditions := [
    [
        {
            "situation_description": "Dataflow job does not use a customer-managed encryption key (CMEK) for data encryption.",
            "remedies": ["Set 'kms_key_name' to a valid Cloud KMS key in the format 'projects/PROJECT_ID/locations/LOCATION/keyRings/KEY_RING/cryptoKeys/KEY'."]
        },
        {
            "condition": "Check if CMEK encryption key is configured",
            "attribute_path": ["kms_key_name"],
            "values": [null],
            "policy_type": "blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details