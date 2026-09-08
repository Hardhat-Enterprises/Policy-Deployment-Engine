package terraform.gcp.security.os_config.google_os_config_os_policy_assignment.os_policies_resource_groups_resources_file_state
import data.terraform.helpers
import data.terraform.gcp.security.os_config.google_os_config_os_policy_assignment.vars

conditions := [
    [
    {"situation_description" : "OS Config OS policy assignment does not enforce a managed file's state.",
    "remedies":["Set the file state to PRESENT or CONTENTS_MATCH so the security file is enforced."]},
    {
        "condition": "File state must enforce PRESENT or CONTENTS_MATCH.",
        "attribute_path" : ["os_policies", 0, "resource_groups", 0, "resources", 0, "file", 0, "state"],
        "values" : ["PRESENT", "CONTENTS_MATCH"],
        "policy_type" : "whitelist"
    }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message

details := result.details
