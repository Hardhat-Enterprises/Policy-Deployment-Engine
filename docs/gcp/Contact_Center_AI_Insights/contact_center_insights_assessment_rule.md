## 🛡️ Policy Deployment Engine: `google_contact_center_insights_assessment_rule`

This section provides a concise policy evaluation for the `google_contact_center_insights_assessment_rule` resource in GCP.

Reference: [Terraform Registry – google_contact_center_insights_assessment_rule](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_contact_center_insights_assessment_rule)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `location` | Location of the resource. | true | false | The location of the resource is critical for compliance and security purposes. | australia-southeast1 |  |
| `active` | If true, apply this rule to conversations. Otherwise, this rule is inactive. | true | true | The active status of the rule determines whether it is applied to conversations, which can have security implications. | True |  |
| `display_name` | Display Name of the assessment rule. | true | false | Used for identification purposes only. No direct security impact. | None |  |
| `sample_rule` | Message for sampling conversations. Structure is [documented below](#nested_sample_rule). | true | false | Sampling rules determine which conversations are evaluated by this assessment rule. While critical for functionality, they do not have direct security implications. | None |  |
| `schedule_info` | Message for schedule info. Structure is [documented below](#nested_schedule_info). | true | false | Schedule information is critical for managing the execution of the assessment rule. While it does not have direct security implications, it is important for operational purposes. | None |  |
| `assessment_rule_id` | A unique ID for the new AssessmentRule. This ID will become the final component of the AssessmentRule's resource name. If no ID is specified, a server-generated ID will be used. This value should be 4-64 characters and must match the regular expression `^[A-Za-z0-9]{4,64}$`. | true | false | Used for identification purposes only. No direct security impact. | None |  |
| `project` | The ID of the project in which the resource belongs. If it is not provided, the provider project is used. | true | false | Used for identification purposes only. No direct security impact. | None |  |

### sample_rule Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `conversation_filter` | To specify the filter for the conversions that should apply this sample rule. An empty filter means this sample rule applies to all conversations. | true | true | The conversation filter is critical for ensuring that the sample rule is applied to the correct set of conversations, which can have security implications. | medium="PHONE_CALL" |  |
| `dimension` | Group by dimension to sample the conversation. If no dimension is provided, the sampling will be applied to the project level. Current supported dimensions is 'quality_metadata.agent_info.agent_id'. | true | false | Defines conversation sampling grouping only. No direct security impact. | None |  |
| `sample_percentage` | Percentage of conversations that we should sample  based on the dimension between [0, 100]. | true | true | The sample percentage determines the extent to which conversations are sampled, which can have security implications for data privacy and compliance. | 10 |  |
| `sample_row` | Number of the conversations that we should sample based on the dimension. | true | false | Defines sample data representation only. No direct security impact. | None |  |

### schedule_info Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `end_time` | End time of the schedule. If not specified, will keep scheduling new pipelines for execution until the schedule is no longer active or deleted. A timestamp in RFC3339 UTC "Zulu" format, with nanosecond resolution and up to nine fractional digits. Examples: "2014-10-02T15:01:23Z" and "2014-10-02T15:01:23.045123456Z". | true | false | Defines schedule end time only. No direct security impact. | None |  |
| `schedule` | The groc expression. Format: `every number [synchronized]` Cron syntax is not supported. Time units can be: minutes, hours Synchronized is optional and indicates that the schedule should be synchronized to the start of the interval: every 5 minutes synchronized means 00:00, 00:05 ... Otherwise the start time is random within the interval. Example: `every 5 minutes` could be  00:02, 00:07, 00:12, ... | true | false | Defines the scheduling logic for the assessment rule. No direct security impact. | None |  |
| `start_time` | Start time of the schedule. If not specified, will start as soon as the schedule is created. A timestamp in RFC3339 UTC "Zulu" format, with nanosecond resolution and up to nine fractional digits. Examples: "2014-10-02T15:01:23Z" and "2014-10-02T15:01:23.045123456Z". | true | false | Defines schedule start time only. No direct security impact. | None |  |
| `time_zone` | The timezone to use for the groc expression. If not specified, defaults to UTC. | true | false | Defines the timezone for the scheduling logic. No direct security impact. | None |  |
