package terraform.gcp.security.identity_aware_proxy.google_iap_web_cloud_run_service_iam.cloud_run_service_name

import data.terraform.gcp.helpers
import data.terraform.gcp.security.identity_aware_proxy.google_iap_web_cloud_run_service_iam as vars

# 1) Block sensitive admin consoles
# 2) Enforce naming: <service>-<tier>-<env> with approved sets

conditions := [
  [
    {"situation_description": "Sensitive admin services must not be exposed via IAP",
     "remedies": ["Isolate admin consoles from IAP", "Restrict via VPN / private access"]},
    {
      "condition": "cloud_run_service_name must not be sensitive admin",
      "attribute_path": ["cloud_run_service_name"],
      "values": ["grafana","kibana","jenkins","prometheus","argocd","alertmanager"],
      "policy_type": "blacklist"
    }
  ],
  [
    {"situation_description": "Service names must follow <service>-<tier>-<env>",
     "remedies": ["Rename to approved pattern (e.g., orders-be-prod)"]},
    {
      "condition": "cloud_run_service_name must match approved naming",
      "attribute_path": ["cloud_run_service_name"],
      "values": [
        "*-*-*",
        [
          ["orders","payments","inventory","menu","reporting","notifications","pos-gateway","loyalty","kitchen-display"],
          ["be","svc","api"],
          ["dev","stg","prod"]
        ]
      ],
      "policy_type": "pattern whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
