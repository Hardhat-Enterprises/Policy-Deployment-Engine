package terraform.gcp.security.os_config_v2.google_os_config_v2_policy_orchestrator.orchestrated_resource_os_policy_assignment_v1_payload_os_policies_resource_groups_resources_exec_enforce_file_gcs_generation

import data.terraform.helpers
import data.terraform.gcp.security.os_config_v2.google_os_config_v2_policy_orchestrator.vars

conditions := [
    [
    {"situation_description" : "The enforce stage fetches its script from a Cloud Storage object without pinning a generation, so the reference floats to whatever version is currently live and the executed script can change silently",
    "remedies" : ["Set generation to pin the fetch to one specific version of the object"]},
    {
        "condition": "Check that a generation number is pinned for the enforce stage object",
        "attribute_path" : ["orchestrated_resource",0,"os_policy_assignment_v1_payload",0,"os_policies",0,"resource_groups",0,"resources",0,"exec",0,"enforce",0,"file",0,"gcs",0,"generation"],
        "values" : [null, ""],
        "policy_type" : "blacklist"
    }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details