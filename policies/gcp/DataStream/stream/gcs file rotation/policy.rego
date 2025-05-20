package terraform.gcp.security.datastream.stream.gcs_destination_compliance
import data.terraform.gcp.helpers
import data.terraform.gcp.security.datastream.stream.vars

conditions := [
    [
    {"situation_description": "Datastream Stream uses non-compliant GCS destination configuration.",
    "remedies": ["Ensure 'file_rotation_mb' is under 500 MB.", "Ensure 'file_rotation_interval' is under 600s.",]},
    {
        "condition": "Checks if the GCS destination configuration is compliant.",
        "attribute_path": ["destination_config", 0, "gcs_destination_config", 0, "file_rotation_interval"],
        "values": ["60s", "80s", "100s", "150s", "300s", "600s"],
        "policy_type": "whitelist"
    },
    {
        "condition": "Checks if the GCS destination configuration is compliant.",
        "attribute_path": ["destination_config", 0, "gcs_destination_config", 0, "file_rotation_mb"],
        "values": [0, 500],
        "policy_type": "range"
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
