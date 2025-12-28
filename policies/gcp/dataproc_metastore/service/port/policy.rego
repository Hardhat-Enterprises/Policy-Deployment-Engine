package terraform.gcp.security.dataproc_metastore.service.port
import data.terraform.helpers
import data.terraform.gcp.security.dataproc_metastore.service.vars

conditions := [
    [
        {
            "situation_description": "Metastore is not using the default port.",
            "remedies": ["Set port to 9083"]
        },
        {
            "condition": "Check if the metastore port is set to the default (9083).",
            "attribute_path": ["port"],
            "values": ["9083", "443"],
            "policy_type": "whitelist"
        }
    ]
]


message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details