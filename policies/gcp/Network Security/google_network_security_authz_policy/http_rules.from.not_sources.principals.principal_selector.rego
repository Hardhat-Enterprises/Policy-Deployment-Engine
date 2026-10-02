package terraform.gcp.security.network_security.google_network_security_authz_policy.http_rules_from_not_sources_principals_principal_selector
import data.terraform.helpers
import data.terraform.gcp.security.network_security.google_network_security_authz_policy.vars

conditions := [
  [
    {
      "situation_description" : "Principal selector must use an explicit client certificate identity selector rather than PRINCIPAL_SELECTOR_UNSPECIFIED",
      "remedies":[
        "Set principal_selector to CLIENT_CERT_URI_SAN, CLIENT_CERT_DNS_NAME_SAN, or CLIENT_CERT_COMMON_NAME"
      ]
    },
    {
      "condition": "c1 principal_selector uses an explicit client certificate identity selector",
      "attribute_path" : ["http_rules", 0, "from", 0, "not_sources", 0, "principals", 0, "principal_selector"],
      "values" : ["CLIENT_CERT_URI_SAN", "CLIENT_CERT_DNS_NAME_SAN", "CLIENT_CERT_COMMON_NAME"],
      "policy_type" : "whitelist"
    }
  ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message
details := summary.details
