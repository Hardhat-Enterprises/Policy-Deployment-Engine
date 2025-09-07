## 🛡️ Policy Deployment Engine: `compute_region_health_check`

This section provides a concise policy evaluation for the `compute_region_health_check` resource in GCP.

Reference: [Terraform Registry – compute_region_health_check](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_region_health_check)

---

## 1. Argument Reference

### `name`
- Description: (Required) Name of the resource. Provided by the client when the resource is created. The name must be 1-63 characters long, and comply with RFC1035.  Specifically, the name must be 1-63 characters long and match the regular expression `[a-z]([-a-z0-9]*[a-z0-9])?` which means the first character must be a lowercase letter, and all following characters must be a dash, lowercase letter, or digit, except the last character, which cannot be a dash.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `check_interval_sec`
- Description: (Optional) How often (in seconds) to send a health check. The default value is 5 seconds.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) An optional description of this resource. Provide this property when you create the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `healthy_threshold`
- Description: (Optional) A so-far unhealthy instance will be marked healthy after this many consecutive successes. The default value is 2.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `unhealthy_threshold`
- Description: (Optional) A so-far healthy instance will be marked unhealthy after this many consecutive failures. The default value is 2.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `timeout_sec`
- Description: (Optional) How long (in seconds) to wait before claiming failure. The default value is 5 seconds.  It is invalid for timeoutSec to have greater value than checkIntervalSec.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `http_health_check`
- Description: (Optional) A nested object resource. Structure is [documented below](#nested_http_health_check).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `https_health_check`
- Description: (Optional) A nested object resource. Structure is [documented below](#nested_https_health_check).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `tcp_health_check`
- Description: (Optional) A nested object resource. Structure is [documented below](#nested_tcp_health_check).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ssl_health_check`
- Description: (Optional) A nested object resource. Structure is [documented below](#nested_ssl_health_check).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `http2_health_check`
- Description: (Optional) A nested object resource. Structure is [documented below](#nested_http2_health_check).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `grpc_health_check`
- Description: (Optional) A nested object resource. Structure is [documented below](#nested_grpc_health_check).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `grpc_tls_health_check`
- Description: (Optional, [Beta](https://terraform.io/docs/providers/google/guides/provider_versions.html)) A nested object resource. Structure is [documented below](#nested_grpc_tls_health_check).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `log_config`
- Description: (Optional) Configure logging on this health check. Structure is [documented below](#nested_log_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `region`
- Description: (Optional) The Region in which the created health check should reside. If it is not provided, the provider region is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_http_health_check"></a>The `http_health_check` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `host`
- Description: (Optional) The value of the host header in the HTTP health check request. If left empty (default value), the public IP on behalf of which this health check is performed will be used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `request_path`
- Description: (Optional) The request path of the HTTP health check request. The default value is /.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `response`
- Description: (Optional) The bytes to match against the beginning of the response data. If left empty (the default value), any response will indicate health. The response data can only be ASCII.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `port`
- Description: (Optional) The TCP port number for the HTTP health check request. The default value is 80.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `port_name`
- Description: (Optional) Port name as defined in InstanceGroup#NamedPort#name. If both port and port_name are defined, port takes precedence.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `proxy_header`
- Description: (Optional) Specifies the type of proxy header to append before sending data to the backend. Default value is `NONE`. Possible values are: `NONE`, `PROXY_V1`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `port_specification`
- Description: (Optional) Specifies how port is selected for health checking, can be one of the following values:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `host`
- Description: (Optional) The value of the host header in the HTTPS health check request. If left empty (default value), the public IP on behalf of which this health check is performed will be used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `request_path`
- Description: (Optional) The request path of the HTTPS health check request. The default value is /.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `response`
- Description: (Optional) The bytes to match against the beginning of the response data. If left empty (the default value), any response will indicate health. The response data can only be ASCII.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `port`
- Description: (Optional) The TCP port number for the HTTPS health check request. The default value is 443.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `port_name`
- Description: (Optional) Port name as defined in InstanceGroup#NamedPort#name. If both port and port_name are defined, port takes precedence.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `proxy_header`
- Description: (Optional) Specifies the type of proxy header to append before sending data to the backend. Default value is `NONE`. Possible values are: `NONE`, `PROXY_V1`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `port_specification`
- Description: (Optional) Specifies how port is selected for health checking, can be one of the following values:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `request`
- Description: (Optional) The application data to send once the TCP connection has been established (default value is empty). If both request and response are empty, the connection establishment alone will indicate health. The request data can only be ASCII.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `response`
- Description: (Optional) The bytes to match against the beginning of the response data. If left empty (the default value), any response will indicate health. The response data can only be ASCII.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `port`
- Description: (Optional) The TCP port number for the TCP health check request. The default value is 80.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `port_name`
- Description: (Optional) Port name as defined in InstanceGroup#NamedPort#name. If both port and port_name are defined, port takes precedence.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `proxy_header`
- Description: (Optional) Specifies the type of proxy header to append before sending data to the backend. Default value is `NONE`. Possible values are: `NONE`, `PROXY_V1`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `port_specification`
- Description: (Optional) Specifies how port is selected for health checking, can be one of the following values:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `request`
- Description: (Optional) The application data to send once the SSL connection has been established (default value is empty). If both request and response are empty, the connection establishment alone will indicate health. The request data can only be ASCII.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `response`
- Description: (Optional) The bytes to match against the beginning of the response data. If left empty (the default value), any response will indicate health. The response data can only be ASCII.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `port`
- Description: (Optional) The TCP port number for the SSL health check request. The default value is 443.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `port_name`
- Description: (Optional) Port name as defined in InstanceGroup#NamedPort#name. If both port and port_name are defined, port takes precedence.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `proxy_header`
- Description: (Optional) Specifies the type of proxy header to append before sending data to the backend. Default value is `NONE`. Possible values are: `NONE`, `PROXY_V1`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `port_specification`
- Description: (Optional) Specifies how port is selected for health checking, can be one of the following values:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `host`
- Description: (Optional) The value of the host header in the HTTP2 health check request. If left empty (default value), the public IP on behalf of which this health check is performed will be used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `request_path`
- Description: (Optional) The request path of the HTTP2 health check request. The default value is /.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `response`
- Description: (Optional) The bytes to match against the beginning of the response data. If left empty (the default value), any response will indicate health. The response data can only be ASCII.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `port`
- Description: (Optional) The TCP port number for the HTTP2 health check request. The default value is 443.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `port_name`
- Description: (Optional) Port name as defined in InstanceGroup#NamedPort#name. If both port and port_name are defined, port takes precedence.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `proxy_header`
- Description: (Optional) Specifies the type of proxy header to append before sending data to the backend. Default value is `NONE`. Possible values are: `NONE`, `PROXY_V1`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `port_specification`
- Description: (Optional) Specifies how port is selected for health checking, can be one of the following values:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `port`
- Description: (Optional) The port number for the health check request. Must be specified if portName and portSpecification are not set or if port_specification is USE_FIXED_PORT. Valid values are 1 through 65535.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `port_name`
- Description: (Optional) Port name as defined in InstanceGroup#NamedPort#name. If both port and port_name are defined, port takes precedence.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `port_specification`
- Description: (Optional) Specifies how port is selected for health checking, can be one of the following values:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `grpc_service_name`
- Description: (Optional) The gRPC service name for the health check. The value of grpcServiceName has the following meanings by convention: * Empty serviceName means the overall status of all services at the backend. * Non-empty serviceName means the health of that gRPC service, as defined by the owner of the service. The grpcServiceName can only be ASCII. <a name="nested_grpc_tls_health_check"></a>The `grpc_tls_health_check` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `port`
- Description: (Optional) The port number for the health check request. Must be specified if port_specification is USE_FIXED_PORT. Valid values are 1 through 65535.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `port_specification`
- Description: (Optional) Specifies how port is selected for health checking, can be one of the following values:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `grpc_service_name`
- Description: (Optional) The gRPC service name for the health check. The value of grpcServiceName has the following meanings by convention: * Empty serviceName means the overall status of all services at the backend. * Non-empty serviceName means the health of that gRPC service, as defined by the owner of the service. The grpcServiceName can only be ASCII. <a name="nested_log_config"></a>The `log_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enable`
- Description: (Optional) Indicates whether or not to export logs. This is false by default, which means no health check logging will be done.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
