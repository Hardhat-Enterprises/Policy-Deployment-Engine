## 🛡️ Policy Deployment Engine: `compute_region_health_check`

This section provides a concise policy evaluation for the `compute_region_health_check` resource in GCP.

Reference: [Terraform Registry – compute_region_health_check](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_region_health_check)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | Name of the resource. Provided by the client when the resource is created. The name must be 1-63 characters long, and comply with RFC1035.  Specifically, the name must be 1-63 characters long and match the regular expression `[a-z]([-a-z0-9]*[a-z0-9])?` which means the first character must be a lowercase letter, and all following characters must be a dash, lowercase letter, or digit, except the last character, which cannot be a dash. | true | None | None |
| `check_interval_sec` | How often (in seconds) to send a health check. The default value is 5 seconds. | false | None | None |
| `description` | An optional description of this resource. Provide this property when you create the resource. | false | None | None |
| `healthy_threshold` | A so-far unhealthy instance will be marked healthy after this many consecutive successes. The default value is 2. | false | None | None |
| `unhealthy_threshold` | A so-far healthy instance will be marked unhealthy after this many consecutive failures. The default value is 2. | false | None | None |
| `timeout_sec` | How long (in seconds) to wait before claiming failure. The default value is 5 seconds.  It is invalid for timeoutSec to have greater value than checkIntervalSec. | false | None | None |
| `region` | The Region in which the created health check should reside. If it is not provided, the provider region is used. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### http_health_check Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `host` | The value of the host header in the HTTP health check request. If left empty (default value), the public IP on behalf of which this health check is performed will be used. | false | None | None |
| `request_path` | The request path of the HTTP health check request. The default value is /. | false | None | None |
| `response` | The bytes to match against the beginning of the response data. If left empty (the default value), any response will indicate health. The response data can only be ASCII. | false | None | None |
| `port` | The TCP port number for the HTTP health check request. The default value is 80. | false | None | None |
| `port_name` | Port name as defined in InstanceGroup#NamedPort#name. If both port and port_name are defined, port takes precedence. | false | None | None |
| `proxy_header` | Specifies the type of proxy header to append before sending data to the backend. Default value is `NONE`. Possible values are: `NONE`, `PROXY_V1`. | false | None | None |
| `port_specification` | Specifies how port is selected for health checking, can be one of the following values: * `USE_FIXED_PORT`: The port number in `port` is used for health checking. * `USE_NAMED_PORT`: The `portName` is used for health checking. * `USE_SERVING_PORT`: For NetworkEndpointGroup, the port specified for each network endpoint is used for health checking. For other backends, the port or named port specified in the Backend Service is used for health checking. If not specified, HTTP health check follows behavior specified in `port` and `portName` fields. Possible values are: `USE_FIXED_PORT`, `USE_NAMED_PORT`, `USE_SERVING_PORT`. | false | None | None |

### https_health_check Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `host` | The value of the host header in the HTTPS health check request. If left empty (default value), the public IP on behalf of which this health check is performed will be used. | false | None | None |
| `request_path` | The request path of the HTTPS health check request. The default value is /. | false | None | None |
| `response` | The bytes to match against the beginning of the response data. If left empty (the default value), any response will indicate health. The response data can only be ASCII. | false | None | None |
| `port` | The TCP port number for the HTTPS health check request. The default value is 443. | false | None | None |
| `port_name` | Port name as defined in InstanceGroup#NamedPort#name. If both port and port_name are defined, port takes precedence. | false | None | None |
| `proxy_header` | Specifies the type of proxy header to append before sending data to the backend. Default value is `NONE`. Possible values are: `NONE`, `PROXY_V1`. | false | None | None |
| `port_specification` | Specifies how port is selected for health checking, can be one of the following values: * `USE_FIXED_PORT`: The port number in `port` is used for health checking. * `USE_NAMED_PORT`: The `portName` is used for health checking. * `USE_SERVING_PORT`: For NetworkEndpointGroup, the port specified for each network endpoint is used for health checking. For other backends, the port or named port specified in the Backend Service is used for health checking. If not specified, HTTPS health check follows behavior specified in `port` and `portName` fields. Possible values are: `USE_FIXED_PORT`, `USE_NAMED_PORT`, `USE_SERVING_PORT`. | false | None | None |

### tcp_health_check Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `request` | The application data to send once the TCP connection has been established (default value is empty). If both request and response are empty, the connection establishment alone will indicate health. The request data can only be ASCII. | false | None | None |
| `response` | The bytes to match against the beginning of the response data. If left empty (the default value), any response will indicate health. The response data can only be ASCII. | false | None | None |
| `port` | The TCP port number for the TCP health check request. The default value is 80. | false | None | None |
| `port_name` | Port name as defined in InstanceGroup#NamedPort#name. If both port and port_name are defined, port takes precedence. | false | None | None |
| `proxy_header` | Specifies the type of proxy header to append before sending data to the backend. Default value is `NONE`. Possible values are: `NONE`, `PROXY_V1`. | false | None | None |
| `port_specification` | Specifies how port is selected for health checking, can be one of the following values: * `USE_FIXED_PORT`: The port number in `port` is used for health checking. * `USE_NAMED_PORT`: The `portName` is used for health checking. * `USE_SERVING_PORT`: For NetworkEndpointGroup, the port specified for each network endpoint is used for health checking. For other backends, the port or named port specified in the Backend Service is used for health checking. If not specified, TCP health check follows behavior specified in `port` and `portName` fields. Possible values are: `USE_FIXED_PORT`, `USE_NAMED_PORT`, `USE_SERVING_PORT`. | false | None | None |

