package terraform.gcp.security.firebase_app_hosting.build.container_image

import data.terraform.gcp.helpers
import data.terraform.gcp.security.firebase_app_hosting.build.vars

conditions := [
    [
    {"situation_description" : "Container image is not from a trusted registry",
    "remedies":[ "Use container images only from Google Artifact Registry","Avoid using public Docker Hub images in production","Implement private registry for security"]},
    {
        "condition": "Container image should be from trusted registry",
        "attribute_path" : ["source", 0, "container", 0, "image"],
        "values" : ["gcr.io/*", "*.pkg.dev/*"],
        "policy_type" : "pattern whitelist" 
    }
    ],
    [
    {"situation_description" : "Container image is using potentially insecure public registries",
    "remedies":[ "Replace Docker Hub images with Artifact Registry equivalents","Use vetted and scanned container images","Implement container scanning in CI/CD pipeline"]},
    {
        "condition": "Container image should not use insecure public registries",
        "attribute_path" : ["source", 0, "container", 0, "image"],
        "values" : ["docker.io*", "index.docker.io*", "registry-1.docker.io*", "quay.io*"],
        "policy_type" : "pattern blacklist" 
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details