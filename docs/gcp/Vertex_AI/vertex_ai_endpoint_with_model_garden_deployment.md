## 🛡️ Policy Deployment Engine: `vertex_ai_endpoint_with_model_garden_deployment`

This section provides a concise policy evaluation for the `vertex_ai_endpoint_with_model_garden_deployment` resource in GCP.

Reference: [Terraform Registry – vertex_ai_endpoint_with_model_garden_deployment](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/vertex_ai_endpoint_with_model_garden_deployment)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `location` | Resource ID segment making up resource `location`. It identifies the resource within its parent collection as described in https://google.aip.dev/122. | true | None | None |
| `publisher_model_name` | The Model Garden model to deploy. Format: `publishers/{publisher}/models/{publisher_model}@{version_id}`, or `publishers/hf-{hugging-face-author}/models/{hugging-face-model-name}@001`. | false | None | None |
| `hugging_face_model_id` | The Hugging Face model to deploy. Format: Hugging Face model ID like `google/gemma-2-2b-it`. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### model_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `hugging_face_cache_enabled` | If true, the model will deploy with a cached version instead of directly downloading the model artifacts from Hugging Face. This is suitable for VPC-SC users with limited internet access. | false | None | None |
| `model_display_name` | The user-specified display name of the uploaded model. If not set, a default name will be used. | false | None | None |
| `container_spec` | Specification of a container for serving predictions. Some fields in this message correspond to fields in the [Kubernetes Container v1 core specification](https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.23/#container-v1-core). Structure is [documented below](#nested_model_config_container_spec). | false | None | None |
| `accept_eula` | Whether the user accepts the End User License Agreement (EULA) for the model. | false | None | None |
| `hugging_face_access_token` | The Hugging Face read access token used to access the model artifacts of gated models. | false | None | None |

### endpoint_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `endpoint_display_name` | The user-specified display name of the endpoint. If not set, a default name will be used. | false | None | None |
| `dedicated_endpoint_enabled` | If true, the endpoint will be exposed through a dedicated DNS [Endpoint.dedicated_endpoint_dns]. Your request to the dedicated DNS will be isolated from other users' traffic and will have better performance and reliability. Note: Once you enabled dedicated endpoint, you won't be able to send request to the shared DNS {region}-aiplatform.googleapis.com. The limitations will be removed soon. | false | None | None |

### deploy_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `system_labels` | System labels for Model Garden deployments. These labels are managed by Google and for tracking purposes only. | false | None | None |
| `dedicated_resources` | A description of resources that are dedicated to a DeployedModel or DeployedIndex, and that need a higher degree of manual configuration. Structure is [documented below](#nested_deploy_config_dedicated_resources). | false | None | None |
| `fast_tryout_enabled` | If true, enable the QMT fast tryout feature for this model if possible. | false | None | None |

### container_spec Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `ports` | List of ports to expose from the container. Vertex AI sends any prediction requests that it receives to the first port on this list. Vertex AI also sends [liveness and health checks](https://cloud.google.com/vertex-ai/docs/predictions/custom-container-requirements#liveness) to this port. If you do not specify this field, it defaults to following value: ```json [ { "containerPort": 8080 } ] ``` Vertex AI does not use ports other than the first one listed. This field corresponds to the `ports` field of the Kubernetes Containers [v1 core API](https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.23/#container-v1-core). Structure is [documented below](#nested_model_config_container_spec_ports). | false | None | None |
| `predict_route` | HTTP path on the container to send prediction requests to. Vertex AI forwards requests sent using projects.locations.endpoints.predict to this path on the container's IP address and port. Vertex AI then returns the container's response in the API response. For example, if you set this field to `/foo`, then when Vertex AI receives a prediction request, it forwards the request body in a POST request to the `/foo` path on the port of your container specified by the first value of this `ModelContainerSpec`'s ports field. If you don't specify this field, it defaults to the following value when you deploy this Model to an Endpoint:/v1/endpoints/ENDPOINT/deployedModels/DEPLOYED_MODEL:predict The placeholders in this value are replaced as follows: * ENDPOINT: The last segment (following `endpoints/`)of the Endpoint.name][] field of the Endpoint where this Model has been deployed. (Vertex AI makes this value available to your container code as the [`AIP_ENDPOINT_ID` environment variable](https://cloud.google.com/vertex-ai/docs/predictions/custom-container-requirements#aip-variables).) * DEPLOYED_MODEL: DeployedModel.id of the `DeployedModel`. (Vertex AI makes this value available to your container code as the [`AIP_DEPLOYED_MODEL_ID` environment variable](https://cloud.google.com/vertex-ai/docs/predictions/custom-container-requirements#aip-variables).) | false | None | None |
| `health_route` | HTTP path on the container to send health checks to. Vertex AI intermittently sends GET requests to this path on the container's IP address and port to check that the container is healthy. Read more about [health checks](https://cloud.google.com/vertex-ai/docs/predictions/custom-container-requirements#health). For example, if you set this field to `/bar`, then Vertex AI intermittently sends a GET request to the `/bar` path on the port of your container specified by the first value of this `ModelContainerSpec`'s ports field. If you don't specify this field, it defaults to the following value when you deploy this Model to an Endpoint:/v1/endpoints/ENDPOINT/deployedModels/DEPLOYED_MODEL:predict The placeholders in this value are replaced as follows: * ENDPOINT: The last segment (following `endpoints/`)of the Endpoint.name][] field of the Endpoint where this Model has been deployed. (Vertex AI makes this value available to your container code as the [`AIP_ENDPOINT_ID` environment variable](https://cloud.google.com/vertex-ai/docs/predictions/custom-container-requirements#aip-variables).) * DEPLOYED_MODEL: DeployedModel.id of the `DeployedModel`. (Vertex AI makes this value available to your container code as the [`AIP_DEPLOYED_MODEL_ID` environment variable](https://cloud.google.com/vertex-ai/docs/predictions/custom-container-requirements#aip-variables).) | false | None | None |
| `deployment_timeout` | Deployment timeout. Limit for deployment timeout is 2 hours. | false | None | None |
| `startup_probe` | Probe describes a health check to be performed against a container to determine whether it is alive or ready to receive traffic. Structure is [documented below](#nested_model_config_container_spec_startup_probe). | false | None | None |
| `health_probe` | Probe describes a health check to be performed against a container to determine whether it is alive or ready to receive traffic. Structure is [documented below](#nested_model_config_container_spec_health_probe). | false | None | None |
| `image_uri` | URI of the Docker image to be used as the custom container for serving predictions. This URI must identify an image in Artifact Registry or Container Registry. Learn more about the [container publishing requirements](https://cloud.google.com/vertex-ai/docs/predictions/custom-container-requirements#publishing), including permissions requirements for the Vertex AI Service Agent. The container image is ingested upon ModelService.UploadModel, stored internally, and this original path is afterwards not used. To learn about the requirements for the Docker image itself, see [Custom container requirements](https://cloud.google.com/vertex-ai/docs/predictions/custom-container-requirements#). You can use the URI to one of Vertex AI's [pre-built container images for prediction](https://cloud.google.com/vertex-ai/docs/predictions/pre-built-containers) in this field. | true | None | None |
| `command` | Specifies the command that runs when the container starts. This overrides the container's [ENTRYPOINT](https://docs.docker.com/engine/reference/builder/#entrypoint). Specify this field as an array of executable and arguments, similar to a Docker `ENTRYPOINT`'s "exec" form, not its "shell" form. If you do not specify this field, then the container's `ENTRYPOINT` runs, in conjunction with the args field or the container's [`CMD`](https://docs.docker.com/engine/reference/builder/#cmd), if either exists. If this field is not specified and the container does not have an `ENTRYPOINT`, then refer to the Docker documentation about [how `CMD` and `ENTRYPOINT` interact](https://docs.docker.com/engine/reference/builder/#understand-how-cmd-and-entrypoint-interact). If you specify this field, then you can also specify the `args` field to provide additional arguments for this command. However, if you specify this field, then the container's `CMD` is ignored. See the [Kubernetes documentation about how the `command` and `args` fields interact with a container's `ENTRYPOINT` and `CMD`](https://kubernetes.io/docs/tasks/inject-data-application/define-command-argument-container/#notes). In this field, you can reference [environment variables set by Vertex AI](https://cloud.google.com/vertex-ai/docs/predictions/custom-container-requirements#aip-variables) and environment variables set in the env field. You cannot reference environment variables set in the Docker image. In order for environment variables to be expanded, reference them by using the following syntax:$(VARIABLE_NAME) Note that this differs from Bash variable expansion, which does not use parentheses. If a variable cannot be resolved, the reference in the input string is used unchanged. To avoid variable expansion, you can escape this syntax with `$$`; for example:$$(VARIABLE_NAME) This field corresponds to the `command` field of the Kubernetes Containers [v1 core API](https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.23/#container-v1-core). | false | None | None |
| `args` | Specifies arguments for the command that runs when the container starts. This overrides the container's [`CMD`](https://docs.docker.com/engine/reference/builder/#cmd). Specify this field as an array of executable and arguments, similar to a Docker `CMD`'s "default parameters" form. If you don't specify this field but do specify the command field, then the command from the `command` field runs without any additional arguments. See the [Kubernetes documentation about how the `command` and `args` fields interact with a container's `ENTRYPOINT` and `CMD`](https://kubernetes.io/docs/tasks/inject-data-application/define-command-argument-container/#notes). If you don't specify this field and don't specify the `command` field, then the container's [`ENTRYPOINT`](https://docs.docker.com/engine/reference/builder/#cmd) and `CMD` determine what runs based on their default behavior. See the Docker documentation about [how `CMD` and `ENTRYPOINT` interact](https://docs.docker.com/engine/reference/builder/#understand-how-cmd-and-entrypoint-interact). In this field, you can reference [environment variables set by Vertex AI](https://cloud.google.com/vertex-ai/docs/predictions/custom-container-requirements#aip-variables) and environment variables set in the env field. You cannot reference environment variables set in the Docker image. In order for environment variables to be expanded, reference them by using the following syntax:$(VARIABLE_NAME) Note that this differs from Bash variable expansion, which does not use parentheses. If a variable cannot be resolved, the reference in the input string is used unchanged. To avoid variable expansion, you can escape this syntax with `$$`; for example:$$(VARIABLE_NAME) This field corresponds to the `args` field of the Kubernetes Containers [v1 core API](https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.23/#container-v1-core). | false | None | None |
| `grpc_ports` | List of ports to expose from the container. Vertex AI sends gRPC prediction requests that it receives to the first port on this list. Vertex AI also sends liveness and health checks to this port. If you do not specify this field, gRPC requests to the container will be disabled. Vertex AI does not use ports other than the first one listed. This field corresponds to the `ports` field of the Kubernetes Containers v1 core API. Structure is [documented below](#nested_model_config_container_spec_grpc_ports). | false | None | None |
| `shared_memory_size_mb` | The amount of the VM memory to reserve as the shared memory for the model in megabytes. | false | None | None |
| `liveness_probe` | Probe describes a health check to be performed against a container to determine whether it is alive or ready to receive traffic. Structure is [documented below](#nested_model_config_container_spec_liveness_probe). | false | None | None |
| `env` | List of environment variables to set in the container. After the container starts running, code running in the container can read these environment variables. Additionally, the command and args fields can reference these variables. Later entries in this list can also reference earlier entries. For example, the following example sets the variable `VAR_2` to have the value `foo bar`: ```json [ { "name": "VAR_1", "value": "foo" }, { "name": "VAR_2", "value": "$(VAR_1) bar" } ] ``` If you switch the order of the variables in the example, then the expansion does not occur. This field corresponds to the `env` field of the Kubernetes Containers [v1 core API](https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.23/#container-v1-core). Structure is [documented below](#nested_model_config_container_spec_env). | false | None | None |

### ports Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `container_port` | The number of the port to expose on the pod's IP address. Must be a valid port number, between 1 and 65535 inclusive. | false | None | None |

### startup_probe Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `exec` | ExecAction specifies a command to execute. Structure is [documented below](#nested_model_config_container_spec_startup_probe_exec). | false | None | None |
| `http_get` | HttpGetAction describes an action based on HTTP Get requests. Structure is [documented below](#nested_model_config_container_spec_startup_probe_http_get). | false | None | None |
| `grpc` | GrpcAction checks the health of a container using a gRPC service. Structure is [documented below](#nested_model_config_container_spec_startup_probe_grpc). | false | None | None |
| `tcp_socket` | TcpSocketAction probes the health of a container by opening a TCP socket connection. Structure is [documented below](#nested_model_config_container_spec_startup_probe_tcp_socket). | false | None | None |
| `timeout_seconds` | Number of seconds after which the probe times out. Defaults to 1 second. Minimum value is 1. Must be greater or equal to period_seconds. Maps to Kubernetes probe argument 'timeoutSeconds'. | false | None | None |
| `success_threshold` | Number of consecutive successes before the probe is considered successful. Defaults to 1. Minimum value is 1. Maps to Kubernetes probe argument 'successThreshold'. | false | None | None |
| `initial_delay_seconds` | Number of seconds to wait before starting the probe. Defaults to 0. Minimum value is 0. Maps to Kubernetes probe argument 'initialDelaySeconds'. | false | None | None |
| `period_seconds` | How often (in seconds) to perform the probe. Default to 10 seconds. Minimum value is 1. Must be less than timeout_seconds. Maps to Kubernetes probe argument 'periodSeconds'. | false | None | None |
| `failure_threshold` | Number of consecutive failures before the probe is considered failed. Defaults to 3. Minimum value is 1. Maps to Kubernetes probe argument 'failureThreshold'. | false | None | None |

### exec Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `command` | Command is the command line to execute inside the container, the working directory for the command is root ('/') in the container's filesystem. The command is simply exec'd, it is not run inside a shell, so traditional shell instructions ('|', etc) won't work. To use a shell, you need to explicitly call out to that shell. Exit status of 0 is treated as live/healthy and non-zero is unhealthy. | false | None | None |

### http_get Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `path` | Path to access on the HTTP server. | false | None | None |
| `port` | Number of the port to access on the container. Number must be in the range 1 to 65535. | false | None | None |
| `host` | Host name to connect to, defaults to the model serving container's IP. You probably want to set "Host" in httpHeaders instead. | false | None | None |
| `scheme` | Scheme to use for connecting to the host. Defaults to HTTP. Acceptable values are "HTTP" or "HTTPS". | false | None | None |
| `http_headers` | Custom headers to set in the request. HTTP allows repeated headers. Structure is [documented below](#nested_model_config_container_spec_liveness_probe_http_get_http_headers). | false | None | None |

### http_headers Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `value` | The header field value | false | None | None |
| `name` | The header field name. This will be canonicalized upon output, so case-variant names will be understood as the same header. | false | None | None |

### grpc Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `port` | Port number of the gRPC service. Number must be in the range 1 to 65535. | false | None | None |
| `service` | Service is the name of the service to place in the gRPC HealthCheckRequest. See https://github.com/grpc/grpc/blob/master/doc/health-checking.md. If this is not specified, the default behavior is defined by gRPC. | false | None | None |

### tcp_socket Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `port` | Number of the port to access on the container. Number must be in the range 1 to 65535. | false | None | None |
| `host` | Optional: Host name to connect to, defaults to the model serving container's IP. | false | None | None |

### health_probe Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `exec` | ExecAction specifies a command to execute. Structure is [documented below](#nested_model_config_container_spec_health_probe_exec). | false | None | None |
| `http_get` | HttpGetAction describes an action based on HTTP Get requests. Structure is [documented below](#nested_model_config_container_spec_health_probe_http_get). | false | None | None |
| `grpc` | GrpcAction checks the health of a container using a gRPC service. Structure is [documented below](#nested_model_config_container_spec_health_probe_grpc). | false | None | None |
| `tcp_socket` | TcpSocketAction probes the health of a container by opening a TCP socket connection. Structure is [documented below](#nested_model_config_container_spec_health_probe_tcp_socket). | false | None | None |
| `timeout_seconds` | Number of seconds after which the probe times out. Defaults to 1 second. Minimum value is 1. Must be greater or equal to period_seconds. Maps to Kubernetes probe argument 'timeoutSeconds'. | false | None | None |
| `success_threshold` | Number of consecutive successes before the probe is considered successful. Defaults to 1. Minimum value is 1. Maps to Kubernetes probe argument 'successThreshold'. | false | None | None |
| `initial_delay_seconds` | Number of seconds to wait before starting the probe. Defaults to 0. Minimum value is 0. Maps to Kubernetes probe argument 'initialDelaySeconds'. | false | None | None |
| `period_seconds` | How often (in seconds) to perform the probe. Default to 10 seconds. Minimum value is 1. Must be less than timeout_seconds. Maps to Kubernetes probe argument 'periodSeconds'. | false | None | None |
| `failure_threshold` | Number of consecutive failures before the probe is considered failed. Defaults to 3. Minimum value is 1. Maps to Kubernetes probe argument 'failureThreshold'. | false | None | None |

### grpc_ports Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `container_port` | The number of the port to expose on the pod's IP address. Must be a valid port number, between 1 and 65535 inclusive. | false | None | None |

### liveness_probe Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `exec` | ExecAction specifies a command to execute. Structure is [documented below](#nested_model_config_container_spec_liveness_probe_exec). | false | None | None |
| `http_get` | HttpGetAction describes an action based on HTTP Get requests. Structure is [documented below](#nested_model_config_container_spec_liveness_probe_http_get). | false | None | None |
| `grpc` | GrpcAction checks the health of a container using a gRPC service. Structure is [documented below](#nested_model_config_container_spec_liveness_probe_grpc). | false | None | None |
| `tcp_socket` | TcpSocketAction probes the health of a container by opening a TCP socket connection. Structure is [documented below](#nested_model_config_container_spec_liveness_probe_tcp_socket). | false | None | None |
| `timeout_seconds` | Number of seconds after which the probe times out. Defaults to 1 second. Minimum value is 1. Must be greater or equal to period_seconds. Maps to Kubernetes probe argument 'timeoutSeconds'. | false | None | None |
| `success_threshold` | Number of consecutive successes before the probe is considered successful. Defaults to 1. Minimum value is 1. Maps to Kubernetes probe argument 'successThreshold'. | false | None | None |
| `initial_delay_seconds` | Number of seconds to wait before starting the probe. Defaults to 0. Minimum value is 0. Maps to Kubernetes probe argument 'initialDelaySeconds'. | false | None | None |
| `period_seconds` | How often (in seconds) to perform the probe. Default to 10 seconds. Minimum value is 1. Must be less than timeout_seconds. Maps to Kubernetes probe argument 'periodSeconds'. | false | None | None |
| `failure_threshold` | Number of consecutive failures before the probe is considered failed. Defaults to 3. Minimum value is 1. Maps to Kubernetes probe argument 'failureThreshold'. | false | None | None |

### env Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | Name of the environment variable. Must be a valid C identifier. | true | None | None |
| `value` | Variables that reference a $(VAR_NAME) are expanded using the previous defined environment variables in the container and any service environment variables. If a variable cannot be resolved, the reference in the input string will be unchanged. The $(VAR_NAME) syntax can be escaped with a double $$, ie: $$(VAR_NAME). Escaped references will never be expanded, regardless of whether the variable exists or not. | true | None | None |

### dedicated_resources Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `machine_spec` | Specification of a single machine. Structure is [documented below](#nested_deploy_config_dedicated_resources_machine_spec). | true | None | None |
| `min_replica_count` | The minimum number of machine replicas that will be always deployed on. This value must be greater than or equal to 1. If traffic increases, it may dynamically be deployed onto more replicas, and as traffic decreases, some of these extra replicas may be freed. | true | None | None |
| `max_replica_count` | The maximum number of replicas that may be deployed on when the traffic against it increases. If the requested value is too large, the deployment will error, but if deployment succeeds then the ability to scale to that many replicas is guaranteed (barring service outages). If traffic increases beyond what its replicas at maximum may handle, a portion of the traffic will be dropped. If this value is not provided, will use min_replica_count as the default value. The value of this field impacts the charge against Vertex CPU and GPU quotas. Specifically, you will be charged for (max_replica_count * number of cores in the selected machine type) and (max_replica_count * number of GPUs per replica in the selected machine type). | false | None | None |
| `required_replica_count` | Number of required available replicas for the deployment to succeed. This field is only needed when partial deployment/mutation is desired. If set, the deploy/mutate operation will succeed once available_replica_count reaches required_replica_count, and the rest of the replicas will be retried. If not set, the default required_replica_count will be min_replica_count. | false | None | None |
| `autoscaling_metric_specs` | The metric specifications that overrides a resource utilization metric (CPU utilization, accelerator's duty cycle, and so on) target value (default to 60 if not set). At most one entry is allowed per metric. If machine_spec.accelerator_count is above 0, the autoscaling will be based on both CPU utilization and accelerator's duty cycle metrics and scale up when either metrics exceeds its target value while scale down if both metrics are under their target value. The default target value is 60 for both metrics. If machine_spec.accelerator_count is 0, the autoscaling will be based on CPU utilization metric only with default target value 60 if not explicitly set. For example, in the case of Online Prediction, if you want to override target CPU utilization to 80, you should set autoscaling_metric_specs.metric_name to `aiplatform.googleapis.com/prediction/online/cpu/utilization` and autoscaling_metric_specs.target to `80`. Structure is [documented below](#nested_deploy_config_dedicated_resources_autoscaling_metric_specs). | false | None | None |
| `spot` | If true, schedule the deployment workload on [spot VMs](https://cloud.google.com/kubernetes-engine/docs/concepts/spot-vms). | false | None | None |

### machine_spec Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `reservation_affinity` | A ReservationAffinity can be used to configure a Vertex AI resource (e.g., a DeployedModel) to draw its Compute Engine resources from a Shared Reservation, or exclusively from on-demand capacity. Structure is [documented below](#nested_deploy_config_dedicated_resources_machine_spec_reservation_affinity). | false | None | None |
| `machine_type` | The type of the machine. See the [list of machine types supported for prediction](https://cloud.google.com/vertex-ai/docs/predictions/configure-compute#machine-types) See the [list of machine types supported for custom training](https://cloud.google.com/vertex-ai/docs/training/configure-compute#machine-types). For DeployedModel this field is optional, and the default value is `n1-standard-2`. For BatchPredictionJob or as part of WorkerPoolSpec this field is required. | false | None | None |
| `accelerator_type` | Possible values: ACCELERATOR_TYPE_UNSPECIFIED NVIDIA_TESLA_K80 NVIDIA_TESLA_P100 NVIDIA_TESLA_V100 NVIDIA_TESLA_P4 NVIDIA_TESLA_T4 NVIDIA_TESLA_A100 NVIDIA_A100_80GB NVIDIA_L4 NVIDIA_H100_80GB NVIDIA_H100_MEGA_80GB NVIDIA_H200_141GB NVIDIA_B200 TPU_V2 TPU_V3 TPU_V4_POD TPU_V5_LITEPOD | false | None | None |
| `accelerator_count` | The number of accelerators to attach to the machine. | false | None | None |
| `tpu_topology` | The topology of the TPUs. Corresponds to the TPU topologies available from GKE. (Example: tpu_topology: "2x2x1"). | false | None | None |
| `multihost_gpu_node_count` | The number of nodes per replica for multihost GPU deployments. | false | None | None |

### reservation_affinity Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `reservation_affinity_type` | Specifies the reservation affinity type. Possible values: TYPE_UNSPECIFIED NO_RESERVATION ANY_RESERVATION SPECIFIC_RESERVATION | true | None | None |
| `key` | Corresponds to the label key of a reservation resource. To target a SPECIFIC_RESERVATION by name, use `compute.googleapis.com/reservation-name` as the key and specify the name of your reservation as its value. | false | None | None |
| `values` | Corresponds to the label values of a reservation resource. This must be the full resource name of the reservation or reservation block. | false | None | None |

### autoscaling_metric_specs Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `metric_name` | The resource metric name. Supported metrics: * For Online Prediction: * `aiplatform.googleapis.com/prediction/online/accelerator/duty_cycle` * `aiplatform.googleapis.com/prediction/online/cpu/utilization` | true | None | None |
| `target` | The target resource utilization in percentage (1% - 100%) for the given metric; once the real usage deviates from the target by a certain percentage, the machine replicas change. The default value is 60 (representing 60%) if not provided. | false | None | None |
