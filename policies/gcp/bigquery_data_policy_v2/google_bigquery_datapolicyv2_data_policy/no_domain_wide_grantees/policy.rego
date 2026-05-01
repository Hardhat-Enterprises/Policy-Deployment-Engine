package terraform.gcp.security.bigquery_data_policy_v2.google_bigquery_datapolicyv2_data_policy.no_domain_wide_grantees

import data.terraform.helpers
import data.terraform.gcp.security.bigquery_data_policy_v2.google_bigquery_datapolicyv2_data_policy.vars

conditions := [
    [
        {
            "situation_description": "grantees includes a domain-wide principal, which grants governed data access too broadly across the organisation.",
            "remedies": ["Remove domain-wide principals from grantees and use specific service accounts, groups, or approved identities instead."]
        },
        {
            "condition": "grantees must not contain domain-wide principals",
            "attribute_path": ["grantees"],
            "values": ["principalSet://goog/cloudIdentityCustomerId/C0123456789"],
            "policy_type": "blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
