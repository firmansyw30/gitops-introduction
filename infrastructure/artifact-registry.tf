resource "google_artifact_registry_repository" "my_sample_react_app_repository" {
  location      = var.region
  repository_id = var.repository_id
  description   = var.repository_description
  format        = var.repository_format
}