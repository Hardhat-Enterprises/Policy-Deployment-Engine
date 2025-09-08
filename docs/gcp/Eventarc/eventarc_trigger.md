## 🛡️ Policy Deployment Engine: `eventarc_trigger`

This section provides a concise policy evaluation for the `eventarc_trigger` resource in GCP.

Reference: [Terraform Registry – eventarc_trigger](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/eventarc_trigger)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | Required. The resource name of the trigger. Must be unique within the location on the project. | true | None | None |
| `location` | The location for the resource | true | None | None |
| `service_account` | Optional. The IAM service account email associated with the trigger. The service account represents the identity of the trigger. The principal who calls this API must have `iam.serviceAccounts.actAs` permission in the service account. See https://cloud.google.com/iam/docs/understanding-service-accounts#sa_common for more information. For Cloud Run destinations, this service account is used to generate identity tokens when invoking the service. See https://cloud.google.com/run/docs/triggering/pubsub-push#create-service-account for information on how to invoke authenticated Cloud Run services. In order to create Audit Log triggers, the service account should also have `roles/eventarc.eventReceiver` IAM role. | false | None | None |
| `labels` | Optional. User labels attached to the triggers that can be used to group resources. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | None | None |
| `channel` | Optional. The name of the channel associated with the trigger in `projects/{project}/locations/{location}/channels/{channel}` format. You must provide a channel to receive events from Eventarc SaaS partners. | false | None | None |
| `event_data_content_type` | Optional. EventDataContentType specifies the type of payload in MIME format that is expected from the CloudEvent data field. This is set to `application/json` if the value is not defined. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### matching_criteria Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `attribute` | Required. The name of a CloudEvents attribute. Currently, only a subset of attributes are supported for filtering. All triggers MUST provide a filter for the 'type' attribute. | true | None | None |
| `value` | Required. The value for the attribute. See https://cloud.google.com/eventarc/docs/creating-triggers#trigger-gcloud for available values. | true | None | None |
| `operator` | Optional. The operator used for matching the events with the value of the filter. If not specified, only events that have an exact key-value pair specified in the filter are matched. The only allowed value is `match-path-pattern`. | false | None | None |

### destination Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `cloud_run_service` | Cloud Run fully-managed service that receives the events. The service should be running in the same project of the trigger. Structure is [documented below](#nested_destination_cloud_run_service). | false | None | None |
| `cloud_function` | (Output) The Cloud Function resource name. Only Cloud Functions V2 is supported. Format projects/{project}/locations/{location}/functions/{function} This is a read-only field. [WARNING] Creating Cloud Functions V2 triggers is only supported via the Cloud Functions product. An error will be returned if the user sets this value. | none | None | None |
| `gke` | A GKE service capable of receiving events. The service should be running in the same project as the trigger. Structure is [documented below](#nested_destination_gke). | false | None | None |
| `workflow` | The resource name of the Workflow whose Executions are triggered by the events. The Workflow resource should be deployed in the same project as the trigger. Format: `projects/{project}/locations/{location}/workflows/{workflow}` | false | None | None |
| `http_endpoint` | An HTTP endpoint destination described by an URI. Structure is [documented below](#nested_destination_http_endpoint). | false | None | None |
| `network_config` | Optional. Network config is used to configure how Eventarc resolves and connect to a destination. This should only be used with HttpEndpoint destination type. Structure is [documented below](#nested_destination_network_config). | false | None | None |

### transport Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `pubsub` | The Pub/Sub topic and subscription used by Eventarc as delivery intermediary. Structure is [documented below](#nested_transport_pubsub). | false | None | None |

### cloud_run_service Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `service` | Required. The name of the Cloud Run service being addressed. See https://cloud.google.com/run/docs/reference/rest/v1/namespaces.services. Only services located in the same project of the trigger object can be addressed. | true | None | None |
| `path` | Optional. The relative path on the Cloud Run service the events should be sent to. The value must conform to the definition of URI path segment (section 3.3 of RFC2396). Examples: "/route", "route", "route/subroute". | false | None | None |
| `region` | Required. The region the Cloud Run service is deployed in. | false | None | None |

### gke Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `cluster` | Required. The name of the cluster the GKE service is running in. The cluster must be running in the same project as the trigger being created. | true | None | None |
| `location` | Required. The name of the Google Compute Engine in which the cluster resides, which can either be compute zone (for example, us-central1-a) for the zonal clusters or region (for example, us-central1) for regional clusters. | true | None | None |
| `namespace` | Required. The namespace the GKE service is running in. | true | None | None |
| `service` | Required. Name of the GKE service. | true | None | None |
| `path` | Optional. The relative path on the GKE service the events should be sent to. The value must conform to the definition of a URI path segment (section 3.3 of RFC2396). Examples: "/route", "route", "route/subroute". | false | None | None |

### http_endpoint Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `uri` | Required. The URI of the HTTP enpdoint. The value must be a RFC2396 URI string. Examples: `http://10.10.10.8:80/route`, `http://svc.us-central1.p.local:8080/`. Only HTTP and HTTPS protocols are supported. The host can be either a static IP addressable from the VPC specified by the network config, or an internal DNS hostname of the service resolvable via Cloud DNS. | true | None | None |

### network_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `network_attachment` | Required. Name of the NetworkAttachment that allows access to the destination VPC. Format: `projects/{PROJECT_ID}/regions/{REGION}/networkAttachments/{NETWORK_ATTACHMENT_NAME}` | true | None | None |

### pubsub Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `topic` | Optional. The name of the Pub/Sub topic created and managed by Eventarc system as a transport for the event delivery. Format: `projects/{PROJECT_ID}/topics/{TOPIC_NAME}. You may set an existing topic for triggers of the type google.cloud.pubsub.topic.v1.messagePublished` only. The topic you provide here will not be deleted by Eventarc at trigger deletion. | false | None | None |
| `subscription` | (Output) Output only. The name of the Pub/Sub subscription created and managed by Eventarc system as a transport for the event delivery. Format: `projects/{PROJECT_ID}/subscriptions/{SUBSCRIPTION_NAME}`. | none | None | None |
