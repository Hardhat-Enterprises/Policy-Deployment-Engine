package terraform.gcp.security.identity_aware_proxy.google_iap_web_backend_service_iam.web_backend_service

import data.terraform.gcp.helpers
import data.terraform.gcp.security.identity_aware_proxy.google_iap_web_backend_service_iam as vars

conditions := [
  [
    {"situation_description": "Sensitive admin backends must not be exposed via IAP",
     "remedies": ["Remove IAP grants on admin/ops backends or isolate them"]},
    {
      "condition": "web_backend_service must not be sensitive admin",
      "attribute_path": ["web_backend_service"],
      "values": ["grafana","kibana","jenkins","prometheus"],
      "policy_type": "blacklist"
    }
  ],
  [
    {"situation_description": "Only approved backend services may be exposed via IAP",
     "remedies": ["Use an approved backend or request approval to add it to the allow-list"]},
    {
      "condition": "web_backend_service must be in approved allow-list",
      "attribute_path": ["web_backend_service"],
      "values": [
        "orders-edge-iap",
        "k8s1-abc123-namespace-orders-80-def456"
      ],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
