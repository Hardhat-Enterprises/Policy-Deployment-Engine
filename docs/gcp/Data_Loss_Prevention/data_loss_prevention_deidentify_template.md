## 🛡️ Policy Deployment Engine: `data_loss_prevention_deidentify_template`

This section provides a concise policy evaluation for the `data_loss_prevention_deidentify_template` resource in GCP.

Reference: [Terraform Registry – data_loss_prevention_deidentify_template](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/data_loss_prevention_deidentify_template)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `parent` | The parent of the template in any of the following formats: * `projects/{{project}}` * `projects/{{project}}/locations/{{location}}` * `organizations/{{organization_id}}` * `organizations/{{organization_id}}/locations/{{location}}` | true | None | None |
| `description` | A description of the template. | false | None | None |
| `display_name` | User set display name of the template. | false | None | None |
| `template_id` | The template id can contain uppercase and lowercase letters, numbers, and hyphens; that is, it must match the regular expression: [a-zA-Z\d-_]+. The maximum length is 100 characters. Can be empty to allow the system to generate one. | false | None | None |

### deidentify_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `image_transformations` | Treat the dataset as an image and redact. Structure is [documented below](#nested_deidentify_config_image_transformations). | false | None | None |
| `info_type_transformations` | Treat the dataset as free-form text and apply the same free text transformation everywhere Structure is [documented below](#nested_deidentify_config_info_type_transformations). | false | None | None |
| `record_transformations` | Treat the dataset as structured. Transformations can be applied to specific locations within structured datasets, such as transforming a column within a table. Structure is [documented below](#nested_deidentify_config_record_transformations). | false | None | None |

### image_transformations Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `transforms` | For determination of how redaction of images should occur. Structure is [documented below](#nested_deidentify_config_image_transformations_transforms). | true | None | None |

### transforms Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `redaction_color` | The color to use when redacting content from an image. If not specified, the default is black. Structure is [documented below](#nested_deidentify_config_image_transformations_transforms_transforms_redaction_color). | false | None | None |
| `selected_info_types` | Apply transformation to the selected infoTypes. Structure is [documented below](#nested_deidentify_config_image_transformations_transforms_transforms_selected_info_types). | false | None | None |
| `all_info_types` | Apply transformation to all findings not specified in other ImageTransformation's selectedInfoTypes. | false | None | None |
| `all_text` | Apply transformation to all text that doesn't match an infoType. | false | None | None |

### redaction_color Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `red` | The amount of red in the color as a value in the interval [0, 1]. | false | None | None |
| `blue` | The amount of blue in the color as a value in the interval [0, 1]. | false | None | None |
| `green` | The amount of green in the color as a value in the interval [0, 1]. | false | None | None |

### selected_info_types Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `info_types` | InfoTypes to apply the transformation to. Leaving this empty will apply the transformation to apply to all findings that correspond to infoTypes that were requested in InspectConfig. Structure is [documented below](#nested_deidentify_config_image_transformations_transforms_transforms_selected_info_types_info_types). | true | None | None |

### info_types Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | Name of the information type. | true | None | None |
| `version` | Version name for this InfoType. | false | None | None |
| `sensitivity_score` | Optional custom sensitivity for this InfoType. This only applies to data profiling. Structure is [documented below](#nested_deidentify_config_record_transformations_field_transformations_field_transformations_info_type_transformations_transformations_transformations_info_types_info_types_sensitivity_score). | false | None | None |

### sensitivity_score Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `score` | The sensitivity score applied to the resource. Possible values are: `SENSITIVITY_LOW`, `SENSITIVITY_MODERATE`, `SENSITIVITY_HIGH`. | true | None | None |

### info_type_transformations Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `transformations` | Transformation for each infoType. Cannot specify more than one for a given infoType. Structure is [documented below](#nested_deidentify_config_record_transformations_field_transformations_field_transformations_info_type_transformations_transformations). | true | None | None |

### transformations Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `info_types` | InfoTypes to apply the transformation to. Leaving this empty will apply the transformation to apply to all findings that correspond to infoTypes that were requested in InspectConfig. Structure is [documented below](#nested_deidentify_config_record_transformations_field_transformations_field_transformations_info_type_transformations_transformations_transformations_info_types). | false | None | None |
| `primitive_transformation` | Apply the transformation to the entire field. The `primitive_transformation` block must only contain one argument, corresponding to the type of transformation. Structure is [documented below](#nested_deidentify_config_record_transformations_field_transformations_field_transformations_info_type_transformations_transformations_transformations_primitive_transformation). | true | None | None |

### primitive_transformation Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `replace_config` | Replace each input value with a given value. Structure is [documented below](#nested_deidentify_config_record_transformations_field_transformations_field_transformations_info_type_transformations_transformations_transformations_primitive_transformation_replace_config). | false | None | None |
| `replace_with_info_type_config` | Replace each matching finding with the name of the info type. | false | None | None |
| `character_mask_config` | Partially mask a string by replacing a given number of characters with a fixed character. Masking can start from the beginning or end of the string. This can be used on data of any type (numbers, longs, and so on) and when de-identifying structured data we'll attempt to preserve the original data's type. (This allows you to take a long like 123 and modify it to a string like **3). Structure is [documented below](#nested_deidentify_config_record_transformations_field_transformations_field_transformations_info_type_transformations_transformations_transformations_primitive_transformation_character_mask_config). | false | None | None |
| `crypto_deterministic_config` | Pseudonymization method that generates deterministic encryption for the given input. Outputs a base64 encoded representation of the encrypted output. Uses AES-SIV based on the RFC [https://tools.ietf.org/html/rfc5297](https://tools.ietf.org/html/rfc5297). Structure is [documented below](#nested_deidentify_config_record_transformations_field_transformations_field_transformations_info_type_transformations_transformations_transformations_primitive_transformation_crypto_deterministic_config). | false | None | None |
| `crypto_replace_ffx_fpe_config` | Replaces an identifier with a surrogate using Format Preserving Encryption (FPE) with the FFX mode of operation; however when used in the `content.reidentify` API method, it serves the opposite function by reversing the surrogate back into the original identifier. The identifier must be encoded as ASCII. For a given crypto key and context, the same identifier will be replaced with the same surrogate. Identifiers must be at least two characters long. In the case that the identifier is the empty string, it will be skipped. See [https://cloud.google.com/dlp/docs/pseudonymization](https://cloud.google.com/dlp/docs/pseudonymization) to learn more. Note: We recommend using CryptoDeterministicConfig for all use cases which do not require preserving the input alphabet space and size, plus warrant referential integrity. Structure is [documented below](#nested_deidentify_config_record_transformations_field_transformations_field_transformations_info_type_transformations_transformations_transformations_primitive_transformation_crypto_replace_ffx_fpe_config). | false | None | None |
| `replace_dictionary_config` | Replace with a value randomly drawn (with replacement) from a dictionary. Structure is [documented below](#nested_deidentify_config_record_transformations_field_transformations_field_transformations_info_type_transformations_transformations_transformations_primitive_transformation_replace_dictionary_config). | false | None | None |
| `date_shift_config` | Shifts dates by random number of days, with option to be consistent for the same context. See https://cloud.google.com/dlp/docs/concepts-date-shifting to learn more. Structure is [documented below](#nested_deidentify_config_record_transformations_field_transformations_field_transformations_info_type_transformations_transformations_transformations_primitive_transformation_date_shift_config). | false | None | None |
| `fixed_size_bucketing_config` | Buckets values based on fixed size ranges. The Bucketing transformation can provide all of this functionality, but requires more configuration. This message is provided as a convenience to the user for simple bucketing strategies. The transformed value will be a hyphenated string of {lower_bound}-{upper_bound}. For example, if lower_bound = 10 and upper_bound = 20, all values that are within this bucket will be replaced with "10-20". This can be used on data of type: double, long. If the bound Value type differs from the type of data being transformed, we will first attempt converting the type of the data to be transformed to match the type of the bound before comparing. See https://cloud.google.com/dlp/docs/concepts-bucketing to learn more. Structure is [documented below](#nested_deidentify_config_record_transformations_field_transformations_field_transformations_info_type_transformations_transformations_transformations_primitive_transformation_fixed_size_bucketing_config). | false | None | None |
| `bucketing_config` | Generalization function that buckets values based on ranges. The ranges and replacement values are dynamically provided by the user for custom behavior, such as 1-30 -> LOW 31-65 -> MEDIUM 66-100 -> HIGH This can be used on data of type: number, long, string, timestamp. If the provided value type differs from the type of data being transformed, we will first attempt converting the type of the data to be transformed to match the type of the bound before comparing. See https://cloud.google.com/dlp/docs/concepts-bucketing to learn more. Structure is [documented below](#nested_deidentify_config_record_transformations_field_transformations_field_transformations_info_type_transformations_transformations_transformations_primitive_transformation_bucketing_config). | false | None | None |
| `time_part_config` | For use with Date, Timestamp, and TimeOfDay, extract or preserve a portion of the value. Structure is [documented below](#nested_deidentify_config_record_transformations_field_transformations_field_transformations_info_type_transformations_transformations_transformations_primitive_transformation_time_part_config). | false | None | None |
| `redact_config` | Redact a given value. For example, if used with an InfoTypeTransformation transforming PHONE_NUMBER, and input 'My phone number is 206-555-0123', the output would be 'My phone number is '. | false | None | None |
| `crypto_hash_config` | Pseudonymization method that generates surrogates via cryptographic hashing. Uses SHA-256. The key size must be either 32 or 64 bytes. Outputs a base64 encoded representation of the hashed output (for example, L7k0BHmF1ha5U3NfGykjro4xWi1MPVQPjhMAZbSV9mM=). Currently, only string and integer values can be hashed. See https://cloud.google.com/dlp/docs/pseudonymization to learn more. Structure is [documented below](#nested_deidentify_config_record_transformations_field_transformations_field_transformations_info_type_transformations_transformations_transformations_primitive_transformation_crypto_hash_config). | false | None | None |

### replace_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `new_value` | Replace each input value with a given value. The `new_value` block must only contain one argument. For example when replacing the contents of a string-type field, only `string_value` should be set. Structure is [documented below](#nested_deidentify_config_record_transformations_field_transformations_field_transformations_info_type_transformations_transformations_transformations_primitive_transformation_replace_config_new_value). | true | None | None |

### new_value Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `integer_value` | An integer value (int64 format) | false | None | None |
| `float_value` | A float value. | false | None | None |
| `string_value` | A string value. | false | None | None |
| `boolean_value` | A boolean value. | false | None | None |
| `timestamp_value` | A timestamp in RFC3339 UTC "Zulu" format, with nanosecond resolution and up to nine fractional digits. Examples: "2014-10-02T15:01:23Z" and "2014-10-02T15:01:23.045123456Z". | false | None | None |
| `time_value` | Represents a time of day. Structure is [documented below](#nested_deidentify_config_record_transformations_field_transformations_field_transformations_info_type_transformations_transformations_transformations_primitive_transformation_replace_config_new_value_time_value). | false | None | None |
| `date_value` | Represents a whole or partial calendar date. Structure is [documented below](#nested_deidentify_config_record_transformations_field_transformations_field_transformations_info_type_transformations_transformations_transformations_primitive_transformation_replace_config_new_value_date_value). | false | None | None |
| `day_of_week_value` | Represents a day of the week. Possible values are: `MONDAY`, `TUESDAY`, `WEDNESDAY`, `THURSDAY`, `FRIDAY`, `SATURDAY`, `SUNDAY`. | false | None | None |

### time_value Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `hours` | Hours of day in 24 hour format. Should be from 0 to 23. An API may choose to allow the value "24:00:00" for scenarios like business closing time. | false | None | None |
| `minutes` | Minutes of hour of day. Must be from 0 to 59. | false | None | None |
| `seconds` | Seconds of minutes of the time. Must normally be from 0 to 59. An API may allow the value 60 if it allows leap-seconds. | false | None | None |
| `nanos` | Fractions of seconds in nanoseconds. Must be from 0 to 999,999,999. | false | None | None |

### date_value Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `year` | Year of the date. Must be from 1 to 9999, or 0 to specify a date without a year. | false | None | None |
| `month` | Month of a year. Must be from 1 to 12, or 0 to specify a year without a month and day. | false | None | None |
| `day` | Day of a month. Must be from 1 to 31 and valid for the year and month, or 0 to specify a year by itself or a year and month where the day isn't significant. | false | None | None |

### character_mask_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `masking_character` | Character to use to mask the sensitive values—for example, * for an alphabetic string such as a name, or 0 for a numeric string such as ZIP code or credit card number. This string must have a length of 1. If not supplied, this value defaults to * for strings, and 0 for digits. | false | None | None |
| `number_to_mask` | Number of characters to mask. If not set, all matching chars will be masked. Skipped characters do not count towards this tally. If number_to_mask is negative, this denotes inverse masking. Cloud DLP masks all but a number of characters. For example, suppose you have the following values: - `masking_character` is * - `number_to_mask` is -4 - `reverse_order` is false - `characters_to_ignore` includes - - Input string is 1234-5678-9012-3456 The resulting de-identified string is ****-****-****-3456. Cloud DLP masks all but the last four characters. If reverseOrder is true, all but the first four characters are masked as 1234-****-****-****. | false | None | None |
| `reverse_order` | Mask characters in reverse order. For example, if masking_character is 0, number_to_mask is 14, and reverse_order is `false`, then the input string `1234-5678-9012-3456` is masked as `00000000000000-3456`. | false | None | None |
| `characters_to_ignore` | Characters to skip when doing de-identification of a value. These will be left alone and skipped. Structure is [documented below](#nested_deidentify_config_record_transformations_field_transformations_field_transformations_info_type_transformations_transformations_transformations_primitive_transformation_character_mask_config_characters_to_ignore). | false | None | None |

### characters_to_ignore Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `characters_to_skip` | Characters to not transform when masking. Only one of this or `common_characters_to_ignore` must be specified. | false | None | None |
| `common_characters_to_ignore` | Common characters to not transform when masking. Useful to avoid removing punctuation. Only one of this or `characters_to_skip` must be specified. Possible values are: `NUMERIC`, `ALPHA_UPPER_CASE`, `ALPHA_LOWER_CASE`, `PUNCTUATION`, `WHITESPACE`. | false | None | None |

### crypto_deterministic_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `crypto_key` | The key used by the encryption function. For deterministic encryption using AES-SIV, the provided key is internally expanded to 64 bytes prior to use. Structure is [documented below](#nested_deidentify_config_record_transformations_field_transformations_field_transformations_info_type_transformations_transformations_transformations_primitive_transformation_crypto_deterministic_config_crypto_key). | true | None | None |
| `surrogate_info_type` | The custom info type to annotate the surrogate with. This annotation will be applied to the surrogate by prefixing it with the name of the custom info type followed by the number of characters comprising the surrogate. The following scheme defines the format: {info type name}({surrogate character count}):{surrogate} For example, if the name of custom info type is 'MY\_TOKEN\_INFO\_TYPE' and the surrogate is 'abc', the full replacement value will be: 'MY\_TOKEN\_INFO\_TYPE(3):abc' This annotation identifies the surrogate when inspecting content using the custom info type 'Surrogate'. This facilitates reversal of the surrogate when it occurs in free text. Note: For record transformations where the entire cell in a table is being transformed, surrogates are not mandatory. Surrogates are used to denote the location of the token and are necessary for re-identification in free form text. In order for inspection to work properly, the name of this info type must not occur naturally anywhere in your data; otherwise, inspection may either *   reverse a surrogate that does not correspond to an actual identifier *   be unable to parse the surrogate and result in an error Therefore, choose your custom info type name carefully after considering what your data looks like. One way to select a name that has a high chance of yielding reliable detection is to include one or more unicode characters that are highly improbable to exist in your data. For example, assuming your data is entered from a regular ASCII keyboard, the symbol with the hex code point 29DD might be used like so: ⧝MY\_TOKEN\_TYPE. Structure is [documented below](#nested_deidentify_config_record_transformations_field_transformations_field_transformations_info_type_transformations_transformations_transformations_primitive_transformation_crypto_deterministic_config_surrogate_info_type). | true | None | None |
| `context` | A context may be used for higher security and maintaining referential integrity such that the same identifier in two different contexts will be given a distinct surrogate. The context is appended to plaintext value being encrypted. On decryption the provided context is validated against the value used during encryption. If a context was provided during encryption, same context must be provided during decryption as well. If the context is not set, plaintext would be used as is for encryption. If the context is set but: 1. there is no record present when transforming a given value or 2. the field is not present when transforming a given value, plaintext would be used as is for encryption. Note that case (1) is expected when an InfoTypeTransformation is applied to both structured and unstructured ContentItems. Structure is [documented below](#nested_deidentify_config_record_transformations_field_transformations_field_transformations_info_type_transformations_transformations_transformations_primitive_transformation_crypto_deterministic_config_context). | false | None | None |

### crypto_key Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `transient` | Transient crypto key. Use this to have a random data crypto key generated. It will be discarded after the request finishes. Only one of this, `unwrapped` or `kms_wrapped` must be specified. Structure is [documented below](#nested_deidentify_config_record_transformations_field_transformations_field_transformations_info_type_transformations_transformations_transformations_primitive_transformation_crypto_deterministic_config_crypto_key_transient). | false | None | None |
| `unwrapped` | Unwrapped crypto key. Using raw keys is prone to security risks due to accidentally leaking the key. Choose another type of key if possible. Only one of this, `transient` or `kms_wrapped` must be specified. Structure is [documented below](#nested_deidentify_config_record_transformations_field_transformations_field_transformations_info_type_transformations_transformations_transformations_primitive_transformation_crypto_deterministic_config_crypto_key_unwrapped). | false | None | None |
| `kms_wrapped` | KMS wrapped key. Include to use an existing data crypto key wrapped by KMS. The wrapped key must be a 128-, 192-, or 256-bit key. Authorization requires the following IAM permissions when sending a request to perform a crypto transformation using a KMS-wrapped crypto key: dlp.kms.encrypt For more information, see [Creating a wrapped key](https://cloud.google.com/dlp/docs/create-wrapped-key). Only one of this, `transient` or `unwrapped` must be specified. Note: When you use Cloud KMS for cryptographic operations, [charges apply](https://cloud.google.com/kms/pricing). Structure is [documented below](#nested_deidentify_config_record_transformations_field_transformations_field_transformations_info_type_transformations_transformations_transformations_primitive_transformation_crypto_deterministic_config_crypto_key_kms_wrapped). | false | None | None |

### transient Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | Name of the key. This is an arbitrary string used to differentiate different keys. A unique key is generated per name: two separate `TransientCryptoKey` protos share the same generated key if their names are the same. When the data crypto key is generated, this name is not used in any way (repeating the api call will result in a different key being generated). | true | None | None |

### unwrapped Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `key` | A 128/192/256 bit key. A base64-encoded string. **Note**: This property is sensitive and will not be displayed in the plan. | true | None | None |

### kms_wrapped Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `wrapped_key` | The wrapped data crypto key. A base64-encoded string. | true | None | None |
| `crypto_key_name` | The resource name of the KMS CryptoKey to use for unwrapping. | true | None | None |

### surrogate_info_type Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | Name of the information type. Either a name of your choosing when creating a CustomInfoType, or one of the names listed at [https://cloud.google.com/dlp/docs/infotypes-reference](https://cloud.google.com/dlp/docs/infotypes-reference) when specifying a built-in type. When sending Cloud DLP results to Data Catalog, infoType names should conform to the pattern `[A-Za-z0-9$-_]{1,64}`. | true | None | None |
| `version` | Optional version name for this InfoType. | false | None | None |
| `sensitivity_score` | Optional custom sensitivity for this InfoType. This only applies to data profiling. Structure is [documented below](#nested_deidentify_config_record_transformations_field_transformations_field_transformations_info_type_transformations_transformations_transformations_primitive_transformation_crypto_deterministic_config_surrogate_info_type_sensitivity_score). | false | None | None |

### context Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | Name describing the field. | true | None | None |

### crypto_replace_ffx_fpe_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `crypto_key` | The key used by the encryption algorithm. Structure is [documented below](#nested_deidentify_config_record_transformations_field_transformations_field_transformations_info_type_transformations_transformations_transformations_primitive_transformation_crypto_replace_ffx_fpe_config_crypto_key). | true | None | None |
| `context` | The 'tweak', a context may be used for higher security since the same identifier in two different contexts won't be given the same surrogate. If the context is not set, a default tweak will be used. If the context is set but: 1.  there is no record present when transforming a given value or 2.  the field is not present when transforming a given value, a default tweak will be used. Note that case (1) is expected when an `InfoTypeTransformation` is applied to both structured and non-structured `ContentItem`s. Currently, the referenced field may be of value type integer or string. The tweak is constructed as a sequence of bytes in big endian byte order such that: *   a 64 bit integer is encoded followed by a single byte of value 1 *   a string is encoded in UTF-8 format followed by a single byte of value 2 Structure is [documented below](#nested_deidentify_config_record_transformations_field_transformations_field_transformations_info_type_transformations_transformations_transformations_primitive_transformation_crypto_replace_ffx_fpe_config_context). | false | None | None |
| `surrogate_info_type` | The custom infoType to annotate the surrogate with. This annotation will be applied to the surrogate by prefixing it with the name of the custom infoType followed by the number of characters comprising the surrogate. The following scheme defines the format: info\_type\_name(surrogate\_character\_count):surrogate For example, if the name of custom infoType is 'MY\_TOKEN\_INFO\_TYPE' and the surrogate is 'abc', the full replacement value will be: 'MY\_TOKEN\_INFO\_TYPE(3):abc' This annotation identifies the surrogate when inspecting content using the custom infoType [`SurrogateType`](https://cloud.google.com/dlp/docs/reference/rest/v2/InspectConfig#surrogatetype). This facilitates reversal of the surrogate when it occurs in free text. In order for inspection to work properly, the name of this infoType must not occur naturally anywhere in your data; otherwise, inspection may find a surrogate that does not correspond to an actual identifier. Therefore, choose your custom infoType name carefully after considering what your data looks like. One way to select a name that has a high chance of yielding reliable detection is to include one or more unicode characters that are highly improbable to exist in your data. For example, assuming your data is entered from a regular ASCII keyboard, the symbol with the hex code point 29DD might be used like so: ⧝MY\_TOKEN\_TYPE Structure is [documented below](#nested_deidentify_config_record_transformations_field_transformations_field_transformations_info_type_transformations_transformations_transformations_primitive_transformation_crypto_replace_ffx_fpe_config_surrogate_info_type). | false | None | None |
| `common_alphabet` | Common alphabets. Only one of this, `custom_alphabet` or `radix` must be specified. Possible values are: `NUMERIC`, `HEXADECIMAL`, `UPPER_CASE_ALPHA_NUMERIC`, `ALPHA_NUMERIC`. | false | None | None |
| `custom_alphabet` | This is supported by mapping these to the alphanumeric characters that the FFX mode natively supports. This happens before/after encryption/decryption. Each character listed must appear only once. Number of characters must be in the range \[2, 95\]. This must be encoded as ASCII. The order of characters does not matter. The full list of allowed characters is: ``0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz ~`!@#$%^&*()_-+={[}]|:;"'<,>.?/``. Only one of this, `common_alphabet` or `radix` must be specified. | false | None | None |
| `radix` | The native way to select the alphabet. Must be in the range \[2, 95\]. Only one of this, `custom_alphabet` or `common_alphabet` must be specified. | false | None | None |

### replace_dictionary_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `word_list` | A list of words to select from for random replacement. The [limits](https://cloud.google.com/dlp/limits) page contains details about the size limits of dictionaries. Structure is [documented below](#nested_deidentify_config_record_transformations_field_transformations_field_transformations_info_type_transformations_transformations_transformations_primitive_transformation_replace_dictionary_config_word_list). | true | None | None |

### word_list Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `words` | Words or phrases defining the dictionary. The dictionary must contain at least one phrase and every phrase must contain at least 2 characters that are letters or digits. | true | None | None |

### date_shift_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `context` | Points to the field that contains the context, for example, an entity id. If set, must also set cryptoKey. If set, shift will be consistent for the given context. Structure is [documented below](#nested_deidentify_config_record_transformations_field_transformations_field_transformations_info_type_transformations_transformations_transformations_primitive_transformation_date_shift_config_context). | false | None | None |
| `crypto_key` | Causes the shift to be computed based on this key and the context. This results in the same shift for the same context and cryptoKey. If set, must also set context. Can only be applied to table items. Structure is [documented below](#nested_deidentify_config_record_transformations_field_transformations_field_transformations_info_type_transformations_transformations_transformations_primitive_transformation_date_shift_config_crypto_key). | false | None | None |
| `upper_bound_days` | Range of shift in days. Actual shift will be selected at random within this range (inclusive ends). Negative means shift to earlier in time. Must not be more than 365250 days (1000 years) each direction. For example, 3 means shift date to at most 3 days into the future. | true | None | None |
| `lower_bound_days` | For example, -5 means shift date to at most 5 days back in the past. | true | None | None |

### fixed_size_bucketing_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `lower_bound` | Lower bound value of buckets. All values less than lower_bound are grouped together into a single bucket; for example if lower_bound = 10, then all values less than 10 are replaced with the value "-10". The `lower_bound` block must only contain one argument. See the `fixed_size_bucketing_config` block description for more information about choosing a data type. Structure is [documented below](#nested_deidentify_config_record_transformations_field_transformations_field_transformations_info_type_transformations_transformations_transformations_primitive_transformation_fixed_size_bucketing_config_lower_bound). | true | None | None |
| `upper_bound` | Upper bound value of buckets. All values greater than upper_bound are grouped together into a single bucket; for example if upper_bound = 89, then all values greater than 89 are replaced with the value "89+". The `upper_bound` block must only contain one argument. See the `fixed_size_bucketing_config` block description for more information about choosing a data type. Structure is [documented below](#nested_deidentify_config_record_transformations_field_transformations_field_transformations_info_type_transformations_transformations_transformations_primitive_transformation_fixed_size_bucketing_config_upper_bound). | true | None | None |
| `bucket_size` | Size of each bucket (except for minimum and maximum buckets). So if lower_bound = 10, upper_bound = 89, and bucketSize = 10, then the following buckets would be used: -10, 10-20, 20-30, 30-40, 40-50, 50-60, 60-70, 70-80, 80-89, 89+. Precision up to 2 decimals works. | true | None | None |

### lower_bound Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `integer_value` | An integer value (int64 format) | false | None | None |
| `float_value` | A float value. | false | None | None |
| `string_value` | A string value. | false | None | None |
| `boolean_value` | A boolean value. | false | None | None |
| `timestamp_value` | A timestamp in RFC3339 UTC "Zulu" format, with nanosecond resolution and up to nine fractional digits. Examples: "2014-10-02T15:01:23Z" and "2014-10-02T15:01:23.045123456Z". | false | None | None |
| `time_value` | Represents a time of day. Structure is [documented below](#nested_deidentify_config_record_transformations_field_transformations_field_transformations_primitive_transformation_fixed_size_bucketing_config_lower_bound_time_value). | false | None | None |
| `date_value` | Represents a whole or partial calendar date. Structure is [documented below](#nested_deidentify_config_record_transformations_field_transformations_field_transformations_primitive_transformation_fixed_size_bucketing_config_lower_bound_date_value). | false | None | None |
| `day_of_week_value` | Represents a day of the week. Possible values are: `MONDAY`, `TUESDAY`, `WEDNESDAY`, `THURSDAY`, `FRIDAY`, `SATURDAY`, `SUNDAY`. | false | None | None |

### upper_bound Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `integer_value` | An integer value (int64 format) | false | None | None |
| `float_value` | A float value. | false | None | None |
| `string_value` | A string value. | false | None | None |
| `boolean_value` | A boolean value. | false | None | None |
| `timestamp_value` | A timestamp in RFC3339 UTC "Zulu" format, with nanosecond resolution and up to nine fractional digits. Examples: "2014-10-02T15:01:23Z" and "2014-10-02T15:01:23.045123456Z". | false | None | None |
| `time_value` | Represents a time of day. Structure is [documented below](#nested_deidentify_config_record_transformations_field_transformations_field_transformations_primitive_transformation_fixed_size_bucketing_config_upper_bound_time_value). | false | None | None |
| `date_value` | Represents a whole or partial calendar date. Structure is [documented below](#nested_deidentify_config_record_transformations_field_transformations_field_transformations_primitive_transformation_fixed_size_bucketing_config_upper_bound_date_value). | false | None | None |
| `day_of_week_value` | Represents a day of the week. Possible values are: `MONDAY`, `TUESDAY`, `WEDNESDAY`, `THURSDAY`, `FRIDAY`, `SATURDAY`, `SUNDAY`. | false | None | None |

### bucketing_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `buckets` | Set of buckets. Ranges must be non-overlapping. Bucket is represented as a range, along with replacement values. Structure is [documented below](#nested_deidentify_config_record_transformations_field_transformations_field_transformations_info_type_transformations_transformations_transformations_primitive_transformation_bucketing_config_buckets). | true | None | None |

### buckets Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `min` | Lower bound of the range, inclusive. Type should be the same as max if used. The `min` block must only contain one argument. See the `bucketing_config` block description for more information about choosing a data type. Structure is [documented below](#nested_deidentify_config_record_transformations_field_transformations_field_transformations_info_type_transformations_transformations_transformations_primitive_transformation_bucketing_config_buckets_buckets_min). | false | None | None |
| `max` | Upper bound of the range, exclusive; type must match min. The `max` block must only contain one argument. See the `bucketing_config` block description for more information about choosing a data type. Structure is [documented below](#nested_deidentify_config_record_transformations_field_transformations_field_transformations_info_type_transformations_transformations_transformations_primitive_transformation_bucketing_config_buckets_buckets_max). | false | None | None |
| `replacement_value` | Replacement value for this bucket. The `replacement_value` block must only contain one argument. Structure is [documented below](#nested_deidentify_config_record_transformations_field_transformations_field_transformations_info_type_transformations_transformations_transformations_primitive_transformation_bucketing_config_buckets_buckets_replacement_value). | true | None | None |

### min Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `integer_value` | An integer value (int64 format) | false | None | None |
| `float_value` | A float value. | false | None | None |
| `string_value` | A string value. | false | None | None |
| `timestamp_value` | A timestamp in RFC3339 UTC "Zulu" format, with nanosecond resolution and up to nine fractional digits. Examples: "2014-10-02T15:01:23Z" and "2014-10-02T15:01:23.045123456Z". | false | None | None |
| `time_value` | Represents a time of day. Structure is [documented below](#nested_deidentify_config_record_transformations_field_transformations_field_transformations_info_type_transformations_transformations_transformations_primitive_transformation_bucketing_config_buckets_buckets_min_time_value). | false | None | None |
| `date_value` | Represents a whole or partial calendar date. Structure is [documented below](#nested_deidentify_config_record_transformations_field_transformations_field_transformations_info_type_transformations_transformations_transformations_primitive_transformation_bucketing_config_buckets_buckets_min_date_value). | false | None | None |
| `day_of_week_value` | Represents a day of the week. Possible values are: `MONDAY`, `TUESDAY`, `WEDNESDAY`, `THURSDAY`, `FRIDAY`, `SATURDAY`, `SUNDAY`. | false | None | None |
| `boolean_value` | A boolean value. | false | None | None |

### max Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `integer_value` | An integer value (int64 format) | false | None | None |
| `float_value` | A float value. | false | None | None |
| `string_value` | A string value. | false | None | None |
| `timestamp_value` | A timestamp in RFC3339 UTC "Zulu" format, with nanosecond resolution and up to nine fractional digits. Examples: "2014-10-02T15:01:23Z" and "2014-10-02T15:01:23.045123456Z". | false | None | None |
| `time_value` | Represents a time of day. Structure is [documented below](#nested_deidentify_config_record_transformations_field_transformations_field_transformations_info_type_transformations_transformations_transformations_primitive_transformation_bucketing_config_buckets_buckets_max_time_value). | false | None | None |
| `date_value` | Represents a whole or partial calendar date. Structure is [documented below](#nested_deidentify_config_record_transformations_field_transformations_field_transformations_info_type_transformations_transformations_transformations_primitive_transformation_bucketing_config_buckets_buckets_max_date_value). | false | None | None |
| `day_of_week_value` | Represents a day of the week. Possible values are: `MONDAY`, `TUESDAY`, `WEDNESDAY`, `THURSDAY`, `FRIDAY`, `SATURDAY`, `SUNDAY`. | false | None | None |
| `boolean_value` | A boolean value. | false | None | None |

### replacement_value Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `integer_value` | An integer value (int64 format) | false | None | None |
| `float_value` | A float value. | false | None | None |
| `string_value` | A string value. | false | None | None |
| `timestamp_value` | A timestamp in RFC3339 UTC "Zulu" format, with nanosecond resolution and up to nine fractional digits. Examples: "2014-10-02T15:01:23Z" and "2014-10-02T15:01:23.045123456Z". | false | None | None |
| `time_value` | Represents a time of day. Structure is [documented below](#nested_deidentify_config_record_transformations_field_transformations_field_transformations_info_type_transformations_transformations_transformations_primitive_transformation_bucketing_config_buckets_buckets_replacement_value_time_value). | false | None | None |
| `date_value` | Represents a whole or partial calendar date. Structure is [documented below](#nested_deidentify_config_record_transformations_field_transformations_field_transformations_info_type_transformations_transformations_transformations_primitive_transformation_bucketing_config_buckets_buckets_replacement_value_date_value). | false | None | None |
| `day_of_week_value` | Represents a day of the week. Possible values are: `MONDAY`, `TUESDAY`, `WEDNESDAY`, `THURSDAY`, `FRIDAY`, `SATURDAY`, `SUNDAY`. | false | None | None |
| `boolean_value` | A boolean value. | false | None | None |

### time_part_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `part_to_extract` | The part of the time to keep. Possible values are: `YEAR`, `MONTH`, `DAY_OF_MONTH`, `DAY_OF_WEEK`, `WEEK_OF_YEAR`, `HOUR_OF_DAY`. | true | None | None |

### crypto_hash_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `crypto_key` | The key used by the encryption function. Structure is [documented below](#nested_deidentify_config_record_transformations_field_transformations_field_transformations_info_type_transformations_transformations_transformations_primitive_transformation_crypto_hash_config_crypto_key). | true | None | None |

### record_transformations Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `field_transformations` | Transform the record by applying various field transformations. Structure is [documented below](#nested_deidentify_config_record_transformations_field_transformations). | false | None | None |
| `record_suppressions` | Configuration defining which records get suppressed entirely. Records that match any suppression rule are omitted from the output. Structure is [documented below](#nested_deidentify_config_record_transformations_record_suppressions). | false | None | None |

### field_transformations Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `fields` | Input field(s) to apply the transformation to. When you have columns that reference their position within a list, omit the index from the FieldId. FieldId name matching ignores the index. For example, instead of "contact.nums[0].type", use "contact.nums.type". Structure is [documented below](#nested_deidentify_config_record_transformations_field_transformations_field_transformations_fields). | true | None | None |
| `condition` | Only apply the transformation if the condition evaluates to true for the given RecordCondition. The conditions are allowed to reference fields that are not used in the actual transformation. Example Use Cases: - Apply a different bucket transformation to an age column if the zip code column for the same record is within a specific range. - Redact a field if the date of birth field is greater than 85. Structure is [documented below](#nested_deidentify_config_record_transformations_field_transformations_field_transformations_condition). | false | None | None |
| `primitive_transformation` | Apply the transformation to the entire field. The `primitive_transformation` block must only contain one argument, corresponding to the type of transformation. Only one of `primitive_transformation` or `info_type_transformations` must be specified. Structure is [documented below](#nested_deidentify_config_record_transformations_field_transformations_field_transformations_primitive_transformation). | false | None | None |
| `info_type_transformations` | Treat the contents of the field as free text, and selectively transform content that matches an InfoType. Only one of `primitive_transformation` or `info_type_transformations` must be specified. Structure is [documented below](#nested_deidentify_config_record_transformations_field_transformations_field_transformations_info_type_transformations). | false | None | None |

### fields Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | Name describing the field. | false | None | None |

### condition Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `expressions` | An expression, consisting of an operator and conditions. Structure is [documented below](#nested_deidentify_config_record_transformations_record_suppressions_record_suppressions_condition_expressions). | false | None | None |

### expressions Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `logical_operator` | The operator to apply to the result of conditions. Default and currently only supported value is AND. Default value is `AND`. Possible values are: `AND`. | false | None | None |
| `conditions` | Conditions to apply to the expression. Structure is [documented below](#nested_deidentify_config_record_transformations_record_suppressions_record_suppressions_condition_expressions_conditions). | false | None | None |

### conditions Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `conditions` | A collection of conditions. Structure is [documented below](#nested_deidentify_config_record_transformations_record_suppressions_record_suppressions_condition_expressions_conditions_conditions). | false | None | None |
| `field` | Field within the record this condition is evaluated against. Structure is [documented below](#nested_deidentify_config_record_transformations_record_suppressions_record_suppressions_condition_expressions_conditions_conditions_conditions_field). | true | None | None |
| `operator` | Operator used to compare the field or infoType to the value. Possible values are: `EQUAL_TO`, `NOT_EQUAL_TO`, `GREATER_THAN`, `LESS_THAN`, `GREATER_THAN_OR_EQUALS`, `LESS_THAN_OR_EQUALS`, `EXISTS`. | true | None | None |
| `value` | Value to compare against. [Mandatory, except for EXISTS tests.] Structure is [documented below](#nested_deidentify_config_record_transformations_record_suppressions_record_suppressions_condition_expressions_conditions_conditions_conditions_value). | false | None | None |

### field Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | Name describing the field. | false | None | None |

### value Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `integer_value` | An integer value (int64 format) | false | None | None |
| `float_value` | A float value. | false | None | None |
| `string_value` | A string value. | false | None | None |
| `boolean_value` | A boolean value. | false | None | None |
| `timestamp_value` | A timestamp in RFC3339 UTC "Zulu" format, with nanosecond resolution and up to nine fractional digits. Examples: "2014-10-02T15:01:23Z" and "2014-10-02T15:01:23.045123456Z". | false | None | None |
| `time_value` | Represents a time of day. Structure is [documented below](#nested_deidentify_config_record_transformations_record_suppressions_record_suppressions_condition_expressions_conditions_conditions_conditions_value_time_value). | false | None | None |
| `date_value` | Represents a whole or partial calendar date. Structure is [documented below](#nested_deidentify_config_record_transformations_record_suppressions_record_suppressions_condition_expressions_conditions_conditions_conditions_value_date_value). | false | None | None |
| `day_of_week_value` | Represents a day of the week. Possible values are: `MONDAY`, `TUESDAY`, `WEDNESDAY`, `THURSDAY`, `FRIDAY`, `SATURDAY`, `SUNDAY`. | false | None | None |

### record_suppressions Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `condition` | A condition that when it evaluates to true will result in the record being evaluated to be suppressed from the transformed content. Structure is [documented below](#nested_deidentify_config_record_transformations_record_suppressions_record_suppressions_condition). | false | None | None |
