## 🛡️ Policy Deployment Engine: `eventarc_trigger`

This section provides a concise policy evaluation for the `eventarc_trigger` resource in GCP.

Reference: [Terraform Registry – eventarc_trigger](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/eventarc_trigger)

---

## 1. Argument Reference

### `name`
- Description: (Required) Required. The resource name of the trigger. Must be unique within the location on the project.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `matching_criteria`
- Description: (Required) Required. null The list of filters that applies to event attributes. Only events that match all the provided filters will be sent to the destination. Structure is [documented below](#nested_matching_criteria).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `destination`
- Description: (Required) Required. Destination specifies where the events should be sent to. Structure is [documented below](#nested_destination).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Required) The location for the resource
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `service_account`
- Description: (Optional) Optional. The IAM service account email associated with the trigger. The service account represents the identity of the trigger. The principal who calls this API must have `iam.serviceAccounts.actAs` permission in the service account. See https://cloud.google.com/iam/docs/understanding-service-accounts#sa_common for more information. For Cloud Run destinations, this service account is used to generate identity tokens when invoking the service. See https://cloud.google.com/run/docs/triggering/pubsub-push#create-service-account for information on how to invoke authenticated Cloud Run services. In order to create Audit Log triggers, the service account should also have `roles/eventarc.eventReceiver` IAM role.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `transport`
- Description: (Optional) Optional. In order to deliver messages, Eventarc may use other GCP products as transport intermediary. This field contains a reference to that transport intermediary. This information can be used for debugging purposes. Structure is [documented below](#nested_transport).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) Optional. User labels attached to the triggers that can be used to group resources. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `channel`
- Description: (Optional) Optional. The name of the channel associated with the trigger in `projects/{project}/locations/{location}/channels/{channel}` format. You must provide a channel to receive events from Eventarc SaaS partners.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `event_data_content_type`
- Description: (Optional) Optional. EventDataContentType specifies the type of payload in MIME format that is expected from the CloudEvent data field. This is set to `application/json` if the value is not defined.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_matching_criteria"></a>The `matching_criteria` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `attribute`
- Description: (Required) Required. The name of a CloudEvents attribute. Currently, only a subset of attributes are supported for filtering. All triggers MUST provide a filter for the 'type' attribute.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `value`
- Description: (Required) Required. The value for the attribute. See https://cloud.google.com/eventarc/docs/creating-triggers#trigger-gcloud for available values.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `operator`
- Description: (Optional) Optional. The operator used for matching the events with the value of the filter. If not specified, only events that have an exact key-value pair specified in the filter are matched. The only allowed value is `match-path-pattern`. <a name="nested_destination"></a>The `destination` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cloud_run_service`
- Description: (Optional) Cloud Run fully-managed service that receives the events. The service should be running in the same project of the trigger. Structure is [documented below](#nested_destination_cloud_run_service).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cloud_function`
- Description: (Output) The Cloud Function resource name. Only Cloud Functions V2 is supported. Format projects/{project}/locations/{location}/functions/{function} This is a read-only field. [WARNING] Creating Cloud Functions V2 triggers is only supported via the Cloud Functions product. An error will be returned if the user sets this value.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `gke`
- Description: (Optional) A GKE service capable of receiving events. The service should be running in the same project as the trigger. Structure is [documented below](#nested_destination_gke).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `workflow`
- Description: (Optional) The resource name of the Workflow whose Executions are triggered by the events. The Workflow resource should be deployed in the same project as the trigger. Format: `projects/{project}/locations/{location}/workflows/{workflow}`
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `http_endpoint`
- Description: (Optional) An HTTP endpoint destination described by an URI. Structure is [documented below](#nested_destination_http_endpoint).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `network_config`
- Description: (Optional) Optional. Network config is used to configure how Eventarc resolves and connect to a destination. This should only be used with HttpEndpoint destination type. Structure is [documented below](#nested_destination_network_config). <a name="nested_destination_cloud_run_service"></a>The `cloud_run_service` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `service`
- Description: (Required) Required. The name of the Cloud Run service being addressed. See https://cloud.google.com/run/docs/reference/rest/v1/namespaces.services. Only services located in the same project of the trigger object can be addressed.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `path`
- Description: (Optional) Optional. The relative path on the Cloud Run service the events should be sent to. The value must conform to the definition of URI path segment (section 3.3 of RFC2396). Examples: "/route", "route", "route/subroute".
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `region`
- Description: (Optional) Required. The region the Cloud Run service is deployed in. <a name="nested_destination_gke"></a>The `gke` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cluster`
- Description: (Required) Required. The name of the cluster the GKE service is running in. The cluster must be running in the same project as the trigger being created.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Required) Required. The name of the Google Compute Engine in which the cluster resides, which can either be compute zone (for example, us-central1-a) for the zonal clusters or region (for example, us-central1) for regional clusters.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `namespace`
- Description: (Required) Required. The namespace the GKE service is running in.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `service`
- Description: (Required) Required. Name of the GKE service.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `path`
- Description: (Optional) Optional. The relative path on the GKE service the events should be sent to. The value must conform to the definition of a URI path segment (section 3.3 of RFC2396). Examples: "/route", "route", "route/subroute". <a name="nested_destination_http_endpoint"></a>The `http_endpoint` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `uri`
- Description: (Required) Required. The URI of the HTTP enpdoint. The value must be a RFC2396 URI string. Examples: `http://10.10.10.8:80/route`, `http://svc.us-central1.p.local:8080/`. Only HTTP and HTTPS protocols are supported. The host can be either a static IP addressable from the VPC specified by the network config, or an internal DNS hostname of the service resolvable via Cloud DNS. <a name="nested_destination_network_config"></a>The `network_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `network_attachment`
- Description: (Required) Required. Name of the NetworkAttachment that allows access to the destination VPC. Format: `projects/{PROJECT_ID}/regions/{REGION}/networkAttachments/{NETWORK_ATTACHMENT_NAME}` <a name="nested_transport"></a>The `transport` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `pubsub`
- Description: (Optional) The Pub/Sub topic and subscription used by Eventarc as delivery intermediary. Structure is [documented below](#nested_transport_pubsub). <a name="nested_transport_pubsub"></a>The `pubsub` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `topic`
- Description: (Optional) Optional. The name of the Pub/Sub topic created and managed by Eventarc system as a transport for the event delivery. Format: `projects/{PROJECT_ID}/topics/{TOPIC_NAME}. You may set an existing topic for triggers of the type google.cloud.pubsub.topic.v1.messagePublished` only. The topic you provide here will not be deleted by Eventarc at trigger deletion.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `subscription`
- Description: (Output) Output only. The name of the Pub/Sub subscription created and managed by Eventarc system as a transport for the event delivery. Format: `projects/{PROJECT_ID}/subscriptions/{SUBSCRIPTION_NAME}`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
