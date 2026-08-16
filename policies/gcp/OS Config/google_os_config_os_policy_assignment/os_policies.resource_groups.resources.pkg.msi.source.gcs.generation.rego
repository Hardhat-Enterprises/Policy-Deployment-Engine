package terraform.gcp.security.os_config.google_os_config_os_policy_assignment.os_policies_resource_groups_resources_pkg_msi_source_gcs_generation
import data.terraform.helpers
import data.terraform.gcp.security.os_config.google_os_config_os_policy_assignment.vars

conditions := [
    [
    {"situation_description" : "OS Config OS policy assignment does not pin a Cloud Storage generation (0) for the .msi package source.",
    "remedies":["Pin a real (non-zero) object generation so the Cloud Storage fetch is version-locked."]},
    {
        "condition": "Value must be present and non-empty.",
        "attribute_path" : ["os_policies", 0, "resource_groups", 0, "resources", 0, "pkg", 0, "msi", 0, "source", 0, "gcs", 0, "generation"],
        "values" : [0],
        "policy_type" : "blacklist"
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details
