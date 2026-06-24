package terraform.gcp.security.google_data_catalog.google_data_catalog_taxonomy_iam_member.role
import data.terraform.helpers
import data.terraform.gcp.security.google_data_catalog.google_data_catalog_taxonomy_iam_member.vars

conditions := [
    [
    {"situation_description" : "Data Catalog taxonomy IAM member uses an over-privileged role.",
    "remedies":["Use a least-privilege IAM role approved for Data Catalog taxonomys."]},
    {
        "condition": "IAM role must not be over-privileged.",
        "attribute_path" : ["role"],
        "values" : ["roles/*", [["datacatalog.admin", "owner", "editor"]]],
        "policy_type" : "pattern blacklist"
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details
