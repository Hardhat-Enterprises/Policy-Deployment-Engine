package terraform.gcp.security.app_engine.app_engine_standard_app_version.entrypoint.shell

import data.terraform.helpers
import data.terraform.gcp.security.app_engine.app_engine_standard_app_version.vars

conditions := [
    [
        {
            "situation_description": "The App Engine Standard entrypoint is using an unapproved runtime/file structure",
            "remedies": ["Follow the format 'node ./app.js' or 'python ./main.py'"]
        },
        {
            "condition": "Whitelist approved shell execution patterns",
            "attribute_path": ["entrypoint", 0, "shell"],
            "values": ["*/*", [ ["node .", "python ."], ["app.js", "server.js", "main.py"] ]],
            "policy_type": "pattern whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details