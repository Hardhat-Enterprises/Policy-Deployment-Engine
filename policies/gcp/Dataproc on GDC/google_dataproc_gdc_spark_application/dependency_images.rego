package terraform.gcp.security.dataproc_on_gdc.google_dataproc_gdc_spark_application.dependency_images

import data.terraform.gcp.security.dataproc_on_gdc.google_dataproc_gdc_spark_application.vars
import data.terraform.helpers

conditions := [
    [
        {
            "situation_description": "Spark application dependency images must not use unapproved public container registries.",
            "remedies": [
                "Use dependency images from an approved private container registry.",
                "Avoid public registry sources such as docker.io, index.docker.io, gcr.io, and quay.io.",
            ],
        },
        {
            "condition": "dependency_images must not contain images from unapproved public container registries.",
            "attribute_path": ["dependency_images"],
            "values": [
                "docker.io",
                "index.docker.io",
                "gcr.io",
                "quay.io",
            ],
            "policy_type": "element blacklist",
        },
    ],
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
