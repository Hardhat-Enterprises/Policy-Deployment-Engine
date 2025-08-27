package terraform.gcp.security.analysis_note.related_url

import data.terraform.gcp.helpers
import data.terraform.gcp.security.analysis_note.related_url.vars

banned_exact  := vars.variables["banned_related_url_exact"]
banned_scheme := vars.variables["banned_related_url_scheme_regex"]
banned_host   := vars.variables["banned_related_url_host_regex"]
banned_user   := vars.variables["banned_related_url_userinfo_regex"]

# SECURITY blacklist: block unsafe schemes, localhost/private/metadata hosts,
# embedded credentials, and placeholder/empty URLs.
conditions := [
  # A) Empty/placeholder URLs are banned
  [
    {
      "situation_description": "The 'related_url.url' is empty or a placeholder.",
      "remedies": [
        "Provide a valid HTTPS URL to trusted documentation or security resources."
      ],
    },
    {
      "condition": "related_url[0].url is NOT a banned exact value",
      "attribute_path": ["related_url", 0, "url"],
      "values": banned_exact,
      "policy_type": "blacklist",
      "case_insensitive": true
    },
  ],

  # B) Unsafe URL schemes are banned (http, ftp, file, data, javascript, ws/wss)
  [
    {
      "situation_description": "The 'related_url.url' uses an unsafe scheme.",
      "remedies": [
        "Use 'https://' only."
      ],
    },
    {
      "condition": "related_url[0].url does NOT start with a banned scheme",
      "attribute_path": ["related_url", 0, "url"],
      "regex": banned_scheme,
      "policy_type": "blacklist"
    },
  ],

  # C) Local/Private/Metadata hosts are banned (SSRF risk)
  [
    {
      "situation_description": "The 'related_url.url' points to localhost/private IP/metadata.",
      "remedies": [
        "Use a routable, organization-approved HTTPS host."
      ],
    },
    {
      "condition": "related_url[0].url does NOT match banned local/private/metadata hosts",
      "attribute_path": ["related_url", 0, "url"],
      "regex": banned_host,
      "policy_type": "blacklist"
    },
  ],

  # D) Embedded credentials in URL are banned
  [
    {
      "situation_description": "The 'related_url.url' contains embedded credentials.",
      "remedies": [
        "Remove userinfo from the URL and use proper authentication mechanisms."
      ],
    },
    {
      "condition": "related_url[0].url does NOT contain embedded credentials",
      "attribute_path": ["related_url", 0, "url"],
      "regex": banned_user,
      "policy_type": "blacklist"
    },
  ],
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
