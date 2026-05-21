resource "google_vector_search_collection" "nc" {
  location      = "australia-southeast1"
  collection_id = "nc"
  display_name  = "nc"
  description   = "Vector Search Collection policy test resource."

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