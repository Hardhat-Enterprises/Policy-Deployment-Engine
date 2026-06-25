package terraform.gcp.security.google_data_catalog.google_data_catalog_entry_group_iam_binding.role
import data.terraform.helpers
import data.terraform.gcp.security.google_data_catalog.google_data_catalog_entry_group_iam_binding.vars

conditions := [
    [
    {"situation_description" : "Data Catalog entry group IAM binding uses an unapproved role.",
    "remedies":["Use a least-privilege IAM role approved for Data Catalog entry groups."]},
    {
        "condition": "IAM role must be in the approved list.",
        "attribute_path" : ["role"],
        "values" : ["roles/*", [["datacatalog.admin", "owner", "editor"]]],
        "policy_type" : "pattern blacklist"
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details
