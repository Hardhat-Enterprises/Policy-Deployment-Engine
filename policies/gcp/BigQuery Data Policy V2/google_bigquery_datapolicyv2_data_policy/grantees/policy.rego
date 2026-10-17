package terraform.gcp.security.bigquery_data_policy_v2.google_bigquery_datapolicyv2_data_policy.grantees

import data.terraform.helpers
import data.terraform.gcp.security.bigquery_data_policy_v2.google_bigquery_datapolicyv2_data_policy.vars

conditions := [
    [
        {
            "situation_description": "grantees includes the public principal, which exposes governed data too broadly.",
            "remedies": ["Remove principalSet://goog/public:all from grantees."]
        },
        {
            "condition": "grantees does not include the public principal",
            "attribute_path": ["grantees"],
            "values": ["principalSet://goog/public:all"],
            "policy_type": "blacklist"
        }
    ],
    [
        {
            "situation_description": "grantees is empty, so governed data access is not explicitly scoped to approved principals.",
            "remedies": ["Set grantees to the specific principals that should have governed data access."]
        },
        {
            "condition": "grantees is not empty",
            "attribute_path": ["grantees"],
            "values": [null, []],
            "policy_type": "blacklist"
        }
    ],
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
    ],
    [
        {
            "situation_description": "grantees includes user principals, which weakens least-privilege control for governed data access.",
            "remedies": ["Replace direct user principals in grantees with service accounts, groups, or other approved managed identities."]
        },
        {
            "condition": "grantees must not contain direct user principals",
            "attribute_path": ["grantees"],
            "values": ["principal://iam.googleapis.com/users/"],
            "policy_type": "element blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
