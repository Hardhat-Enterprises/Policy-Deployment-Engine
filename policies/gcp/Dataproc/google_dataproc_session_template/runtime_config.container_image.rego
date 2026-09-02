package terraform.gcp.security.dataproc.google_dataproc_session_template.runtime_config_container_image

import data.terraform.helpers
import data.terraform.gcp.security.dataproc.google_dataproc_session_template.vars

conditions := [
    [
        {
            "situation_description": "Dataproc Session Template uses a container image from a public container registry.",
            "remedies": [
                "Use a container image from an approved trusted registry."
            ]
        },
        {
            "condition": "Container image must not use public container registries.",
            "attribute_path": ["runtime_config", 0, "container_image"],
            "values": ["*", [["gcr.io", "docker.io", "index.docker.io", "quay.io"]]],
            "policy_type": "pattern blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
