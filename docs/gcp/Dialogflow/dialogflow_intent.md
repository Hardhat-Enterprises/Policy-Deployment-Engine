## 🛡️ Policy Deployment Engine: `dialogflow_intent`

This section provides a concise policy evaluation for the `dialogflow_intent` resource in GCP.

Reference: [Terraform Registry – dialogflow_intent](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/dialogflow_intent)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `display_name` | The name of this intent to be displayed on the console. | true | None | None |
| `webhook_state` | Indicates whether webhooks are enabled for the intent. * WEBHOOK_STATE_ENABLED: Webhook is enabled in the agent and in the intent. * WEBHOOK_STATE_ENABLED_FOR_SLOT_FILLING: Webhook is enabled in the agent and in the intent. Also, each slot filling prompt is forwarded to the webhook. Possible values are: `WEBHOOK_STATE_ENABLED`, `WEBHOOK_STATE_ENABLED_FOR_SLOT_FILLING`. | false | None | None |
| `priority` | The priority of this intent. Higher numbers represent higher priorities. - If the supplied value is unspecified or 0, the service translates the value to 500,000, which corresponds to the Normal priority in the console. - If the supplied value is negative, the intent is ignored in runtime detect intent requests. | false | None | None |
| `is_fallback` | Indicates whether this is a fallback intent. | false | None | None |
| `ml_disabled` | Indicates whether Machine Learning is disabled for the intent. Note: If mlDisabled setting is set to true, then this intent is not taken into account during inference in ML ONLY match mode. Also, auto-markup in the UI is turned off. | false | None | None |
| `input_context_names` | The list of context names required for this intent to be triggered. Format: projects/<Project ID>/agent/sessions/-/contexts/<Context ID>. | false | None | None |
| `events` | The collection of event names that trigger the intent. If the collection of input contexts is not empty, all of the contexts must be present in the active user session for an event to trigger this intent. See the [events reference](https://cloud.google.com/dialogflow/docs/events-overview) for more details. | false | None | None |
| `action` | The name of the action associated with the intent. Note: The action name must not contain whitespaces. | false | None | None |
| `reset_contexts` | Indicates whether to delete all contexts in the current session when this intent is matched. | false | None | None |
| `default_response_platforms` | The list of platforms for which the first responses will be copied from the messages in PLATFORM_UNSPECIFIED (i.e. default platform). Each value may be one of: `FACEBOOK`, `SLACK`, `TELEGRAM`, `KIK`, `SKYPE`, `LINE`, `VIBER`, `ACTIONS_ON_GOOGLE`, `GOOGLE_HANGOUTS`. | false | None | None |
| `parent_followup_intent_name` | The unique identifier of the parent intent in the chain of followup intents. Format: projects/<Project ID>/agent/intents/<Intent ID>. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |
