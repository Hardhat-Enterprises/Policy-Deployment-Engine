package terraform.gcp.security.os_config_v2.google_os_config_v2_policy_orchestrator.orchestrated_resource_os_policy_assignment_v1_payload_os_policies_resource_groups_resources_pkg_rpm_source_gcs_generation

import data.terraform.helpers
import data.terraform.gcp.security.os_config_v2.google_os_config_v2_policy_orchestrator.vars

conditions := [
    [
    {"situation_description" : "The RPM package is fetched from a Cloud Storage object without pinning a generation, so the reference floats to whatever version is live at install time and the installed package can change silently",
    "remedies" : ["Set generation to pin the fetch to one specific version of the object"]},
    {
        "condition": "Check that a generation number is pinned for the rpm package object",
        "attribute_path" : ["orchestrated_resource",0,"os_policy_assignment_v1_payload",0,"os_policies",0,"resource_groups",0,"resources",0,"pkg",0,"rpm",0,"source",0,"gcs",0,"generation"],
        "values" : [""],
        "policy_type" : "blacklist"
    }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details