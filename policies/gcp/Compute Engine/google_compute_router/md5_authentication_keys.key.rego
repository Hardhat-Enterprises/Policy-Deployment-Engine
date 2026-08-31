package terraform.gcp.security.compute.google_compute_router.md5_authentication_keys_key
import data.terraform.helpers
import data.terraform.gcp.security.compute.google_compute_router.vars

conditions := [
    [
    {"situation_description" : "Router BGP MD5 authentication key is blank or set to a well-known default, leaving the peering session effectively unauthenticated",
    "remedies":[ "Generate an MD5 key of sufficient length and complexity and source it from a secret manager; reference it by variable rather than committing the literal value to configuration or state"]},
    {
        "condition": "BGP MD5 authentication key is set to a well-known default value",
        "attribute_path" : ["md5_authentication_keys", 0, "key"],
        "values" : ["password", "secret", "changeme", "test", "12345", "admin"],
        "policy_type" : "blacklist"
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details