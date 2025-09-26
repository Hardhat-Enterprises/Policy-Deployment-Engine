package terraform.gcp.security.dataproc.batch

import data.terraform.gcp.helpers
import data.terraform.gcp.security.dataproc.batch.vars

conditions = [
    [
        {"situation_description" : "Dataproc batch job is using the default service account.",
         "remedies": [ "Specify a dedicated service account in 'runtime_config.properties'."]},
        {
            "condition": "Checks if a specific service account is not provided.",
            # Corrected: Updated attribute path to check inside the properties map.
            "attribute_path" : ["runtime_config", 0, "properties", "spark.yarn.submit.credentials.service.account"],
            "values" : [null, ""],
            "policy_type" : "blacklist"
        }
    ],
    [
        {"situation_description" : "Dataproc batch job is not assigned to a specific subnetwork.",
         "remedies": [ "Specify an approved subnetwork URI in 'runtime_config.properties'."]},
        {
            "condition": "Checks if a specific subnetwork is not provided.",
            # Corrected: Updated attribute path to check inside the properties map.
            "attribute_path" : ["runtime_config", 0, "properties", "spark.driver.extraClassPath"],
            "values" : [null, ""],
            "policy_type" : "blacklist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details