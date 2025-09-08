## 🛡️ Policy Deployment Engine: `dialogflow_agent`

This section provides a concise policy evaluation for the `dialogflow_agent` resource in GCP.

Reference: [Terraform Registry – dialogflow_agent](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/dialogflow_agent)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `display_name` | The name of this agent. | true | None | None |
| `default_language_code` | The default language of the agent as a language tag. [See Language Support](https://cloud.google.com/dialogflow/docs/reference/language) for a list of the currently supported language codes. This field cannot be updated after creation. | true | None | None |
| `time_zone` | The time zone of this agent from the [time zone database](https://www.iana.org/time-zones), e.g., America/New_York, Europe/Paris. | true | None | None |
| `supported_language_codes` | The list of all languages supported by this agent (except for the defaultLanguageCode). | false | None | None |
| `description` | The description of this agent. The maximum length is 500 characters. If exceeded, the request is rejected. | false | None | None |
| `avatar_uri` | The URI of the agent's avatar, which are used throughout the Dialogflow console. When an image URL is entered into this field, the Dialogflow will save the image in the backend. The address of the backend image returned from the API will be shown in the [avatarUriBackend] field. | false | None | None |
| `enable_logging` | Determines whether this agent should log conversation queries. | false | None | None |
| `match_mode` | Determines how intents are detected from user queries. * MATCH_MODE_HYBRID: Best for agents with a small number of examples in intents and/or wide use of templates syntax and composite entities. * MATCH_MODE_ML_ONLY: Can be used for agents with a large number of examples in intents, especially the ones using @sys.any or very large developer entities. Possible values are: `MATCH_MODE_HYBRID`, `MATCH_MODE_ML_ONLY`. | false | None | None |
| `classification_threshold` | To filter out false positive results and still get variety in matched natural language inputs for your agent, you can tune the machine learning classification threshold. If the returned score value is less than the threshold value, then a fallback intent will be triggered or, if there are no fallback intents defined, no intent will be triggered. The score values range from 0.0 (completely uncertain) to 1.0 (completely certain). If set to 0.0, the default of 0.3 is used. | false | None | None |
| `api_version` | API version displayed in Dialogflow console. If not specified, V2 API is assumed. Clients are free to query different service endpoints for different API versions. However, bots connectors and webhook calls will follow the specified API version. * API_VERSION_V1: Legacy V1 API. * API_VERSION_V2: V2 API. * API_VERSION_V2_BETA_1: V2beta1 API. Possible values are: `API_VERSION_V1`, `API_VERSION_V2`, `API_VERSION_V2_BETA_1`. | false | None | None |
| `tier` | The agent tier. If not specified, TIER_STANDARD is assumed. * TIER_STANDARD: Standard tier. * TIER_ENTERPRISE: Enterprise tier (Essentials). * TIER_ENTERPRISE_PLUS: Enterprise tier (Plus). NOTE: Due to consistency issues, the provider will not read this field from the API. Drift is possible between the Terraform state and Dialogflow if the agent tier is changed outside of Terraform. Possible values are: `TIER_STANDARD`, `TIER_ENTERPRISE`, `TIER_ENTERPRISE_PLUS`. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |
