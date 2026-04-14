## 🛡️ Policy Deployment Engine: `clouddomains_registration`

This section provides a concise policy evaluation for the `clouddomains_registration` resource in GCP.

Reference: [Terraform Registry – clouddomains_registration](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/clouddomains_registration)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `yearly_price` | Required. Yearly price to register or renew the domain. The value that should be put here can be obtained from registrations.retrieveRegisterParameters or registrations.searchDomains calls. Structure is [documented below](#nested_yearly_price). | true | false | None | None | None |
| `contact_settings` | Required. Settings for contact information linked to the Registration. Structure is [documented below](#nested_contact_settings). | true | false | None | None | None |
| `location` | The location for the resource | true | false | None | None | None |
| `domain_name` | Required. The domain name. Unicode domain names must be expressed in Punycode format. | true | false | None | None | None |
| `labels` | Set of labels associated with the Registration. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | false | Mandatory labels are used for resource governance, cost tracking, and environment classification (e.g., 'env', 'owner'). | { "env": "production", "owner": "it-team" } | {} |
| `domain_notices` | The list of domain notices that you acknowledge. Possible value is HSTS_PRELOADED | false | false | None | None | None |
| `contact_notices` | The list of contact notices that the caller acknowledges. Possible value is PUBLIC_CONTACT_DATA_ACKNOWLEDGEMENT | false | false | None | None | None |
| `management_settings` | Settings for management of the Registration, including renewal, billing, and transfer Structure is [documented below](#nested_management_settings). | false | false | None | None | None |
| `dns_settings` | Settings controlling the DNS configuration of the Registration. Structure is [documented below](#nested_dns_settings). | false | false | None | None | None |
| `project` | If it is not provided, the provider project is used. | false | false | None | None | None |
| `registrant_contact` |  | false | false | None | None | None |
| `postal_address` |  | false | false | None | None | None |
| `admin_contact` |  | false | false | None | None | None |
| `technical_contact` |  | false | false | None | None | None |
| `custom_dns` |  | false | false | None | None | None |
| `ds_records` |  | false | false | None | None | None |
| `glue_records` |  | false | false | None | None | None |

### yearly_price Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `currency_code` | The three-letter currency code defined in ISO 4217. | false | false | None | None | None |
| `units` | The whole units of the amount. For example if currencyCode is "USD", then 1 unit is one US dollar. | false | false | None | None | None |

### contact_settings Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `privacy` | Required. Privacy setting for the contacts associated with the Registration. Values are PUBLIC_CONTACT_DATA, PRIVATE_CONTACT_DATA, and REDACTED_CONTACT_DATA | true | true | Contact privacy (WHOIS protection) is essential to prevent personal data exposure and reduce the risk of spear-phishing and social engineering attacks against domain owners. | PRIVATE_CONTACT_DATA | PUBLIC_CONTACT_DATA |
| `registrant_contact` | Caution: Anyone with access to this email address, phone number, and/or postal address can take control of the domain. Warning: For new Registrations, the registrant receives an email confirmation that they must complete within 15 days to avoid domain suspension. Structure is [documented below](#nested_contact_settings_registrant_contact). | true | false | None | None | None |
| `admin_contact` | Caution: Anyone with access to this email address, phone number, and/or postal address can take control of the domain. Warning: For new Registrations, the registrant receives an email confirmation that they must complete within 15 days to avoid domain suspension. Structure is [documented below](#nested_contact_settings_admin_contact). | true | false | None | None | None |
| `technical_contact` | Caution: Anyone with access to this email address, phone number, and/or postal address can take control of the domain. Warning: For new Registrations, the registrant receives an email confirmation that they must complete within 15 days to avoid domain suspension. Structure is [documented below](#nested_contact_settings_technical_contact). | true | false | None | None | None |

### management_settings Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `renewal_method` | (Output) Output only. The actual renewal method for this Registration. When preferredRenewalMethod is set to AUTOMATIC_RENEWAL, the actual renewalMethod can be equal to RENEWAL_DISABLED—for example, when there are problems with the billing account or reported domain abuse. In such cases, check the issues field on the Registration. After the problem is resolved, the renewalMethod is automatically updated to preferredRenewalMethod in a few hours. | false | true | Automatic renewal ensures the domain remains active and owned by the organization, preventing service downtime or competitive domain acquisition due to expiration. | AUTOMATIC_RENEWAL | RENEWAL_DISABLED |
| `preferred_renewal_method` | The desired renewal method for this Registration. The actual renewalMethod is automatically updated to reflect this choice. If unset or equal to RENEWAL_METHOD_UNSPECIFIED, the actual renewalMethod is treated as if it were set to AUTOMATIC_RENEWAL. You cannot use RENEWAL_DISABLED during resource creation, and you can update the renewal status only when the Registration resource has state ACTIVE or SUSPENDED. When preferredRenewalMethod is set to AUTOMATIC_RENEWAL, the actual renewalMethod can be set to RENEWAL_DISABLED in case of problems with the billing account or reported domain abuse. In such cases, check the issues field on the Registration. After the problem is resolved, the renewalMethod is automatically updated to preferredRenewalMethod in a few hours. | false | false | None | None | None |
| `transfer_lock_state` | Controls whether the domain can be transferred to another registrar. Values are UNLOCKED or LOCKED. | false | true | Enabling transfer lock prevents unauthorized domain transfers, protecting the organization's online presence from domain hijacking. | TRANSFER_LOCK_ENABLED | TRANSFER_LOCK_DISABLED |

### dns_settings Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `custom_dns` | Configuration for an arbitrary DNS provider. Structure is [documented below](#nested_dns_settings_custom_dns). | false | false | None | None | None |
| `glue_records` | The list of glue records for this Registration. Commonly empty. Structure is [documented below](#nested_dns_settings_glue_records). | false | false | None | None | None |

### registrant_contact Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `email` | Required. Email address of the contact. | true | false | None | None | None |
| `phone_number` | Required. Phone number of the contact in international format. For example, "+1-800-555-0123". | true | false | None | None | None |
| `fax_number` | Fax number of the contact in international format. For example, "+1-800-555-0123". | false | false | None | None | None |
| `postal_address` | Required. Postal address of the contact. Structure is [documented below](#nested_contact_settings_registrant_contact_postal_address). | true | false | None | None | None |

### postal_address Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `region_code` | Required. CLDR region code of the country/region of the address. This is never inferred and it is up to the user to ensure the value is correct. See https://cldr.unicode.org/ and https://www.unicode.org/cldr/charts/30/supplemental/territory_information.html for details. Example: "CH" for Switzerland. | true | false | None | None | None |
| `postal_code` | Postal code of the address. Not all countries use or require postal codes to be present, but where they are used, they may trigger additional validation with other parts of the address (e.g. state/zip validation in the U.S.A.). | false | false | None | None | None |
| `administrative_area` | Highest administrative subdivision which is used for postal addresses of a country or region. For example, this can be a state, a province, an oblast, or a prefecture. Specifically, for Spain this is the province and not the autonomous community (e.g. "Barcelona" and not "Catalonia"). Many countries don't use an administrative area in postal addresses. E.g. in Switzerland this should be left unpopulated. | false | false | None | None | None |
| `locality` | Generally refers to the city/town portion of the address. Examples: US city, IT comune, UK post town. In regions of the world where localities are not well defined or do not fit into this structure well, leave locality empty and use addressLines. | false | false | None | None | None |
| `organization` | The name of the organization at the address. | false | false | None | None | None |
| `address_lines` | Unstructured address lines describing the lower levels of an address. Because values in addressLines do not have type information and may sometimes contain multiple values in a single field (e.g. "Austin, TX"), it is important that the line order is clear. The order of address lines should be "envelope order" for the country/region of the address. In places where this can vary (e.g. Japan), address_language is used to make it explicit (e.g. "ja" for large-to-small ordering and "ja-Latn" or "en" for small-to-large). This way, the most specific line of an address can be selected based on the language. | false | false | None | None | None |
| `recipients` | The recipient at the address. This field may, under certain circumstances, contain multiline information. For example, it might contain "care of" information. | false | false | None | None | None |

### admin_contact Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `email` | Required. Email address of the contact. | true | false | None | None | None |
| `phone_number` | Required. Phone number of the contact in international format. For example, "+1-800-555-0123". | true | false | None | None | None |
| `fax_number` | Fax number of the contact in international format. For example, "+1-800-555-0123". | false | false | None | None | None |
| `postal_address` | Required. Postal address of the contact. Structure is [documented below](#nested_contact_settings_admin_contact_postal_address). | true | false | None | None | None |

### technical_contact Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `email` | Required. Email address of the contact. | true | false | None | None | None |
| `phone_number` | Required. Phone number of the contact in international format. For example, "+1-800-555-0123". | true | false | None | None | None |
| `fax_number` | Fax number of the contact in international format. For example, "+1-800-555-0123". | false | false | None | None | None |
| `postal_address` | Required. Postal address of the contact. Structure is [documented below](#nested_contact_settings_technical_contact_postal_address). | true | false | None | None | None |

### custom_dns Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `name_servers` | Required. A list of name servers that store the DNS zone for this domain. Each name server is a domain name, with Unicode domain names expressed in Punycode format. | true | false | None | None | None |
| `ds_records` | The list of DS records for this domain, which are used to enable DNSSEC. The domain's DNS provider can provide the values to set here. If this field is empty, DNSSEC is disabled. Structure is [documented below](#nested_dns_settings_custom_dns_ds_records). | false | false | None | None | None |

### ds_records Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `key_tag` | The key tag of the record. Must be set in range 0 -- 65535. | false | false | None | None | None |
| `algorithm` | The algorithm used to generate the referenced DNSKEY. | false | false | None | None | None |
| `digest_type` | The hash function used to generate the digest of the referenced DNSKEY. | false | false | None | None | None |
| `digest` | The digest generated from the referenced DNSKEY. | false | false | None | None | None |

### glue_records Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `host_name` | Required. Domain name of the host in Punycode format. | true | false | None | None | None |
| `ipv4_addresses` | List of IPv4 addresses corresponding to this host in the standard decimal format (e.g. 198.51.100.1). At least one of ipv4_address and ipv6_address must be set. | false | false | None | None | None |
| `ipv6_addresses` | List of IPv4 addresses corresponding to this host in the standard decimal format (e.g. 198.51.100.1). At least one of ipv4_address and ipv6_address must be set. | false | false | None | None | None |
