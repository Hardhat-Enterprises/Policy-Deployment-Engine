## 🛡️ Policy Deployment Engine: `google_contact_center_insights_qa_question`

This section provides a concise policy evaluation for the `google_contact_center_insights_qa_question` resource in GCP.

Reference: [Terraform Registry – google_contact_center_insights_qa_question](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_contact_center_insights_qa_question)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `location` | Location of the resource. | true | false | The location of the resource is critical for compliance and security purposes. This attribute is already covered by an implemented policy in another relevant resource. Therefore, a separate policy was not created for this resource. | None |  |
| `qa_scorecard` | Resource ID segment making up resource `name`. It identifies the resource within its parent collection as described in https://google.aip.dev/122. | true | false | Provides the ID of the parent QaScorecard. No direct security impact. | None |  |
| `revision` | Resource ID segment making up resource `name`. It identifies the resource within its parent collection as described in https://google.aip.dev/122. | true | false | Provides the ID of the parent QaScorecardRevision. No direct security impact. | None |  |
| `abbreviation` | Short, descriptive string, used in the UI where it's not practical to display the full question body. E.g., "Greeting". | true | false | Provides a short, descriptive string for the question. No direct security impact. | None |  |
| `answer_choices` | A list of valid answers to the question, which the LLM must choose from. Structure is [documented below](#nested_answer_choices). | true | false | Provides the list of valid answers for the question. No direct security impact. | None |  |
| `answer_instructions` | Instructions describing how to determine the answer. | true | false | Provides instructions for determining the answer. No direct security impact. | None |  |
| `metrics` | A wrapper representing metrics calculated against a test-set on a LLM that was fine tuned for this question. Structure is [documented below](#nested_metrics). | true | false | Represents metrics calculated against a test-set on a LLM. No direct security impact. | None |  |
| `order` | Defines the order of the question within its parent scorecard revision. | true | false | Defines the order of the question within its parent scorecard revision. No direct security impact. | None |  |
| `predefined_question_config` | Configuration for a predefined question. This field will only be set if the Question Type is predefined. Structure is [documented below](#nested_predefined_question_config). | true | false | Provides configuration for a predefined question. No direct security impact. | None |  |
| `qa_question_data_options` | Options for configuring the data used to generate the QA question. Structure is [documented below](#nested_qa_question_data_options). | true | false | Provides options for configuring the data used to generate the QA question. No direct security impact. | None |  |
| `question_body` | Question text. E.g., "Did the agent greet the customer?" | true | false | Represents the text of the question. No direct security impact. | None |  |
| `question_type` | The type of question. Possible values: CUSTOMIZABLE PREDEFINED | true | false | Defines the type of the question. No direct security impact. | None |  |
| `tags` | Questions are tagged for categorization and scoring. Tags can either be: - Default Tags: These are predefined categories. They are identified by their string value (e.g., "BUSINESS", "COMPLIANCE", and "CUSTOMER"). - Custom Tags: These are user-defined categories. They are identified by their full resource name (e.g., projects/{project}/locations/{location}/qaQuestionTags/{qa_question_tag}). Both default and custom tags are used to group questions and to influence the scoring of each question. | true | false | Provides tags for categorization and scoring of questions. No direct security impact. | None |  |
| `tuning_metadata` | Metadata about the tuning operation for the question. Will only be set if a scorecard containing this question has been tuned. Structure is [documented below](#nested_tuning_metadata). | true | false | Provides metadata about the tuning operation for the question. No direct security impact. | None |  |
| `project` | The ID of the project in which the resource belongs. If it is not provided, the provider project is used. | true | false | Represents the ID of the project to which the resource belongs. No direct security impact. | None |  |

### answer_choices Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `bool_value` | Boolean value. | true | false | Provides a boolean value for the answer choice. No direct security impact. | None |  |
| `key` | A short string used as an identifier. | true | false | Provides a short string used as an identifier for the answer choice. No direct security impact. | None |  |
| `na_value` | A value of "Not Applicable (N/A)". If provided, this field may only be set to `true`. If a question receives this answer, it will be excluded from any score calculations. | true | false | Indicates if the answer is not applicable. No direct security impact. | None |  |
| `num_value` | Numerical value. | true | false | Provides a numerical value for the answer choice. No direct security impact. | None |  |
| `score` | Numerical score of the answer, used for generating the overall score of a QaScorecardResult. If the answer uses na_value, this field is unused. | true | false | Provides a numerical score for the answer. No direct security impact. | None |  |
| `str_value` | String value. | true | false | Provides a string value for the answer choice. No direct security impact. | None |  |

### metrics Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `accuracy` | Accuracy of the model. Measures the percentage of correct answers the model gave on the test set. | true | false | Provides the accuracy metric for the model. No direct security impact. | None |  |

### predefined_question_config Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `type` | The type of the predefined question. Possible values: CONVERSATION_OUTCOME CONVERSATION_OUTCOME_ESCALATION_INITIATOR_ROLE | true | false | Defines the type of the predefined question. No direct security impact. | None |  |

### qa_question_data_options Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `conversation_data_options` | Options for configuring what metadata is included in the conversation data used in QAI and Discovery Engine. Structure is [documented below](#nested_qa_question_data_options_conversation_data_options). | true | false | Provides options for configuring the conversation data used in QAI and Discovery Engine. No direct security impact. | None |  |

###   conversation_data_options Block

  | Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
  |----------|-------------|----------|-----------------|-----------|-----------|---------------|
  | `include_dialogflow_interaction_data` | Whether to include the per turn Dialogflow interaction data in conversation transcript. | true | false | Determines whether to include Dialogflow interaction data in the conversation transcript. No direct security impact. | None |  |

### tuning_metadata Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `dataset_validation_warnings` | A list of any applicable data validation warnings about the question's feedback labels. | true | false | Provides warnings about data validation issues with the question's feedback labels. No direct security impact. | None |  |
| `total_valid_label_count` | Total number of valid labels provided for the question at the time of tuining. | true | false | Represents the total number of valid labels provided for the question at the time of tuning. No direct security impact. | None |  |
| `tuning_error` | Error status of the tuning operation for the question. Will only be set if the tuning operation failed. | true | false | Represents the error status of the tuning operation for the question. No direct security impact. | None |  |