### ssl_health_check Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `request` | The application data to send once the SSL connection has been established (default value is empty). If both request and response are empty, the connection establishment alone will indicate health. The request data can only be ASCII. | false | None | None |
| `response` | The bytes to match against the beginning of the response data. If left empty (the default value), any response will indicate health. The response data can only be ASCII. | false | None | None |
| `port` | The TCP port number for the SSL health check request. The default value is 443. | false | None | None |
| `port_name` | Port name as defined in InstanceGroup#NamedPort#name. If both port and port_name are defined, port takes precedence. | false | None | None |
| `proxy_header` | Specifies the type of proxy header to append before sending data to the backend. Default value is `NONE`. Possible values are: `NONE`, `PROXY_V1`. | false | None | None |
| `port_specification` | Specifies how port is selected for health checking, can be one of the following values: * `USE_FIXED_PORT`: The port number in `port` is used for health checking. * `USE_NAMED_PORT`: The `portName` is used for health checking. * `USE_SERVING_PORT`: For NetworkEndpointGroup, the port specified for each network endpoint is used for health checking. For other backends, the port or named port specified in the Backend Service is used for health checking. If not specified, SSL health check follows behavior specified in `port` and `portName` fields. Possible values are: `USE_FIXED_PORT`, `USE_NAMED_PORT`, `USE_SERVING_PORT`. | false | None | None |

### http2_health_check Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `host` | The value of the host header in the HTTP2 health check request. If left empty (default value), the public IP on behalf of which this health check is performed will be used. | false | None | None |
| `request_path` | The request path of the HTTP2 health check request. The default value is /. | false | None | None |
| `response` | The bytes to match against the beginning of the response data. If left empty (the default value), any response will indicate health. The response data can only be ASCII. | false | None | None |
| `port` | The TCP port number for the HTTP2 health check request. The default value is 443. | false | None | None |
| `port_name` | Port name as defined in InstanceGroup#NamedPort#name. If both port and port_name are defined, port takes precedence. | false | None | None |
| `proxy_header` | Specifies the type of proxy header to append before sending data to the backend. Default value is `NONE`. Possible values are: `NONE`, `PROXY_V1`. | false | None | None |
| `port_specification` | Specifies how port is selected for health checking, can be one of the following values: * `USE_FIXED_PORT`: The port number in `port` is used for health checking. * `USE_NAMED_PORT`: The `portName` is used for health checking. * `USE_SERVING_PORT`: For NetworkEndpointGroup, the port specified for each network endpoint is used for health checking. For other backends, the port or named port specified in the Backend Service is used for health checking. If not specified, HTTP2 health check follows behavior specified in `port` and `portName` fields. Possible values are: `USE_FIXED_PORT`, `USE_NAMED_PORT`, `USE_SERVING_PORT`. | false | None | None |

### grpc_health_check Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `port` | The port number for the health check request. Must be specified if portName and portSpecification are not set or if port_specification is USE_FIXED_PORT. Valid values are 1 through 65535. | false | None | None |
| `port_name` | Port name as defined in InstanceGroup#NamedPort#name. If both port and port_name are defined, port takes precedence. | false | None | None |
| `port_specification` | Specifies how port is selected for health checking, can be one of the following values: * `USE_FIXED_PORT`: The port number in `port` is used for health checking. * `USE_NAMED_PORT`: The `portName` is used for health checking. * `USE_SERVING_PORT`: For NetworkEndpointGroup, the port specified for each network endpoint is used for health checking. For other backends, the port or named port specified in the Backend Service is used for health checking. If not specified, gRPC health check follows behavior specified in `port` and `portName` fields. Possible values are: `USE_FIXED_PORT`, `USE_NAMED_PORT`, `USE_SERVING_PORT`. | false | None | None |
| `grpc_service_name` | The gRPC service name for the health check. The value of grpcServiceName has the following meanings by convention: * Empty serviceName means the overall status of all services at the backend. * Non-empty serviceName means the health of that gRPC service, as defined by the owner of the service. The grpcServiceName can only be ASCII. | false | None | None |

### grpc_tls_health_check Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `port` | The port number for the health check request. Must be specified if port_specification is USE_FIXED_PORT. Valid values are 1 through 65535. | false | None | None |
| `port_specification` | Specifies how port is selected for health checking, can be one of the following values: * `USE_FIXED_PORT`: The port number in `port` is used for health checking. * `USE_NAMED_PORT`: Not supported for GRPC with TLS health checking. * `USE_SERVING_PORT`: For NetworkEndpointGroup, the port specified for each network endpoint is used for health checking. For other backends, the port or named port specified in the Backend Service is used for health checking. If not specified, gRPC health check follows behavior specified in the `port` field. Possible values are: `USE_FIXED_PORT`, `USE_NAMED_PORT`, `USE_SERVING_PORT`. | false | None | None |
| `grpc_service_name` | The gRPC service name for the health check. The value of grpcServiceName has the following meanings by convention: * Empty serviceName means the overall status of all services at the backend. * Non-empty serviceName means the health of that gRPC service, as defined by the owner of the service. The grpcServiceName can only be ASCII. | false | None | None |

### log_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `enable` | Indicates whether or not to export logs. This is false by default, which means no health check logging will be done. | false | None | None |
