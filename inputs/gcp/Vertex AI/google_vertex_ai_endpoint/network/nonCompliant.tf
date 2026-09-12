resource "google_vertex_ai_endpoint" "non_compliant_example_1" {
    name         = "non_compliant_example_1"
    display_name = "sample-endpoint"
    location     = "us-central1"
    # 使用完全合法的 GCP 格式，但使用一个未授权的 VPC 名称
    network      = "projects/123456789/global/networks/unauthorized-vpc"
}