## 🛡️ Policy Deployment Engine: `discovery_engine_data_store`

This section provides a concise policy evaluation for the `discovery_engine_data_store` resource in GCP.

Reference: [Terraform Registry – discovery_engine_data_store](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/discovery_engine_data_store)

---

## 1. Argument Reference

### `display_name`
- Description: (Required) The display name of the data store. This field must be a UTF-8 encoded string with a length limit of 128 characters.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `industry_vertical`
- Description: (Required) The industry vertical that the data store registers. Possible values are: `GENERIC`, `MEDIA`, `HEALTHCARE_FHIR`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `content_config`
- Description: (Required) The content config of the data store. Possible values are: `NO_CONTENT`, `CONTENT_REQUIRED`, `PUBLIC_WEBSITE`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Required) The geographic location where the data store should reside. The value can only be one of "global", "us" and "eu".
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `data_store_id`
- Description: (Required) The unique id of the data store.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `solution_types`
- Description: (Optional) The solutions that the data store enrolls. Each value may be one of: `SOLUTION_TYPE_RECOMMENDATION`, `SOLUTION_TYPE_SEARCH`, `SOLUTION_TYPE_CHAT`, `SOLUTION_TYPE_GENERATIVE_CHAT`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `advanced_site_search_config`
- Description: (Optional) Configuration data for advance site search. Structure is [documented below](#nested_advanced_site_search_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `kms_key_name`
- Description: (Optional) KMS key resource name which will be used to encrypt resources: `/{project}/locations/{location}/keyRings/{keyRing}/cryptoKeys/{keyId}` The KMS key to be used to protect this DataStore at creation time. Must be set for requests that need to comply with CMEK Org Policy protections. If this field is set and processed successfully, the DataStore will be protected by the KMS key, as indicated in the cmek_config field.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `document_processing_config`
- Description: (Optional) Configuration for Document understanding and enrichment. Structure is [documented below](#nested_document_processing_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `create_advanced_site_search`
- Description: (Optional) If true, an advanced data store for site search will be created. If the data store is not configured as site search (GENERIC vertical and PUBLIC_WEBSITE contentConfig), this flag will be ignored.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `skip_default_schema_creation`
- Description: (Optional) A boolean flag indicating whether to skip the default schema creation for the data store. Only enable this flag if you are certain that the default schema is incompatible with your use case. If set to true, you must manually create a schema for the data store before any documents can be ingested. This flag cannot be specified if `data_store.starting_schema` is specified.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_advanced_site_search_config"></a>The `advanced_site_search_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `disable_initial_index`
- Description: (Optional) If set true, initial indexing is disabled for the DataStore.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `disable_automatic_refresh`
- Description: (Optional) If set true, automatic refresh is disabled for the DataStore. <a name="nested_document_processing_config"></a>The `document_processing_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Output) The full resource name of the Document Processing Config. Format: `projects/{project}/locations/{location}/collections/{collection_id}/dataStores/{data_store_id}/documentProcessingConfig`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `chunking_config`
- Description: (Optional) Whether chunking mode is enabled. Structure is [documented below](#nested_document_processing_config_chunking_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `default_parsing_config`
- Description: (Optional) Configurations for default Document parser. If not specified, this resource will be configured to use a default DigitalParsingConfig, and the default parsing config will be applied to all file types for Document parsing. Structure is [documented below](#nested_document_processing_config_default_parsing_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `parsing_config_overrides`
- Description: (Optional) Map from file type to override the default parsing configuration based on the file type. Supported keys:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `layout_based_chunking_config`
- Description: (Optional) Configuration for the layout based chunking. Structure is [documented below](#nested_document_processing_config_chunking_config_layout_based_chunking_config). <a name="nested_document_processing_config_chunking_config_layout_based_chunking_config"></a>The `layout_based_chunking_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `chunk_size`
- Description: (Optional) The token size limit for each chunk. Supported values: 100-500 (inclusive). Default value: 500.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `include_ancestor_headings`
- Description: (Optional) Whether to include appending different levels of headings to chunks from the middle of the document to prevent context loss. Default value: False. <a name="nested_document_processing_config_default_parsing_config"></a>The `default_parsing_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `digital_parsing_config`
- Description: (Optional) Configurations applied to digital parser.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ocr_parsing_config`
- Description: (Optional) Configurations applied to OCR parser. Currently it only applies to PDFs. Structure is [documented below](#nested_document_processing_config_default_parsing_config_ocr_parsing_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `layout_parsing_config`
- Description: (Optional) Configurations applied to layout parser. Structure is [documented below](#nested_document_processing_config_default_parsing_config_layout_parsing_config). <a name="nested_document_processing_config_default_parsing_config_ocr_parsing_config"></a>The `ocr_parsing_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `use_native_text`
- Description: (Optional) If true, will use native text instead of OCR text on pages containing native text. <a name="nested_document_processing_config_default_parsing_config_layout_parsing_config"></a>The `layout_parsing_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enable_table_annotation`
- Description: (Optional) If true, the LLM based annotation is added to the table during parsing.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enable_image_annotation`
- Description: (Optional) If true, the LLM based annotation is added to the image during parsing.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `structured_content_types`
- Description: (Optional) Contains the required structure types to extract from the document. Supported values: `shareholder-structure`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `exclude_html_elements`
- Description: (Optional) List of HTML elements to exclude from the parsed content.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `exclude_html_classes`
- Description: (Optional) List of HTML classes to exclude from the parsed content.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `exclude_html_ids`
- Description: (Optional) List of HTML ids to exclude from the parsed content. <a name="nested_document_processing_config_parsing_config_overrides"></a>The `parsing_config_overrides` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `file_type`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `digital_parsing_config`
- Description: (Optional) Configurations applied to digital parser.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ocr_parsing_config`
- Description: (Optional) Configurations applied to OCR parser. Currently it only applies to PDFs. Structure is [documented below](#nested_document_processing_config_parsing_config_overrides_parsing_config_overrides_ocr_parsing_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `layout_parsing_config`
- Description: (Optional) Configurations applied to layout parser. Structure is [documented below](#nested_document_processing_config_parsing_config_overrides_parsing_config_overrides_layout_parsing_config). <a name="nested_document_processing_config_parsing_config_overrides_parsing_config_overrides_ocr_parsing_config"></a>The `ocr_parsing_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `use_native_text`
- Description: (Optional) If true, will use native text instead of OCR text on pages containing native text. <a name="nested_document_processing_config_parsing_config_overrides_parsing_config_overrides_layout_parsing_config"></a>The `layout_parsing_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enable_table_annotation`
- Description: (Optional) If true, the LLM based annotation is added to the table during parsing.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enable_image_annotation`
- Description: (Optional) If true, the LLM based annotation is added to the image during parsing.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `structured_content_types`
- Description: (Optional) Contains the required structure types to extract from the document. Supported values: `shareholder-structure`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `exclude_html_elements`
- Description: (Optional) List of HTML elements to exclude from the parsed content.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `exclude_html_classes`
- Description: (Optional) List of HTML classes to exclude from the parsed content.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `exclude_html_ids`
- Description: (Optional) List of HTML ids to exclude from the parsed content.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
