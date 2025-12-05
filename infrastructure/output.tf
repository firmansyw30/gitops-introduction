# Project and Region Outputs
output "project_id" {
  description = "Google Cloud Project ID"
  value       = var.project_id
}

output "region" {
  description = "Google Cloud Region"
  value       = var.region
}

output "zone" {
  description = "Google Cloud Zone"
  value       = var.zone
}

# VPC Network Outputs
output "network_id" {
  description = "The ID of the VPC network"
  value       = google_compute_network.sample_network.id
}

output "network_name" {
  description = "The name of the VPC network"
  value       = google_compute_network.sample_network.name
}

output "network_self_link" {
  description = "The self link of the VPC network"
  value       = google_compute_network.sample_network.self_link
}

# Subnetwork Outputs
output "subnetwork_id" {
  description = "The ID of the subnetwork"
  value       = google_compute_subnetwork.sample_subnetwork.id
}

output "subnetwork_name" {
  description = "The name of the subnetwork"
  value       = google_compute_subnetwork.sample_subnetwork.name
}

output "subnetwork_ip_cidr_range" {
  description = "The IP CIDR range of the subnetwork"
  value       = google_compute_subnetwork.sample_subnetwork.ip_cidr_range
}

output "subnetwork_self_link" {
  description = "The self link of the subnetwork"
  value       = google_compute_subnetwork.sample_subnetwork.self_link
}

# GKE Cluster Outputs
output "gke_cluster_id" {
  description = "GKE Cluster ID"
  value       = google_container_cluster.my_gke_cluster.id
}

output "gke_cluster_name" {
  description = "GKE Cluster Name"
  value       = google_container_cluster.my_gke_cluster.name
}

output "gke_cluster_endpoint" {
  description = "GKE Cluster Endpoint"
  value       = google_container_cluster.my_gke_cluster.endpoint
  sensitive   = true
}

output "gke_cluster_ca_certificate" {
  description = "GKE Cluster CA Certificate"
  value       = base64decode(google_container_cluster.my_gke_cluster.master_auth[0].cluster_ca_certificate)
  sensitive   = true
}

output "gke_cluster_location" {
  description = "GKE Cluster Location (Zone)"
  value       = google_container_cluster.my_gke_cluster.location
}

output "gke_cluster_network" {
  description = "GKE Cluster Network"
  value       = google_container_cluster.my_gke_cluster.network
}

output "gke_cluster_subnetwork" {
  description = "GKE Cluster Subnetwork"
  value       = google_container_cluster.my_gke_cluster.subnetwork
}

# GKE Node Pool Outputs
output "node_pool_id" {
  description = "GKE Node Pool ID"
  value       = google_container_node_pool.my_container_node_pool.id
}

output "node_pool_name" {
  description = "GKE Node Pool Name"
  value       = google_container_node_pool.my_container_node_pool.name
}

output "node_pool_instance_group_urls" {
  description = "Instance group URLs of the node pool"
  value       = google_container_node_pool.my_container_node_pool.instance_group_urls
}

# Artifact Registry Outputs
output "artifact_registry_repository_id" {
  description = "Artifact Registry Repository ID"
  value       = google_artifact_registry_repository.my_sample_react_app_repository.id
}

output "artifact_registry_repository_name" {
  description = "Artifact Registry Repository Name"
  value       = google_artifact_registry_repository.my_sample_react_app_repository.name
}

output "artifact_registry_repository_url" {
  description = "Artifact Registry Repository URL"
  value       = google_artifact_registry_repository.my_sample_react_app_repository
}

output "artifact_registry_repository_description" {
  description = "Artifact Registry Repository Description"
  value       = google_artifact_registry_repository.my_sample_react_app_repository.description
}

output "artifact_registry_location" {
  description = "Artifact Registry Repository Location"
  value       = google_artifact_registry_repository.my_sample_react_app_repository.location
}

# kubectl Configuration Helper Output
output "kubernetes_cluster_name" {
  value       = google_container_cluster.my_gke_cluster.name
  description = "GKE Cluster Name for kubectl configuration"
}

output "region_for_kubectl" {
  value       = var.zone
  description = "GCP Zone for kubectl configuration"
}

output "kubectl_config_command" {
  value       = "gcloud container clusters get-credentials ${google_container_cluster.my_gke_cluster.name} --zone ${var.zone} --project ${var.project_id}"
  description = "Command to configure kubectl access to the GKE cluster"
}
