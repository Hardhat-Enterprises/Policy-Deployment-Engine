## 🛡️ Policy Deployment Engine: `clouddomains_registration`

This section provides a concise policy evaluation for the `clouddomains_registration` resource in GCP.

Reference: [Terraform Registry – clouddomains_registration](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/clouddomains_registration)

---

## 1. Argument Reference

### `yearly_price`
- Description: (Required) Required. Yearly price to register or renew the domain. The value that should be put here can be obtained from registrations.retrieveRegisterParameters or registrations.searchDomains calls. Structure is [documented below](#nested_yearly_price).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `contact_settings`
- Description: (Required) Required. Settings for contact information linked to the Registration. Structure is [documented below](#nested_contact_settings).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Required) The location for the resource
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `domain_name`
- Description: (Required) Required. The domain name. Unicode domain names must be expressed in Punycode format.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) Set of labels associated with the Registration. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `domain_notices`
- Description: (Optional) The list of domain notices that you acknowledge. Possible value is HSTS_PRELOADED
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `contact_notices`
- Description: (Optional) The list of contact notices that the caller acknowledges. Possible value is PUBLIC_CONTACT_DATA_ACKNOWLEDGEMENT
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `management_settings`
- Description: (Optional) Settings for management of the Registration, including renewal, billing, and transfer Structure is [documented below](#nested_management_settings).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `dns_settings`
- Description: (Optional) Settings controlling the DNS configuration of the Registration. Structure is [documented below](#nested_dns_settings).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_yearly_price"></a>The `yearly_price` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `currency_code`
- Description: (Optional) The three-letter currency code defined in ISO 4217.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `units`
- Description: (Optional) The whole units of the amount. For example if currencyCode is "USD", then 1 unit is one US dollar. <a name="nested_contact_settings"></a>The `contact_settings` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `privacy`
- Description: (Required) Required. Privacy setting for the contacts associated with the Registration. Values are PUBLIC_CONTACT_DATA, PRIVATE_CONTACT_DATA, and REDACTED_CONTACT_DATA
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `registrant_contact`
- Description: (Required) Caution: Anyone with access to this email address, phone number, and/or postal address can take control of the domain. Warning: For new Registrations, the registrant receives an email confirmation that they must complete within 15 days to avoid domain suspension. Structure is [documented below](#nested_contact_settings_registrant_contact).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `admin_contact`
- Description: (Required) Caution: Anyone with access to this email address, phone number, and/or postal address can take control of the domain. Warning: For new Registrations, the registrant receives an email confirmation that they must complete within 15 days to avoid domain suspension. Structure is [documented below](#nested_contact_settings_admin_contact).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `technical_contact`
- Description: (Required) Caution: Anyone with access to this email address, phone number, and/or postal address can take control of the domain. Warning: For new Registrations, the registrant receives an email confirmation that they must complete within 15 days to avoid domain suspension. Structure is [documented below](#nested_contact_settings_technical_contact). <a name="nested_contact_settings_registrant_contact"></a>The `registrant_contact` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `email`
- Description: (Required) Required. Email address of the contact.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `phone_number`
- Description: (Required) Required. Phone number of the contact in international format. For example, "+1-800-555-0123".
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `fax_number`
- Description: (Optional) Fax number of the contact in international format. For example, "+1-800-555-0123".
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `postal_address`
- Description: (Required) Required. Postal address of the contact. Structure is [documented below](#nested_contact_settings_registrant_contact_postal_address). <a name="nested_contact_settings_registrant_contact_postal_address"></a>The `postal_address` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `region_code`
- Description: (Required) Required. CLDR region code of the country/region of the address. This is never inferred and it is up to the user to ensure the value is correct. See https://cldr.unicode.org/ and https://www.unicode.org/cldr/charts/30/supplemental/territory_information.html for details. Example: "CH" for Switzerland.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `postal_code`
- Description: (Optional) Postal code of the address. Not all countries use or require postal codes to be present, but where they are used, they may trigger additional validation with other parts of the address (e.g. state/zip validation in the U.S.A.).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `administrative_area`
- Description: (Optional) Highest administrative subdivision which is used for postal addresses of a country or region. For example, this can be a state, a province, an oblast, or a prefecture. Specifically, for Spain this is the province and not the autonomous community (e.g. "Barcelona" and not "Catalonia"). Many countries don't use an administrative area in postal addresses. E.g. in Switzerland this should be left unpopulated.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `locality`
- Description: (Optional) Generally refers to the city/town portion of the address. Examples: US city, IT comune, UK post town. In regions of the world where localities are not well defined or do not fit into this structure well, leave locality empty and use addressLines.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `organization`
- Description: (Optional) The name of the organization at the address.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `address_lines`
- Description: (Optional) Unstructured address lines describing the lower levels of an address. Because values in addressLines do not have type information and may sometimes contain multiple values in a single field (e.g. "Austin, TX"), it is important that the line order is clear. The order of address lines should be "envelope order" for the country/region of the address. In places where this can vary (e.g. Japan), address_language is used to make it explicit (e.g. "ja" for large-to-small ordering and "ja-Latn" or "en" for small-to-large). This way, the most specific line of an address can be selected based on the language.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `recipients`
- Description: (Optional) The recipient at the address. This field may, under certain circumstances, contain multiline information. For example, it might contain "care of" information. <a name="nested_contact_settings_admin_contact"></a>The `admin_contact` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `email`
- Description: (Required) Required. Email address of the contact.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `phone_number`
- Description: (Required) Required. Phone number of the contact in international format. For example, "+1-800-555-0123".
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `fax_number`
- Description: (Optional) Fax number of the contact in international format. For example, "+1-800-555-0123".
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `postal_address`
- Description: (Required) Required. Postal address of the contact. Structure is [documented below](#nested_contact_settings_admin_contact_postal_address). <a name="nested_contact_settings_admin_contact_postal_address"></a>The `postal_address` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `region_code`
- Description: (Required) Required. CLDR region code of the country/region of the address. This is never inferred and it is up to the user to ensure the value is correct. See https://cldr.unicode.org/ and https://www.unicode.org/cldr/charts/30/supplemental/territory_information.html for details. Example: "CH" for Switzerland.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `postal_code`
- Description: (Optional) Postal code of the address. Not all countries use or require postal codes to be present, but where they are used, they may trigger additional validation with other parts of the address (e.g. state/zip validation in the U.S.A.).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `administrative_area`
- Description: (Optional) Highest administrative subdivision which is used for postal addresses of a country or region. For example, this can be a state, a province, an oblast, or a prefecture. Specifically, for Spain this is the province and not the autonomous community (e.g. "Barcelona" and not "Catalonia"). Many countries don't use an administrative area in postal addresses. E.g. in Switzerland this should be left unpopulated.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `locality`
- Description: (Optional) Generally refers to the city/town portion of the address. Examples: US city, IT comune, UK post town. In regions of the world where localities are not well defined or do not fit into this structure well, leave locality empty and use addressLines.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `organization`
- Description: (Optional) The name of the organization at the address.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `address_lines`
- Description: (Optional) Unstructured address lines describing the lower levels of an address. Because values in addressLines do not have type information and may sometimes contain multiple values in a single field (e.g. "Austin, TX"), it is important that the line order is clear. The order of address lines should be "envelope order" for the country/region of the address. In places where this can vary (e.g. Japan), address_language is used to make it explicit (e.g. "ja" for large-to-small ordering and "ja-Latn" or "en" for small-to-large). This way, the most specific line of an address can be selected based on the language.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `recipients`
- Description: (Optional) The recipient at the address. This field may, under certain circumstances, contain multiline information. For example, it might contain "care of" information. <a name="nested_contact_settings_technical_contact"></a>The `technical_contact` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `email`
- Description: (Required) Required. Email address of the contact.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `phone_number`
- Description: (Required) Required. Phone number of the contact in international format. For example, "+1-800-555-0123".
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `fax_number`
- Description: (Optional) Fax number of the contact in international format. For example, "+1-800-555-0123".
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `postal_address`
- Description: (Required) Required. Postal address of the contact. Structure is [documented below](#nested_contact_settings_technical_contact_postal_address). <a name="nested_contact_settings_technical_contact_postal_address"></a>The `postal_address` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `region_code`
- Description: (Required) Required. CLDR region code of the country/region of the address. This is never inferred and it is up to the user to ensure the value is correct. See https://cldr.unicode.org/ and https://www.unicode.org/cldr/charts/30/supplemental/territory_information.html for details. Example: "CH" for Switzerland.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `postal_code`
- Description: (Optional) Postal code of the address. Not all countries use or require postal codes to be present, but where they are used, they may trigger additional validation with other parts of the address (e.g. state/zip validation in the U.S.A.).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `administrative_area`
- Description: (Optional) Highest administrative subdivision which is used for postal addresses of a country or region. For example, this can be a state, a province, an oblast, or a prefecture. Specifically, for Spain this is the province and not the autonomous community (e.g. "Barcelona" and not "Catalonia"). Many countries don't use an administrative area in postal addresses. E.g. in Switzerland this should be left unpopulated.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `locality`
- Description: (Optional) Generally refers to the city/town portion of the address. Examples: US city, IT comune, UK post town. In regions of the world where localities are not well defined or do not fit into this structure well, leave locality empty and use addressLines.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `organization`
- Description: (Optional) The name of the organization at the address.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `address_lines`
- Description: (Optional) Unstructured address lines describing the lower levels of an address. Because values in addressLines do not have type information and may sometimes contain multiple values in a single field (e.g. "Austin, TX"), it is important that the line order is clear. The order of address lines should be "envelope order" for the country/region of the address. In places where this can vary (e.g. Japan), address_language is used to make it explicit (e.g. "ja" for large-to-small ordering and "ja-Latn" or "en" for small-to-large). This way, the most specific line of an address can be selected based on the language.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `recipients`
- Description: (Optional) The recipient at the address. This field may, under certain circumstances, contain multiline information. For example, it might contain "care of" information. <a name="nested_management_settings"></a>The `management_settings` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `renewal_method`
- Description: (Output) Output only. The actual renewal method for this Registration. When preferredRenewalMethod is set to AUTOMATIC_RENEWAL, the actual renewalMethod can be equal to RENEWAL_DISABLED—for example, when there are problems with the billing account or reported domain abuse. In such cases, check the issues field on the Registration. After the problem is resolved, the renewalMethod is automatically updated to preferredRenewalMethod in a few hours.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `preferred_renewal_method`
- Description: (Optional) The desired renewal method for this Registration. The actual renewalMethod is automatically updated to reflect this choice. If unset or equal to RENEWAL_METHOD_UNSPECIFIED, the actual renewalMethod is treated as if it were set to AUTOMATIC_RENEWAL. You cannot use RENEWAL_DISABLED during resource creation, and you can update the renewal status only when the Registration resource has state ACTIVE or SUSPENDED. When preferredRenewalMethod is set to AUTOMATIC_RENEWAL, the actual renewalMethod can be set to RENEWAL_DISABLED in case of problems with the billing account or reported domain abuse. In such cases, check the issues field on the Registration. After the problem is resolved, the renewalMethod is automatically updated to preferredRenewalMethod in a few hours.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `transfer_lock_state`
- Description: (Optional) Controls whether the domain can be transferred to another registrar. Values are UNLOCKED or LOCKED. <a name="nested_dns_settings"></a>The `dns_settings` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `custom_dns`
- Description: (Optional) Configuration for an arbitrary DNS provider. Structure is [documented below](#nested_dns_settings_custom_dns).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `glue_records`
- Description: (Optional) The list of glue records for this Registration. Commonly empty. Structure is [documented below](#nested_dns_settings_glue_records). <a name="nested_dns_settings_custom_dns"></a>The `custom_dns` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name_servers`
- Description: (Required) Required. A list of name servers that store the DNS zone for this domain. Each name server is a domain name, with Unicode domain names expressed in Punycode format.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ds_records`
- Description: (Optional) The list of DS records for this domain, which are used to enable DNSSEC. The domain's DNS provider can provide the values to set here. If this field is empty, DNSSEC is disabled. Structure is [documented below](#nested_dns_settings_custom_dns_ds_records). <a name="nested_dns_settings_custom_dns_ds_records"></a>The `ds_records` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `key_tag`
- Description: (Optional) The key tag of the record. Must be set in range 0 -- 65535.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `algorithm`
- Description: (Optional) The algorithm used to generate the referenced DNSKEY.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `digest_type`
- Description: (Optional) The hash function used to generate the digest of the referenced DNSKEY.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `digest`
- Description: (Optional) The digest generated from the referenced DNSKEY. <a name="nested_dns_settings_glue_records"></a>The `glue_records` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `host_name`
- Description: (Required) Required. Domain name of the host in Punycode format.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ipv4_addresses`
- Description: (Optional) List of IPv4 addresses corresponding to this host in the standard decimal format (e.g. 198.51.100.1). At least one of ipv4_address and ipv6_address must be set.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ipv6_addresses`
- Description: (Optional) List of IPv4 addresses corresponding to this host in the standard decimal format (e.g. 198.51.100.1). At least one of ipv4_address and ipv6_address must be set.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
