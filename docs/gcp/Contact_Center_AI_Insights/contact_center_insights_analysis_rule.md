## 🛡️ Policy Deployment Engine: `contact_center_insights_analysis_rule`

This section provides a concise policy evaluation for the `contact_center_insights_analysis_rule` resource in GCP.

Reference: [Terraform Registry – contact_center_insights_analysis_rule](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/contact_center_insights_analysis_rule)

---

## 1. Argument Reference

### `location`
- Description: (Required) Location of the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `display_name`
- Description: (Optional) Display Name of the analysis rule.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `conversation_filter`
- Description: (Optional) Filter for the conversations that should apply this analysis rule. An empty filter means this analysis rule applies to all conversations. Refer to https://cloud.google.com/contact-center/insights/docs/filtering for details.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `annotator_selector`
- Description: (Optional) Selector of all available annotators and phrase matchers to run. Structure is [documented below](#nested_annotator_selector).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `analysis_percentage`
- Description: (Optional) Percentage of conversations that we should apply this analysis setting automatically, between [0, 1]. For example, 0.1 means 10%. Conversations are sampled in a determenestic way. The original runtime_percentage & upload percentage will be replaced by defining filters on the conversation.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `active`
- Description: (Optional) If true, apply this rule to conversations. Otherwise, this rule is inactive and saved as a draft.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_annotator_selector"></a>The `annotator_selector` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `run_interruption_annotator`
- Description: (Optional) Whether to run the interruption annotator.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `phrase_matchers`
- Description: (Optional) The list of phrase matchers to run. If not provided, all active phrase matchers will be used. If inactive phrase matchers are provided, they will not be used. Phrase matchers will be run only if run_phrase_matcher_annotator is set to true. Format: projects/{project}/locations/{location}/phraseMatchers/{phrase_matcher}
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `run_entity_annotator`
- Description: (Optional) Whether to run the entity annotator.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `issue_models`
- Description: (Optional) The issue model to run. If not provided, the most recently deployed topic model will be used. The provided issue model will only be used for inference if the issue model is deployed and if run_issue_model_annotator is set to true. If more than one issue model is provided, only the first provided issue model will be used for inference.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `run_qa_annotator`
- Description: (Optional) Whether to run the QA annotator.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `run_silence_annotator`
- Description: (Optional) Whether to run the silence annotator.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `run_phrase_matcher_annotator`
- Description: (Optional) Whether to run the active phrase matcher annotator(s).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `run_sentiment_annotator`
- Description: (Optional) Whether to run the sentiment annotator.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `run_intent_annotator`
- Description: (Optional) Whether to run the intent annotator.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `run_issue_model_annotator`
- Description: (Optional) Whether to run the issue model annotator. A model should have already been deployed for this to take effect.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `run_summarization_annotator`
- Description: (Optional) Whether to run the summarization annotator.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `summarization_config`
- Description: (Optional) Configuration for summarization. Structure is [documented below](#nested_annotator_selector_summarization_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `qa_config`
- Description: (Optional) Configuration for the QA feature. Structure is [documented below](#nested_annotator_selector_qa_config). <a name="nested_annotator_selector_summarization_config"></a>The `summarization_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `conversation_profile`
- Description: (Optional) Resource name of the Dialogflow conversation profile. Format: projects/{project}/locations/{location}/conversationProfiles/{conversation_profile}
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `summarization_model`
- Description: (Optional) Default summarization model to be used. Possible values: SUMMARIZATION_MODEL_UNSPECIFIED BASELINE_MODEL BASELINE_MODEL_V2_0 Possible values are: `BASELINE_MODEL`, `BASELINE_MODEL_V2_0`. <a name="nested_annotator_selector_qa_config"></a>The `qa_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `scorecard_list`
- Description: (Optional) Container for a list of scorecards. Structure is [documented below](#nested_annotator_selector_qa_config_scorecard_list). <a name="nested_annotator_selector_qa_config_scorecard_list"></a>The `scorecard_list` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `qa_scorecard_revisions`
- Description: (Optional) List of QaScorecardRevisions.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
