## 🛡️ Policy Deployment Engine: `apigee_security_action`

This section provides a concise policy evaluation for the `apigee_security_action` resource in GCP.

Reference: [Terraform Registry – apigee_security_action](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/apigee_security_action)

---

## 1. Argument Reference

### `state`
- Description: (Required) Only an ENABLED SecurityAction is enforced. An ENABLED SecurityAction past its expiration time will not be enforced. Possible values are: `ENABLED`, `DISABLED`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `condition_config`
- Description: (Required) A valid SecurityAction must contain at least one condition. Structure is [documented below](#nested_condition_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `org_id`
- Description: (Required) The organization that this security action applies to.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `env_id`
- Description: (Required) The Apigee environment that this security action applies to.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `security_action_id`
- Description: (Required) The ID to use for the SecurityAction, which will become the final component of the action's resource name. This value should be 0-61 characters, and valid format is (^a-z?$).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) An optional user provided description of the SecurityAction.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `api_proxies`
- Description: (Optional) If unset, this would apply to all proxies in the environment. If set, this action is enforced only if at least one proxy in the repeated list is deployed at the time of enforcement. If set, several restrictions are enforced on SecurityActions. There can be at most 100 enabled actions with proxies set in an env. Several other restrictions apply on conditions and are detailed later.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `allow`
- Description: (Optional) Allow a request through if it matches this SecurityAction.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `deny`
- Description: (Optional) Deny a request through if it matches this SecurityAction. Structure is [documented below](#nested_deny).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `flag`
- Description: (Optional) Flag a request through if it matches this SecurityAction. Structure is [documented below](#nested_flag).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `expire_time`
- Description: (Optional) The expiration for this SecurityAction. Uses RFC 3339, where generated output will always be Z-normalized and uses 0, 3, 6 or 9 fractional digits. Offsets other than "Z" are also accepted. Examples: "2014-10-02T15:01:23Z", "2014-10-02T15:01:23.045123456Z" or "2014-10-02T15:01:23+05:30".
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ttl`
- Description: (Optional) The TTL for this SecurityAction. A duration in seconds with up to nine fractional digits, ending with 's'. Example: "3.5s". <a name="nested_condition_config"></a>The `condition_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ip_address_ranges`
- Description: (Optional) A list of IP addresses. This could be either IPv4 or IPv6. Limited to 100 per action.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `bot_reasons`
- Description: (Optional) A list of Bot Reasons. Current options: Flooder, Brute Guessor, Static Content Scraper, OAuth Abuser, Robot Abuser, TorListRule, Advanced Anomaly Detection, Advanced API Scraper, Search Engine Crawlers, Public Clouds, Public Cloud AWS, Public Cloud Azure, and Public Cloud Google.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `http_methods`
- Description: (Optional) Act only on particular HTTP methods. E.g. A read-only API can block POST/PUT/DELETE methods. Accepted values are: GET, HEAD, POST, PUT, DELETE, CONNECT, OPTIONS, TRACE and PATCH.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `api_keys`
- Description: (Optional) A list of API keys. Limit 1000 per action.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `access_tokens`
- Description: (Optional) A list of accessTokens. Limit 1000 per action.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `api_products`
- Description: (Optional) A list of API Products. Limit 1000 per action.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `developer_apps`
- Description: (Optional) A list of developer apps. Limit 1000 per action.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `developers`
- Description: (Optional) A list of developers. Limit 1000 per action.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `user_agents`
- Description: (Optional) A list of user agents to deny. We look for exact matches. Limit 50 per action.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `region_codes`
- Description: (Optional) A list of countries/region codes to act on, e.g. US. This follows https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `asns`
- Description: (Optional) A list of ASN numbers to act on, e.g. 23. https://en.wikipedia.org/wiki/Autonomous_system_(Internet) This uses int64 instead of uint32 because of https://linter.aip.dev/141/forbidden-types. <a name="nested_deny"></a>The `deny` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `response_code`
- Description: (Optional) The HTTP response code if the Action = DENY. <a name="nested_flag"></a>The `flag` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `headers`
- Description: (Optional) A list of HTTP headers to be sent to the target in case of a FLAG SecurityAction. Limit 5 headers per SecurityAction. At least one is mandatory. Structure is [documented below](#nested_flag_headers). <a name="nested_flag_headers"></a>The `headers` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Optional) The header name to be sent to the target.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `value`
- Description: (Optional) The header value to be sent to the target.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
