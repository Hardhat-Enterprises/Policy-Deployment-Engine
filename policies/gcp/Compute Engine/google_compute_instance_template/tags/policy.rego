package terraform.gcp.security.compute_engine.google_compute_instance_template.tags

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_instance_template.vars

conditions := [
    [
        {
            "situation_description": "The instance template uses the default http-server or https-server network tag. These tags attach GCP's default-allow-http and default-allow-https firewall rules, which open ports 80 and 443 to the whole internet, so instances can become publicly reachable without any deliberate firewall change.",
            "remedies": [
                "Remove http-server and https-server from tags.",
                "Use a team-specific tag targeted by a firewall rule that allows only the source ranges the workload needs, for example a load balancer's health check and proxy ranges."
            ]
        },
        {
            "condition": "Check that tags does not include http-server or https-server",
            "attribute_path": ["tags"],
            "values": ["http-server", "https-server"],
            "policy_type": "element blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
