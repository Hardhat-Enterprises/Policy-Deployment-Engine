package terraform.gcp.security.compute_engine.google_compute_instance_template.metadata_startup_script

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_instance_template.vars

conditions := [
    [
        {
            "situation_description": "The instance template embeds an inline startup script in metadata_startup_script. The script runs as root at every boot, and inline content bypasses code review and version control, so an unreviewed or tampered script is a code-injection or backdoor risk.",
            "remedies": [
                "Remove metadata_startup_script and deliver startup logic through a reviewed, version-controlled location (for example metadata startup-script-url pointing at a restricted bucket).",
                "Bake required configuration into the approved hardened image instead of running it at boot."
            ]
        },
        {
            "condition": "Check that no inline startup script is set",
            "attribute_path": ["metadata_startup_script"],
            "values": [""],
            "policy_type": "element pattern whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details