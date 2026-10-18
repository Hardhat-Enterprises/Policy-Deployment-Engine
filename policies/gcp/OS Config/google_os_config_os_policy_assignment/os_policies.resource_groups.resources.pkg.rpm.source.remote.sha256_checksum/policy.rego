package terraform.gcp.security.os_config.google_os_config_os_policy_assignment.os_policies_resource_groups_resources_pkg_rpm_source_remote_sha256_checksum
import data.terraform.helpers
import data.terraform.gcp.security.os_config.google_os_config_os_policy_assignment.vars

conditions := [
    [
    {"situation_description" : "OS Config OS policy assignment supplies a blank integrity checksum for the .rpm package source.",
    "remedies":["Provide a non-empty SHA256 checksum so the remote file is integrity-verified."]},
    {
        "condition": "Value must be present and non-empty.",
        "attribute_path" : ["os_policies", 0, "resource_groups", 0, "resources", 0, "pkg", 0, "rpm", 0, "source", 0, "remote", 0, "sha256_checksum"],
        "values" : [""],
        "policy_type" : "blacklist"
    }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message

details := result.details
