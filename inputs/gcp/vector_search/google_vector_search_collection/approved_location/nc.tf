resource "google_vector_search_collection" "nc" {
  location      = "us-central1"
  collection_id = "nc"
  display_name  = "nc"
  description   = "Vector Search Collection policy test resource."

  encryption_spec {
    crypto_key_name = "projects/dummy-project/locations/us-central1/keyRings/vector-search-key-ring/cryptoKeys/vector-search-key"
  }

  data_schema = jsonencode({
    type = "object"
    properties = {
      title = {
        type = "string"
      }
      content = {
        type = "string"
      }
    }
  })

  vector_schema {
    field_name = "content_embedding"

    dense_vector {
      dimensions = 768

      vertex_embedding_config {
        model_id      = "gemini-embedding-001"
        task_type     = "RETRIEVAL_DOCUMENT"
        text_template = "Content: {content}"
      }
    }
  }
}