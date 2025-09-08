## 🛡️ Policy Deployment Engine: `dialogflow_cx_generator`

This section provides a concise policy evaluation for the `dialogflow_cx_generator` resource in GCP.

Reference: [Terraform Registry – dialogflow_cx_generator](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/dialogflow_cx_generator)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `display_name` | The human-readable name of the generator, unique within the agent. | true | None | None |
| `parent` | The agent to create a Generator for. Format: projects/<Project ID>/locations/<Location ID>/agents/<Agent ID>. | false | None | None |
| `language_code` | The language to create generators for the following fields: * Generator.prompt_text.text If not specified, the agent's default language is used. | false | None | None |

### prompt_text Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `text` | Text input which can be used for prompt or banned phrases. | false | None | None |

### llm_model_settings Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `model` | The selected LLM model. | false | None | None |
| `prompt_text` | The custom prompt to use. | false | None | None |

### model_parameter Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `temperature` | The temperature used for sampling. Temperature sampling occurs after both topP and topK have been applied. Valid range: [0.0, 1.0] Low temperature = less random. High temperature = more random. | false | None | None |
| `max_decode_steps` | The maximum number of tokens to generate. | false | None | None |
| `top_p` | If set, only the tokens comprising the top topP probability mass are considered. If both topP and topK are set, topP will be used for further refining candidates selected with topK. Valid range: (0.0, 1.0]. Small topP = less random. Large topP = more random. | false | None | None |
| `top_k` | If set, the sampling process in each step is limited to the topK tokens with highest probabilities. Valid range: [1, 40] or 1000+. Small topK = less random. Large topK = more random. | false | None | None |

### placeholders Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `id` | Unique ID used to map custom placeholder to parameters in fulfillment. | false | None | None |
| `name` | Custom placeholder value in the prompt text. | false | None | None |
