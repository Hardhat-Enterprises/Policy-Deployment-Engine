package terraform.gcp.security.dataplex.google_dataplex_datascan.data_profile_spec_catalog_publishing_enabled

import data.terraform.gcp.security.dataplex.google_dataplex_datascan.vars
import data.terraform.helpers

conditions := [
        [
                {
                        "situation_description": "Catalog publishing is enabled for the Dataplex DataScan profile results.",
                        "remedies": [
                                "Set data_profile_spec.catalog_publishing_enabled to false or leave it unset.",
                        ],
                },
                {
                        "condition": "Dataplex DataScan profile results must not be published to the catalog.",
                        "attribute_path": ["data_profile_spec", 0, "catalog_publishing_enabled"],
                        "values": [true],
                        "policy_type": "blacklist",
                },
        ],
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
