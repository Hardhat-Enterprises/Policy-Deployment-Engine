package terraform.gcp.security.apigee.google_apigee_environment.forward_proxy_uri
import data.terraform.helpers
import data.terraform.gcp.security.apigee.google_apigee_environment.vars

conditions := [
    [
        {
            "situation_description": "forward_proxy_uri is not using a secure scheme — only http:// or https:// are permitted",
            "remedies": [
                "Set 'forward_proxy_uri' to use http:// or https:// scheme only",
                "Ensure the format follows {scheme}://{hostname}:{port}",
                "Example valid value: https://proxy.example.com:8080"
            ]
        },
        {
            "condition": "Check that forward_proxy_uri does not use insecure schemes like ftp, ssh, telnet",
            "attribute_path": ["forward_proxy_uri"],
            "values": ["*://*", [["ftp", "ssh", "telnet", "smtp", "irc"]]],
            "policy_type": "pattern blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
