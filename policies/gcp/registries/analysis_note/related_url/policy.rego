package terraform.gcp.security.analysis_note.related_url

import data.terraform.gcp.helpers
import data.terraform.gcp.security.analysis_note.related_url.vars

banned_exact    := vars.variables["banned_related_url_exact"]
banned_schemes  := vars.variables["banned_related_url_scheme_patterns"]
banned_hosts    := vars.variables["banned_related_url_host_patterns"]
banned_userinfo := vars.variables["banned_related_url_userinfo_patterns"]

conditions := [
  [
    {
      "situation_description": "The 'related_url.url' is empty or a placeholder.",
      "remedies": ["Provide a valid HTTPS URL to trusted documentation or security resources."],
    },
    {
      "condition": "related_url[0].url is NOT a banned value",
      "attribute_path": ["related_url", 0, "url"],
      "values": banned_exact,
      "policy_type": "blacklist"
    },
  ],
  [
    {
      "situation_description": "The 'related_url.url' uses an unsafe scheme.",
      "remedies": ["Use 'https://' only."],
    },
    {
      "condition": "related_url[0].url does NOT contain banned schemes",
      "attribute_path": ["related_url", 0, "url"],
      "values": ["*", [banned_schemes]],
      "policy_type": "pattern blacklist"
    },
  ],
  [
    {
      "situation_description": "The 'related_url.url' points to localhost/private IP/metadata.",
      "remedies": ["Use a routable, org-approved HTTPS host."],
    },
    {
      "condition": "related_url[0].url does NOT contain banned hosts",
      "attribute_path": ["related_url", 0, "url"],
      "values": ["*", [banned_hosts]],
      "policy_type": "pattern blacklist"
    },
  ],
  [
    {
      "situation_description": "The 'related_url.url' contains embedded credentials.",
      "remedies": ["Remove userinfo from the URL and use proper authentication."],
    },
    {
      "condition": "related_url[0].url does NOT contain embedded credentials",
      "attribute_path": ["related_url", 0, "url"],
      "values": ["*", [banned_userinfo]],
      "policy_type": "pattern blacklist"
    },
  ],
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
