package terraform.gcp.security.oracle_database.google_oracle_database_exascale_db_storage_vault.deletion_policy
import data.terraform.helpers
import data.terraform.gcp.security.oracle_database.google_oracle_database_exascale_db_storage_vault.vars

conditions := [
    [
    {"situation_description" : "The Exascale DB Storage Vault does not prevent Terraform from destroying it",
    "remedies":[ "Set deletion_policy to \"PREVENT\" so Terraform refuses to delete the vault via destroy or a destructive apply"]},
    {
        "condition": "Test if deletion_policy is not set to PREVENT or ABANDON",
        "attribute_path" : ["deletion_policy"],
        "values" : ["PREVENT", "ABANDON"],
        "policy_type" : "whitelist"
    }
    ]
]

# Displays a general message about policy compliance
# Use 'opa eval ... "data.terraform.gcp.security.oracle_database.google_oracle_database_exascale_db_storage_vault.deletion_policy.message"
result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
