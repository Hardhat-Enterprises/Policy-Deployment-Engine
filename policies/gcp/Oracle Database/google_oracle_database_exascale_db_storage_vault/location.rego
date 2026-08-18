package terraform.gcp.security.oracle_database.google_oracle_database_exascale_db_storage_vault.location
import data.terraform.helpers
import data.terraform.gcp.security.oracle_database.google_oracle_database_exascale_db_storage_vault.vars

conditions := [
    [
    {"situation_description" : "The Exascale DB Storage Vault is deployed outside the approved Australian regions",
    "remedies":[ "Deploy the vault in an approved region (australia-southeast1 or australia-southeast2) to meet data residency requirements"]},
    {
        "condition": "Test if location is not an approved Australian region",
        "attribute_path" : ["location"],
        "values" : ["australia-southeast1", "australia-southeast2"],
        "policy_type" : "whitelist"
    }
    ]
]

# Displays a general message about policy compliance
# Use 'opa eval ... "data.terraform.gcp.security.oracle_database.google_oracle_database_exascale_db_storage_vault.location.message"
message := helpers.get_multi_summary(conditions, vars.variables).message

# Displays a detailed summary of each resources compliance to every condition and situation
# Useful for debugging
# Use 'opa eval ... "data.terraform.gcp.security.oracle_database.google_oracle_database_exascale_db_storage_vault.location.details"
details := helpers.get_multi_summary(conditions, vars.variables).details
