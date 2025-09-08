## 🛡️ Policy Deployment Engine: `contact_center_insights_analysis_rule`

This section provides a concise policy evaluation for the `contact_center_insights_analysis_rule` resource in GCP.

Reference: [Terraform Registry – contact_center_insights_analysis_rule](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/contact_center_insights_analysis_rule)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `location` | Location of the resource. | true | None | None |
| `display_name` | Display Name of the analysis rule. | false | None | None |
| `conversation_filter` | Filter for the conversations that should apply this analysis rule. An empty filter means this analysis rule applies to all conversations. Refer to https://cloud.google.com/contact-center/insights/docs/filtering for details. | false | None | None |
| `analysis_percentage` | Percentage of conversations that we should apply this analysis setting automatically, between [0, 1]. For example, 0.1 means 10%. Conversations are sampled in a determenestic way. The original runtime_percentage & upload percentage will be replaced by defining filters on the conversation. | false | None | None |
| `active` | If true, apply this rule to conversations. Otherwise, this rule is inactive and saved as a draft. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### annotator_selector Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `run_interruption_annotator` | Whether to run the interruption annotator. | false | None | None |
| `phrase_matchers` | The list of phrase matchers to run. If not provided, all active phrase matchers will be used. If inactive phrase matchers are provided, they will not be used. Phrase matchers will be run only if run_phrase_matcher_annotator is set to true. Format: projects/{project}/locations/{location}/phraseMatchers/{phrase_matcher} | false | None | None |
| `run_entity_annotator` | Whether to run the entity annotator. | false | None | None |
| `issue_models` | The issue model to run. If not provided, the most recently deployed topic model will be used. The provided issue model will only be used for inference if the issue model is deployed and if run_issue_model_annotator is set to true. If more than one issue model is provided, only the first provided issue model will be used for inference. | false | None | None |
| `run_qa_annotator` | Whether to run the QA annotator. | false | None | None |
| `run_silence_annotator` | Whether to run the silence annotator. | false | None | None |
| `run_phrase_matcher_annotator` | Whether to run the active phrase matcher annotator(s). | false | None | None |
| `run_sentiment_annotator` | Whether to run the sentiment annotator. | false | None | None |
| `run_intent_annotator` | Whether to run the intent annotator. | false | None | None |
| `run_issue_model_annotator` | Whether to run the issue model annotator. A model should have already been deployed for this to take effect. | false | None | None |
| `run_summarization_annotator` | Whether to run the summarization annotator. | false | None | None |
| `summarization_config` | Configuration for summarization. Structure is [documented below](#nested_annotator_selector_summarization_config). | false | None | None |
| `qa_config` | Configuration for the QA feature. Structure is [documented below](#nested_annotator_selector_qa_config). | false | None | None |

### summarization_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `conversation_profile` | Resource name of the Dialogflow conversation profile. Format: projects/{project}/locations/{location}/conversationProfiles/{conversation_profile} | false | None | None |
| `summarization_model` | Default summarization model to be used. Possible values: SUMMARIZATION_MODEL_UNSPECIFIED BASELINE_MODEL BASELINE_MODEL_V2_0 Possible values are: `BASELINE_MODEL`, `BASELINE_MODEL_V2_0`. | false | None | None |

### qa_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `scorecard_list` | Container for a list of scorecards. Structure is [documented below](#nested_annotator_selector_qa_config_scorecard_list). | false | None | None |

### scorecard_list Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `qa_scorecard_revisions` | List of QaScorecardRevisions. | false | None | None |
