package terraform.gcp.security.compute_engine.google_compute_organization_security_policy_rule.match_expr_expression
import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_organization_security_policy_rule.vars
conditions := [
    [
        {
            "situation_description": "The rule's CEL expression is set to an unconditional always-true value, causing the rule's action to apply to all traffic regardless of intended match criteria.",
            "remedies": [
                "Write a specific CEL expression that reflects the intended match criteria.",
                "Avoid expressions that always evaluate to true (e.g. 'true') unless intentionally matching all traffic.",
                "Consult Google Cloud documentation on Common Expression Language syntax for details."
            ]
        },
        {
            "condition": "Check if expression is set to the unconditional value 'true'",
            "attribute_path": ["match", 0, "expr", 0, "expression"],
            "values": ["true"],
            "policy_type": "Blacklist"
        }
    ]
]
result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
