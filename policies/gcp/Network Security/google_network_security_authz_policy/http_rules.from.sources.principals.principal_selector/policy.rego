package terraform.gcp.security.network_security.google_network_security_authz_policy.http_rules_from_sources_principals_principal_selector
import data.terraform.helpers
import data.terraform.gcp.security.network_security.google_network_security_authz_policy.vars

conditions := [
  [
    {
      "situation_description" : "Principal selector must not be set to PRINCIPAL_SELECTOR_UNSPECIFIED",
      "remedies":[
        "Remove PRINCIPAL_SELECTOR_UNSPECIFIED or use CLIENT_CERT_URI_SAN, CLIENT_CERT_DNS_NAME_SAN, or CLIENT_CERT_COMMON_NAME"
      ]
    },
    {
      "condition": "c1 principal_selector uses an explicit client certificate identity selector",
      "attribute_path" : ["http_rules", 0, "from", 0, "sources", 0, "principals", 0, "principal_selector"],
      "values" : ["PRINCIPAL_SELECTOR_UNSPECIFIED"],
      "policy_type" : "blacklist"
    }
  ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message
details := summary.details
