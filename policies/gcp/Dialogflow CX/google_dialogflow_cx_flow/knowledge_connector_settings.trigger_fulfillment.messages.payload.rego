package terraform.gcp.security.dialogflow_cx.google_dialogflow_cx_flow.knowledge_connector_settings_trigger_fulfillment_messages_payload

import data.terraform.helpers as helpers
import data.terraform.gcp.security.dialogflow_cx.google_dialogflow_cx_flow.vars as vars

conditions := [
    [
        {
            "situation_description": "Dialogflow CX fulfillment payload contains an obvious hard-coded password value.",
            "remedies": [
                "Remove hard-coded password values from the payload and retrieve sensitive credentials from an approved secret-management mechanism."
            ],
        },
        {
            "condition": "Payload must not contain common insecure password placeholder values.",
            "attribute_path": [
                "knowledge_connector_settings",
                0,
                "trigger_fulfillment",
                0,
                "messages",
                0,
                "payload"
            ],
            "values": [
                "\"password\":\"*\"",
                [["password", "changeme", "admin", "123456"]]
            ],
            "policy_type": "pattern blacklist",
        },
    ],
    [
        {
            "situation_description": "Dialogflow CX fulfillment payload contains an obvious hard-coded secret value.",
            "remedies": [
                "Remove hard-coded secret values from the payload and use an approved secret-management mechanism."
            ],
        },
        {
            "condition": "Payload must not contain common insecure secret placeholder values.",
            "attribute_path": [
                "knowledge_connector_settings",
                0,
                "trigger_fulfillment",
                0,
                "messages",
                0,
                "payload"
            ],
            "values": [
                "\"secret\":\"*\"",
                [["secret", "changeme", "password", "123456"]]
            ],
            "policy_type": "pattern blacklist",
        },
    ],
    [
        {
            "situation_description": "Dialogflow CX fulfillment payload contains an obvious hard-coded token value.",
            "remedies": [
                "Remove hard-coded token values from the payload and reference credentials securely at runtime."
            ],
        },
        {
            "condition": "Payload must not contain common insecure token placeholder values.",
            "attribute_path": [
                "knowledge_connector_settings",
                0,
                "trigger_fulfillment",
                0,
                "messages",
                0,
                "payload"
            ],
            "values": [
                "\"token\":\"*\"",
                [["token", "secret", "changeme", "123456"]]
            ],
            "policy_type": "pattern blacklist",
        },
    ],
    [
        {
            "situation_description": "Dialogflow CX fulfillment payload contains an obvious hard-coded API key value.",
            "remedies": [
                "Remove hard-coded API key values from the payload and retrieve API credentials from an approved secret-management mechanism."
            ],
        },
        {
            "condition": "Payload must not contain common insecure API key placeholder values.",
            "attribute_path": [
                "knowledge_connector_settings",
                0,
                "trigger_fulfillment",
                0,
                "messages",
                0,
                "payload"
            ],
            "values": [
                "\"api_key\":\"*\"",
                [["api_key", "changeme", "secret", "123456"]]
            ],
            "policy_type": "pattern blacklist",
        },
    ],
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
