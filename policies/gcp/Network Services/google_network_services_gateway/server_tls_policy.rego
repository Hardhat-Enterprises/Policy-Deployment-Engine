# package terraform.gcp.security.network_services.google_network_services_gateway.server_tls_policy

# import data.terraform.helpers
# import data.terraform.gcp.security.network_services.google_network_services_gateway.vars

# conditions := [
#     [
#         {
#             "situation_description": "The gateway should enforce secure TLS termination by using a Server TLS Policy.",
#             "remedies": [
#                 "Configure the server_tls_policy attribute.",
#                 "Reference an approved Server TLS Policy resource."
#             ]
#         },
#         {
#             "condition": "The server_tls_policy attribute must be configured.",
#             "attribute_path": ["server_tls_policy"],
#             "values": [
#                 ""
#             ],
#             "policy_type": "blacklist"
#         }
#     ]
# ]

# result := helpers.get_multi_summary(conditions, vars.variables)

# message := result.message
# details := result.details

package terraform.gcp.security.network_services.google_network_services_gateway.server_tls_policy

import data.terraform.helpers

import data.terraform.gcp.security.network_services.google_network_services_gateway.vars

conditions := [
    [
        {
            "situation_description": "The gateway should enforce secure TLS termination by using a valid Server TLS Policy.",
            "remedies": [
                "Configure the server_tls_policy attribute.",
                "Reference a valid Server TLS Policy resource using the format projects/*/locations/*/serverTlsPolicies/*."
            ]
        },
        {
            "condition": "The server_tls_policy attribute must be configured.",
            "attribute_path": ["server_tls_policy"],
            "values": [
                ""
            ],
            "policy_type": "blacklist"
        },
        {
            "condition": "The server_tls_policy attribute must reference a valid Server TLS Policy resource.",
            "attribute_path": ["server_tls_policy"],
            "values": [
                "^projects/[^/]+/locations/[^/]+/serverTlsPolicies/[^/]+$"
            ],
            "policy_type": "pattern whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message

details := result.details