package terraform.gcp.security.identity_aware_proxy.google_iap_web_forwarding_rule_service_iam.forwarding_rule_service_name

import data.terraform.gcp.helpers
import data.terraform.gcp.security.identity_aware_proxy.google_iap_web_forwarding_rule_service_iam as vars

conditions := [
  # S1: admin consoles as the *service* segment → block via pattern blacklist
  [
    {"situation_description": "Sensitive admin frontends must not be exposed via IAP",
     "remedies": ["Remove IAP for admin consoles or restrict via VPN/private access"]},
    {
      "condition": "forwarding_rule_service_name must not embed admin consoles",
      "attribute_path": ["forwarding_rule_service_name"],
      "values": [
        "*-*-*",  # <service>-<tier>-<env>
        [
          ["grafana","kibana","jenkins","prometheus","argocd","alertmanager","admin","ops-console"],  # service segment
          [],                                                                                         # tier segment
          []                                                                                          # env segment
        ]
      ],
      "policy_type": "pattern blacklist"
    }
  ],

  # S2: enforce approved naming <service>-<tier>-<env> (unchanged)
  [
    {"situation_description": "Forwarding rule names must follow <service>-<tier>-<env>",
     "remedies": ["Rename to approved pattern (e.g., orders-be-prod)"]},
    {
      "condition": "forwarding_rule_service_name must match approved naming",
      "attribute_path": ["forwarding_rule_service_name"],
      "values": [
        "*-*-*",
        [
          ["orders","payments","inventory","menu","reporting","notifications","pos-gateway","loyalty","kitchen-display"],
          ["be","svc","api","fe"],
          ["dev","stg","prod"]
        ]
      ],
      "policy_type": "pattern whitelist"
    }
  ],

  # S3: risky envs as the *env* segment → block via pattern blacklist
  [
    {"situation_description": "Avoid ambiguous or risky envs for public endpoints",
     "remedies": ["Use approved envs only (dev/stg/prod)"]},
    {
      "condition": "forwarding_rule_service_name must not use risky envs",
      "attribute_path": ["forwarding_rule_service_name"],
      "values": [
        "*-*-*",  # <service>-<tier>-<env>
        [
          [],                               # service segment
          [],                               # tier segment
          ["demo","poc","test","tests","tmp","devtmp"]  # env segment
        ]
      ],
      "policy_type": "pattern blacklist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
