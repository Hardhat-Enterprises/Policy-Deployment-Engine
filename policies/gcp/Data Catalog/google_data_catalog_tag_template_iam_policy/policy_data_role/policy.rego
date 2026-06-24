package terraform.gcp.security.google_data_catalog.google_data_catalog_tag_template_iam_policy.policy_data_role
import data.terraform.helpers
import data.terraform.gcp.security.google_data_catalog.google_data_catalog_tag_template_iam_policy.vars

conditions := [
    [
    {"situation_description" : "Data Catalog tag template IAM policy data uses an over-privileged role.",
    "remedies":["Use a least-privilege IAM role approved for Data Catalog tag templates."]},
    {
        "condition": "IAM policy data must not include over-privileged roles.",
        "attribute_path" : ["policy_data"],
        "values" : ["\"role\":\"roles/*\"", [["datacatalog.admin", "owner", "editor"]]],
        "policy_type" : "pattern blacklist"
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details
