package terraform.gcp.security.oracle_database.google_oracle_database_exascale_db_storage_vault.gcp_oracle_zone
import data.terraform.helpers
import data.terraform.gcp.security.oracle_database.google_oracle_database_exascale_db_storage_vault.vars

conditions := [
    [
    {"situation_description" : "The Oracle Exascale hardware is hosted in a GCP zone outside the approved Australian regions",
    "remedies":[ "Host the vault in an approved zone within australia-southeast1 or australia-southeast2 to meet data residency requirements"]},
    {
        "condition": "Test if gcp_oracle_zone is not an approved Australian zone",
        "attribute_path" : ["gcp_oracle_zone"],
        "values" : ["australia-southeast1-a-r1", "australia-southeast1-b-r1", "australia-southeast2-a-r1", "australia-southeast2-b-r1"],
        "policy_type" : "whitelist"
    }
    ]
]

# Displays a general message about policy compliance
# Use 'opa eval ... "data.terraform.gcp.security.oracle_database.google_oracle_database_exascale_db_storage_vault.gcp_oracle_zone.message"
message := helpers.get_multi_summary(conditions, vars.variables).message

# Displays a detailed summary of each resources compliance to every condition and situation
# Useful for debugging
# Use 'opa eval ... "data.terraform.gcp.security.oracle_database.google_oracle_database_exascale_db_storage_vault.gcp_oracle_zone.details"
details := helpers.get_multi_summary(conditions, vars.variables).details
