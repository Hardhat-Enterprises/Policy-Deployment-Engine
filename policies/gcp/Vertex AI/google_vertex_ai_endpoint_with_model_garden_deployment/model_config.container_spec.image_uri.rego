package terraform.gcp.security.vertex_ai.google_vertex_ai_endpoint_with_model_garden_deployment.model_config.container_spec.image_uri

import data.terraform.helpers
import data.terraform.gcp.security.vertex_ai.google_vertex_ai_endpoint_with_model_garden_deployment.vars

conditions := [
  [
    {
      "situation_description": "Serving container images must use approved immutable artifacts",
      "remedies": [
        "Use an approved Artifact Registry image pinned to a sha256 digest."
      ]
    },
    {
      "condition": "Serving container image must be configured",
      "policy_type": "blacklist",
      "attribute_path": [
        "model_config",
        0,
        "container_spec",
        0,
        "image_uri"
      ],
      "values": [
        null,
        ""
      ]
    }
  ]
]


# A resource-local supply-chain check. No shared helper modifications.
# The full URI must identify an Artifact Registry image pinned to a digest.
image_path := ["model_config", 0, "container_spec", 0, "image_uri"]
image_pattern := `^[a-z0-9-]+-docker\.pkg\.dev/[a-z][a-z0-9-]{4,28}[a-z0-9]/[a-z0-9_-]+/[a-z0-9._/-]+@sha256:[a-f0-9]{64}$`

extra := {v |
    some r in input.planned_values.root_module.resources
    r.type == vars.variables.resource_type
    uri := object.get(r.values, image_path, null)
    not valid_image(uri)
    name := r.address
    v := {
        "name": name,
        "message": sprintf("%s '%s' must use an approved Artifact Registry image pinned to a sha256 digest.", [vars.variables.friendly_resource_name, name])
    }
}

valid_image(uri) if {
    is_string(uri)
    regex.match(image_pattern, uri)
}

base := helpers.get_multi_summary(conditions, vars.variables)

extra_names := {v.name | some v in extra}

extra_details := [{
    "situation": "Serving image does not meet the immutable artifact requirement",
    "remedies": ["Use an approved Artifact Registry image pinned to a sha256 digest."],
    "non_compliant_resources": extra_names,
    "conditions": [{"Image supply-chain check": extra}]
}]

extra_messages := [
    "Situation 2: Serving image does not meet the immutable artifact requirement",
    sprintf("Non-Compliant Resources: %s", [concat(", ", sort(extra_names))])
]

result := {
    "message": array.concat(base.message, extra_messages),
    "details": array.concat(base.details, extra_details)
}

message := result.message
details := result.details
