package terraform.gcp.security.app_engine.google_app_engine_flexible_app_version.entrypoint_shell

import data.terraform.helpers
import data.terraform.gcp.security.app_engine.google_app_engine_flexible_app_version.vars

conditions := [
    [
        {
            "situation_description": "App Engine entrypoint contains unauthorized/insecure commands",
            "remedies": ["Please remove 'sudo', 'curl', or 'wget' from the entrypoint.shell command"]
        },
        {
            "condition": "Blacklist insecure shell commands",
            "attribute_path": ["entrypoint", 0, "shell"],
            "values": ["*/*", [ ["sudo node .", "curl .", "wget .", "sudo", "curl", "wget"], [] ]], 
            "policy_type": "pattern blacklist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details