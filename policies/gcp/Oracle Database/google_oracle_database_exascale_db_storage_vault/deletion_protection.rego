package terraform.gcp.security.oracle_database.google_oracle_database_exascale_db_storage_vault.deletion_protection
import data.terraform.helpers
import data.terraform.gcp.security.oracle_database.google_oracle_database_exascale_db_storage_vault.vars

conditions := [
    [
    {"situation_description" : "The Exascale DB Storage Vault can be destroyed by Terraform without an explicit safeguard",
    "remedies":[ "Set deletion_protection to true so a terraform destroy or a destructive apply against this vault will fail"]},
    {
        "condition": "Test if deletion_protection is not set to true",
        "attribute_path" : ["deletion_protection"],
        "values" : [true],
        "policy_type" : "whitelist"
    }
    ]
]

# Displays a general message about policy compliance
# Use 'opa eval ... "data.terraform.gcp.security.oracle_database.google_oracle_database_exascale_db_storage_vault.deletion_protection.message"
result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details