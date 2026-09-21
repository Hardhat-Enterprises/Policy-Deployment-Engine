package terraform.gcp.security.oracle_database.google_oracle_database_db_system.gcp_oracle_zone

import data.terraform.helpers
import data.terraform.gcp.security.oracle_database.google_oracle_database_db_system.vars

conditions := [
    [
        {
            "situation_description": "The Oracle Database DB System must use an approved GCP Oracle zone to maintain supported deployment and data-residency requirements.",
            "remedies": [
                "Configure gcp_oracle_zone using one of the approved GCP Oracle zones."
            ]
        },
        {
            "condition": "The GCP Oracle zone must be one of the approved Oracle zones.",
            "attribute_path": [
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