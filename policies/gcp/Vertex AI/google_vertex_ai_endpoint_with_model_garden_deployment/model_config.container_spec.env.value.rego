package terraform.gcp.security.vertex_ai.google_vertex_ai_endpoint_with_model_garden_deployment.model_config.container_spec.env.value

import data.terraform.helpers
import data.terraform.gcp.security.vertex_ai.google_vertex_ai_endpoint_with_model_garden_deployment.vars

conditions := [
  [
    {
      "situation_description": "Recognizable credential literals must not appear in environment values",
      "remedies": [
        "Remove embedded credentials and use an approved secret-delivery mechanism."
      ]
    },
    {
      "condition": "Known credential literals are prohibited",
      "policy_type": "element blacklist",
      "attribute_path": [
        "model_config",
        0,
        "container_spec",
        0,
        "env",
        "value"
      ],
      "values": [
        "hf_",
        "-----BEGIN PRIVATE KEY-----",
        "password=",
        "secret=",
        "api_key=",
        "access_token="
      ]
    }
  ]
]


# Inspect all environment entries using walk, without recursive Rego rules.
# This detects recognizable literal secrets, not arbitrary application secrets.
secret_pattern := `(?i)(^hf_[a-z0-9]{16,}$|-----BEGIN (RSA |EC |OPENSSH )?PRIVATE KEY-----|(?:password|secret|api[_-]?key|access[_-]?token)\s*[:=]\s*\S+|^(?:ghp_|gho_|github_pat_|sk-)[a-z0-9_-]{16,})`

extra := {v |
    some r in input.planned_values.root_module.resources
    r.type == vars.variables.resource_type
    walk(r.values, [p, value])
    count(p) == 7
    p[0] == "model_config"
    p[2] == "container_spec"
    p[4] == "env"
    p[6] == "value"
    is_string(value)
    regex.match(secret_pattern, value)
    name := r.address
    v := {
        "name": name,
        "message": sprintf("%s '%s' contains a recognizable credential literal in an environment value.", [vars.variables.friendly_resource_name, name])
    }
}

base := helpers.get_multi_summary(conditions, vars.variables)
result := object.union(base, {
    "message": array.concat(base.message, [sprintf("Environment credential violations: %d", [count(extra)])]),
    "details": array.concat(base.details, [{
        "situation": "Container environment contains recognizable credential literals",
        "remedies": ["Remove embedded credentials and use an approved secret-delivery mechanism."],
        "non_compliant_resources": {v.name | some v in extra},
        "conditions": [{"Environment credential check": extra}]
    }])
})

message := result.message
details := result.details
