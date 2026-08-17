package terraform.gcp.security.oracle_database.cloud_exadata_infrastructure.deletion_protection
import data.terraform.helpers
import data.terraform.gcp.security.oracle_database.cloud_exadata_infrastructure.vars

conditions := [
    [
    {"situation_description" : "The Cloud Exadata Infrastructure can be destroyed by Terraform without an explicit safeguard",
    "remedies":[ "Set deletion_protection to true so a terraform destroy or a destructive apply against this instance will fail"]},
    {
        "condition": "Test if deletion_protection is not set to true",
        "attribute_path" : ["deletion_protection"],
        "values" : [true],
        "policy_type" : "whitelist"
    }
    ]
]
