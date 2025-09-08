## 🛡️ Policy Deployment Engine: `apigee_security_action`

This section provides a concise policy evaluation for the `apigee_security_action` resource in GCP.

Reference: [Terraform Registry – apigee_security_action](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/apigee_security_action)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `state` | Only an ENABLED SecurityAction is enforced. An ENABLED SecurityAction past its expiration time will not be enforced. Possible values are: `ENABLED`, `DISABLED`. | true | None | None |
| `org_id` | The organization that this security action applies to. | true | None | None |
| `env_id` | The Apigee environment that this security action applies to. | true | None | None |
| `security_action_id` | The ID to use for the SecurityAction, which will become the final component of the action's resource name. This value should be 0-61 characters, and valid format is (^a-z?$). | true | None | None |
| `description` | An optional user provided description of the SecurityAction. | false | None | None |
| `api_proxies` | If unset, this would apply to all proxies in the environment. If set, this action is enforced only if at least one proxy in the repeated list is deployed at the time of enforcement. If set, several restrictions are enforced on SecurityActions. There can be at most 100 enabled actions with proxies set in an env. Several other restrictions apply on conditions and are detailed later. | false | None | None |
| `allow` | Allow a request through if it matches this SecurityAction. | false | None | None |
| `expire_time` | The expiration for this SecurityAction. Uses RFC 3339, where generated output will always be Z-normalized and uses 0, 3, 6 or 9 fractional digits. Offsets other than "Z" are also accepted. Examples: "2014-10-02T15:01:23Z", "2014-10-02T15:01:23.045123456Z" or "2014-10-02T15:01:23+05:30". | false | None | None |
| `ttl` | The TTL for this SecurityAction. A duration in seconds with up to nine fractional digits, ending with 's'. Example: "3.5s". | false | None | None |

### condition_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `ip_address_ranges` | A list of IP addresses. This could be either IPv4 or IPv6. Limited to 100 per action. | false | None | None |
| `bot_reasons` | A list of Bot Reasons. Current options: Flooder, Brute Guessor, Static Content Scraper, OAuth Abuser, Robot Abuser, TorListRule, Advanced Anomaly Detection, Advanced API Scraper, Search Engine Crawlers, Public Clouds, Public Cloud AWS, Public Cloud Azure, and Public Cloud Google. | false | None | None |
| `http_methods` | Act only on particular HTTP methods. E.g. A read-only API can block POST/PUT/DELETE methods. Accepted values are: GET, HEAD, POST, PUT, DELETE, CONNECT, OPTIONS, TRACE and PATCH. | false | None | None |
| `api_keys` | A list of API keys. Limit 1000 per action. | false | None | None |
| `access_tokens` | A list of accessTokens. Limit 1000 per action. | false | None | None |
| `api_products` | A list of API Products. Limit 1000 per action. | false | None | None |
| `developer_apps` | A list of developer apps. Limit 1000 per action. | false | None | None |
| `developers` | A list of developers. Limit 1000 per action. | false | None | None |
| `user_agents` | A list of user agents to deny. We look for exact matches. Limit 50 per action. | false | None | None |
| `region_codes` | A list of countries/region codes to act on, e.g. US. This follows https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2. | false | None | None |
| `asns` | A list of ASN numbers to act on, e.g. 23. https://en.wikipedia.org/wiki/Autonomous_system_(Internet) This uses int64 instead of uint32 because of https://linter.aip.dev/141/forbidden-types. | false | None | None |

### deny Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `response_code` | The HTTP response code if the Action = DENY. | false | None | None |

### flag Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `headers` | A list of HTTP headers to be sent to the target in case of a FLAG SecurityAction. Limit 5 headers per SecurityAction. At least one is mandatory. Structure is [documented below](#nested_flag_headers). | false | None | None |

### headers Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | The header name to be sent to the target. | false | None | None |
| `value` | The header value to be sent to the target. | false | None | None |
