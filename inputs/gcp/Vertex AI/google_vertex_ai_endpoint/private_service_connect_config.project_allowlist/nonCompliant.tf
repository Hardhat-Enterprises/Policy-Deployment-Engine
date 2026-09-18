resource "google_vertex_ai_endpoint" "non_compliant_example_1" {
  name         = "non-compliant-endpoint-1"
  display_name = "sample-endpoint"
  location     = "us-central1"
  private_service_connect_config {
    enable_private_service_connect = true
    # project_allowlist 参数缺失，被 null 黑名单拦截
  }
}

resource "google_vertex_ai_endpoint" "non_compliant_example_2" {
  name         = "non-compliant-endpoint-2"
  display_name = "sample-endpoint"
  location     = "us-central1"
  private_service_connect_config {
    enable_private_service_connect = true
    project_allowlist              = []
    # 空列表，被 [] 黑名单拦截
  }
}