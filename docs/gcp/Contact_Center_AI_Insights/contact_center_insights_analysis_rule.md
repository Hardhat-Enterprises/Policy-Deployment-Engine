## 🛡️ Policy Deployment Engine: `contact_center_insights_analysis_rule`

This section provides a concise policy evaluation for the `contact_center_insights_analysis_rule` resource in GCP.

Reference: [Terraform Registry – contact_center_insights_analysis_rule](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/contact_center_insights_analysis_rule)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `location` | Location of the resource. | true | true | The location of the resource is critical for compliance and security purposes. | australia-southeast1 | us-central1 |
| `display_name` | Used only for identification and readability. No security impact. | true | false | Used for identification purposes only. No direct security impact. | None | None |
| `conversation_filter` | Filter for the conversations that should apply this analysis rule. An empty filter means this analysis rule applies to all conversations. Refer to https://cloud.google.com/contact-center/insights/docs/filtering for details. | true | true | The conversation filter is critical for ensuring that the analysis rule is applied to the correct set of conversations, which can have security implications. | medium="PHONE_CALL" |  |
| `annotator_selector` | Defines the annotator settings used by the Contact Center Insights analysis rule. | true | false | Defines analysis annotator configuration only. No direct security impact. | None | None |
| `analysis_percentage` | Percentage of conversations that we should apply this analysis setting automatically, between [0, 1]. For example, 0.1 means 10%. Conversations are sampled in a determenestic way. The original runtime_percentage & upload percentage will be replaced by defining filters on the conversation. | true | false | Controls sampling percentage. No direct security impact. | None | None |
| `active` | If true, apply this rule to conversations. Otherwise, this rule is inactive and saved as a draft. | true | true | Disabling this rule prevents conversations from being analyzed, which may reduce policy enforcement and monitoring coverage. | None | None |
| `project` | If it is not provided, the provider project is used. | true | false | Defines the project context only. No direct security impact. | None | None |
| `summarization_config` |  | true | false | Defines summarization configuration only. No direct security impact. | None | None |
| `qa_config` |  | true | false | Defines QA configuration only. No direct security impact. | None | None |
| `scorecard_list` |  | true | false | Defines scorecard configuration only. No direct security impact. | None | None |

### annotator_selector Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `run_interruption_annotator` | Whether to run the interruption annotator. | true | false | This controls whether sentiment analysis is performed. No direct security impact. | None | None |
| `phrase_matchers` | The list of phrase matchers to run. If not provided, all active phrase matchers will be used. If inactive phrase matchers are provided, they will not be used. Phrase matchers will be run only if run_phrase_matcher_annotator is set to true. Format: projects/{project}/locations/{location}/phraseMatchers/{phrase_matcher} | true | false | Specifies phrase matching configuration only. No direct security impact. | None | None |
| `run_entity_annotator` | Whether to run the entity annotator. | true | false | Controls entity analysis behaviour only. No direct security impact. | None | None |
| `issue_models` | The issue model to run. If not provided, the most recently deployed topic model will be used. The provided issue model will only be used for inference if the issue model is deployed and if run_issue_model_annotator is set to true. If more than one issue model is provided, only the first provided issue model will be used for inference. | true | false | Specifies issue model configuration only. No direct security impact. | None | None |
| `run_qa_annotator` | Whether to run the QA annotator. | true | false | Controls QA analysis behaviour only. No direct security impact. | None | None |
| `run_silence_annotator` | Whether to run the silence annotator. | true | false | Controls silence analysis behaviour only. No direct security impact. | None | None |
| `run_phrase_matcher_annotator` | Whether to run the active phrase matcher annotator(s). | true | false | Controls phrase matcher analysis behaviour only. No direct security impact. | None | None |
| `run_sentiment_annotator` | Whether to run the sentiment annotator. | true | false | No direct security impact. | True | False |
| `run_intent_annotator` | Whether to run the intent annotator. | true | false | Controls intent analysis behaviour only. No direct security impact. | None | None |
| `run_issue_model_annotator` | Whether to run the issue model annotator. A model should have already been deployed for this to take effect. | true | false | Controls issue model analysis behaviour only. No direct security impact. | None | None |
| `run_summarization_annotator` | Whether to run the summarization annotator. | true | false | Controls summarization behaviour only. No direct security impact. | True | False |
| `summarization_config` | Configuration for summarization. Structure is [documented below](#nested_annotator_selector_summarization_config). | true | false | Defines summarization configuration only. No direct security impact. | None | None |
| `qa_config` | Configuration for the QA feature. Structure is [documented below](#nested_annotator_selector_qa_config). | true | false | Defines QA configuration only. No direct security impact. | None | None |

### summarization_config Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `conversation_profile` | Resource name of the Dialogflow conversation profile. Format: projects/{project}/locations/{location}/conversationProfiles/{conversation_profile} | true | false | Defines the conversation profile configuration only. No direct security impact. | None | None |
| `summarization_model` | Default summarization model to be used. Possible values: SUMMARIZATION_MODEL_UNSPECIFIED BASELINE_MODEL BASELINE_MODEL_V2_0 Possible values are: `BASELINE_MODEL`, `BASELINE_MODEL_V2_0`. | true | false | Defines the summarization model only. No direct security impact. | None | None |

### qa_config Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `scorecard_list` | Container for a list of scorecards. Structure is [documented below](#nested_annotator_selector_qa_config_scorecard_list). | true | false | Defines the scorecard list configuration only. No direct security impact. | None | None |

### scorecard_list Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `qa_scorecard_revisions` | List of QaScorecardRevisions. | true | false | Defines QaScorecardRevisions only. No direct security impact. | None | None |
