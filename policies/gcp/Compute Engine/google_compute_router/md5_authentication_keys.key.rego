package terraform.gcp.security.compute.google_compute_router.md5_authentication_keys_key
import data.terraform.helpers
import data.terraform.gcp.security.compute.google_compute_router.vars

conditions := [
    [
    {"situation_description" : "Router BGP MD5 authentication key is a weak or placeholder secret stored in config/state",
    "remedies":[ "Use a strong, unique MD5 key sourced from a secret manager; never commit placeholder values like password, secret, test, or changeme"]},
    {
        "condition": "BGP MD5 authentication key is a known weak or placeholder literal",
        "attribute_path" : ["md5_authentication_keys", 0, "key"],
        "values" : ["password", "secret", "changeme", "test", "12345", "admin"],
        "policy_type" : "blacklist"
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details