## 🛡️ Policy Deployment Engine: `pubsub_lite_subscription`

This section provides a concise policy evaluation for the `pubsub_lite_subscription` resource in GCP.

Reference: [Terraform Registry – pubsub_lite_subscription](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/pubsub_lite_subscription)

---

## 1. Argument Reference

### `topic`
- Description: (Required) A reference to a Topic resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Required) Name of the subscription.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `delivery_config`
- Description: (Optional) The settings for this subscription's message delivery. Structure is [documented below](#nested_delivery_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `region`
- Description: (Optional) The region of the pubsub lite topic.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `zone`
- Description: (Optional) The zone of the pubsub lite topic.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_delivery_config"></a>The `delivery_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `delivery_requirement`
- Description: (Required) When this subscription should send messages to subscribers relative to messages persistence in storage. Possible values are: `DELIVER_IMMEDIATELY`, `DELIVER_AFTER_STORED`, `DELIVERY_REQUIREMENT_UNSPECIFIED`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
