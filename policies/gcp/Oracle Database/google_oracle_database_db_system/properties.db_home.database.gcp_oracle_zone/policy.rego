package terraform.gcp.security.oracle_database.google_oracle_database_db_system.properties_db_home_database_gcp_oracle_zone

import data.terraform.helpers
import data.terraform.gcp.security.oracle_database.google_oracle_database_db_system.vars

conditions := [
    [
        {
            "situation_description": "The Oracle Database DB System must use an approved GCP Oracle zone for the database to maintain controlled data residency and comply with organizational location requirements.",
            "remedies": [
                "Configure the database gcp_oracle_zone using one of the approved Oracle Database@Google Cloud Base Database Service zones."
            ]
        },
        {
            "condition": "The database GCP Oracle zone must be one of the approved Oracle Database@Google Cloud Base Database Service zones.",
            "attribute_path": [
                "properties",
                0,
                "db_home",
                0,
                "database",
                0,
                "gcp_oracle_zone"
            ],
            "values": [
                "asia-northeast1-a-r1",
                "asia-northeast2-a-r1",
                "australia-southeast2-a-r2",
                "asia-south1-b-r1",
                "asia-south2-b-r1",
                "northamerica-northeast1-a-r1",
                "us-central1-a-r1",
                "us-east4-a-r2",
                "us-east4-b-r1",
                "us-west3-a-r1",
                "europe-west2-a-r1",
                "europe-west2-c-r2",
                "europe-west3-a-r2",
                "europe-west3-b-r1",
                "europe-west8-a-r1",
                "europe-west8-b-r1"
            ],
            "policy_type": "whitelist"
        }
    ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)

message := summary.message

details := summary.details