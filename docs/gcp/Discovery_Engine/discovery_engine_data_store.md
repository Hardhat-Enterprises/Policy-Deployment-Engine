## 🛡️ Policy Deployment Engine: `discovery_engine_data_store`

This section provides a concise policy evaluation for the `discovery_engine_data_store` resource in GCP.

Reference: [Terraform Registry – discovery_engine_data_store](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/discovery_engine_data_store)

---

## Argument Reference
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `display_name` | The display name of the data store. This field must be a UTF-8 encoded string with a length limit of 128 characters. | true | false | Just the name | None | None |
| `industry_vertical` | The industry vertical that the data store registers. Possible values are: `GENERIC`, `MEDIA`, `HEALTHCARE_FHIR`. | true | true | Should be set to Generic or whatever is required, Generic is default though | GENERIC | HEALTHCARE_FHIR |
| `content_config` | The content config of the data store. Possible values are: `NO_CONTENT`, `CONTENT_REQUIRED`, `PUBLIC_WEBSITE`. | true | true | Needed to make sure private info isnt getting leaked | CONTENT_REQUIRED | PUBLIC_WEBSITE |
| `location` | The geographic location where the data store should reside. The value can only be one of "global", "us" and "eu". | true | true | Data store and processing laws affect location | eu | us |
| `data_store_id` | The unique id of the data store. | true | false | ID | None | None |
| `solution_types` | The solutions that the data store enrolls. Each value may be one of: `SOLUTION_TYPE_RECOMMENDATION`, `SOLUTION_TYPE_SEARCH`, `SOLUTION_TYPE_CHAT`, `SOLUTION_TYPE_GENERATIVE_CHAT`. | false | false | Logistics | None | None |
| `advanced_site_search_config` | Configuration data for advance site search. Structure is [documented below](#nested_advanced_site_search_config). | false | false | Logistic issue | None | None |
| `kms_key_name` | KMS key resource name which will be used to encrypt resources: `/{project}/locations/{location}/keyRings/{keyRing}/cryptoKeys/{keyId}` The KMS key to be used to protect this DataStore at creation time. Must be set for requests that need to comply with CMEK Org Policy protections. If this field is set and processed successfully, the DataStore will be protected by the KMS key, as indicated in the cmek_config field. | false | true | Encryption | ValidKey | InvalidKey |
| `document_processing_config` | Configuration for Document understanding and enrichment. Structure is [documented below](#nested_document_processing_config). | false | true | Use Native Text can make private info public if not set up correctly | None | None |
| `create_advanced_site_search` | If true, an advanced data store for site search will be created. If the data store is not configured as site search (GENERIC vertical and PUBLIC_WEBSITE contentConfig), this flag will be ignored. | false | false | None | None | None |
| `skip_default_schema_creation` | A boolean flag indicating whether to skip the default schema creation for the data store. Only enable this flag if you are certain that the default schema is incompatible with your use case. If set to true, you must manually create a schema for the data store before any documents can be ingested. This flag cannot be specified if `data_store.starting_schema` is specified. | false | false | None | None | None |
| `project` | If it is not provided, the provider project is used. | true | false | None | None | None |
| `chunking_config` |  | false | false | None | None | None |
| `layout_based_chunking_config` |  | false | false | None | None | None |
| `default_parsing_config` |  | false | false | None | None | None |
| `ocr_parsing_config` |  | false | false | None | None | None |
| `layout_parsing_config` |  | false | false | None | None | None |
| `parsing_config_overrides` |  | false | false | None | None | None |

### advanced_site_search_config Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `disable_initial_index` | If set true, initial indexing is disabled for the DataStore. | false | false | None | None | None |
| `disable_automatic_refresh` | If set true, automatic refresh is disabled for the DataStore. | false | false | None | None | None |

### document_processing_config Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `name` | (Output) The full resource name of the Document Processing Config. Format: `projects/{project}/locations/{location}/collections/{collection_id}/dataStores/{data_store_id}/documentProcessingConfig`. | false | false | None | None | None |
| `chunking_config` | Whether chunking mode is enabled. Structure is [documented below](#nested_document_processing_config_chunking_config). | false | false | None | None | None |
| `default_parsing_config` | Configurations for default Document parser. If not specified, this resource will be configured to use a default DigitalParsingConfig, and the default parsing config will be applied to all file types for Document parsing. Structure is [documented below](#nested_document_processing_config_default_parsing_config). | false | false | None | None | None |
| `parsing_config_overrides` | Map from file type to override the default parsing configuration based on the file type. Supported keys: * `pdf`: Override parsing config for PDF files, either digital parsing, ocr parsing or layout parsing is supported. * `html`: Override parsing config for HTML files, only digital parsing and or layout parsing are supported. * `docx`: Override parsing config for DOCX files, only digital parsing and or layout parsing are supported. Structure is [documented below](#nested_document_processing_config_parsing_config_overrides). | false | false | None | None | None |

### chunking_config Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `layout_based_chunking_config` | Configuration for the layout based chunking. Structure is [documented below](#nested_document_processing_config_chunking_config_layout_based_chunking_config). | false | false | None | None | None |

### layout_based_chunking_config Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `chunk_size` | The token size limit for each chunk. Supported values: 100-500 (inclusive). Default value: 500. | false | false | None | None | None |
| `include_ancestor_headings` | Whether to include appending different levels of headings to chunks from the middle of the document to prevent context loss. Default value: False. | false | false | None | None | None |

### default_parsing_config Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `digital_parsing_config` | Configurations applied to digital parser. | false | false | None | None | None |
| `ocr_parsing_config` | Configurations applied to OCR parser. Currently it only applies to PDFs. Structure is [documented below](#nested_document_processing_config_default_parsing_config_ocr_parsing_config). | false | false | None | None | None |
| `layout_parsing_config` | Configurations applied to layout parser. Structure is [documented below](#nested_document_processing_config_default_parsing_config_layout_parsing_config). | false | false | None | None | None |

### ocr_parsing_config Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `use_native_text` | If true, will use native text instead of OCR text on pages containing native text. | false | true | can make private info public if set to false | True | False |

### layout_parsing_config Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `enable_table_annotation` | If true, the LLM based annotation is added to the table during parsing. | false | false | None | None | None |
| `enable_image_annotation` | If true, the LLM based annotation is added to the image during parsing. | false | false | None | None | None |
| `structured_content_types` | Contains the required structure types to extract from the document. Supported values: `shareholder-structure`. | false | false | None | None | None |
| `exclude_html_elements` | List of HTML elements to exclude from the parsed content. | false | false | None | None | None |
| `exclude_html_classes` | List of HTML classes to exclude from the parsed content. | false | false | None | None | None |
| `exclude_html_ids` | List of HTML ids to exclude from the parsed content. | false | false | None | None | None |

### parsing_config_overrides Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `file_type` |  | false | false | None | None | None |
| `digital_parsing_config` | Configurations applied to digital parser. | false | false | None | None | None |
| `ocr_parsing_config` | Configurations applied to OCR parser. Currently it only applies to PDFs. Structure is [documented below](#nested_document_processing_config_parsing_config_overrides_parsing_config_overrides_ocr_parsing_config). | false | false | None | None | None |
| `layout_parsing_config` | Configurations applied to layout parser. Structure is [documented below](#nested_document_processing_config_parsing_config_overrides_parsing_config_overrides_layout_parsing_config). | false | false | None | None | None |
