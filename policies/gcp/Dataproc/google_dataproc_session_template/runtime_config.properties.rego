package terraform.gcp.security.dataproc.google_dataproc_session_template.runtime_config_properties

import data.terraform.helpers
import data.terraform.gcp.security.dataproc.google_dataproc_session_template.vars

conditions := [
    [
        {
            "situation_description": "Dataproc Session Template does not specify controlled runtime properties.",
            "remedies": [
                "Configure appropriate runtime properties."
            ]
        },
        {
            "condition": "Runtime properties must be configured.",
            "attribute_path": ["runtime_config", 0, "properties"],
            "values": [null, {}],
            "policy_type": "blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
