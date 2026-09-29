package terraform.gcp.security.dataplex.google_dataplex_datascan.data_quality_spec_rules_statistic_range_expectation_statistic

import data.terraform.gcp.security.dataplex.google_dataplex_datascan.vars
import data.terraform.helpers

conditions := [
        [
                {
                        "situation_description": "The statistic range expectation does not use an explicit supported statistic.",
                        "remedies": [
                                "Set data_quality_spec.rules.statistic_range_expectation.statistic to MEAN, MIN, or MAX.",
                        ],
                },
                {
                        "condition": "Statistic range expectations must use an explicit supported statistic.",
                        "attribute_path": ["data_quality_spec", 0, "rules", 0, "statistic_range_expectation", 0, "statistic"],
                        "values": ["MEAN", "MIN", "MAX"],
                        "policy_type": "whitelist",
                },
        ],
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
