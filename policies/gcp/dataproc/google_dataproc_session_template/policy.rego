package terraform.gcp.security.dataproc.session_template.template_security_checks

import data.terraform.gcp.helpers
import data.terraform.gcp.security.dataproc.session_template.vars

conditions := [
    [
        {"situation_description" : "The session template is not configured to run with a specific service account, using an insecure default.",
         "remedies": [ "Specify a dedicated, least-privilege service account in the 'runtime_config.container_image.service_account' attribute."]},
        {
            "condition": "Checks if a specific service account is not provided.",
            "attribute_path" : ["runtime_config", 0, "container_image", 0, "service_account"],
            "values" : [null, ""],
            "policy_type" : "blacklist"
        }
    ],
    [
        {"situation_description" : "The session template is not configured with a secure subnetwork, posing a network security risk.",
         "remedies": [ "Specify a secure subnetwork URI in the 'network_config.subnetwork' attribute."]},
        {
            "condition": "Checks if a specific subnetwork is not provided.",
            "attribute_path" : ["network_config", 0, "subnetwork"],
            "values" : [null, ""],
            "policy_type" : "blacklist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details