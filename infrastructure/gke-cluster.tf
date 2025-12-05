resource "google_container_cluster" "my_gke_cluster" {
  name     = var.cluster_name
  location = var.zone # Use zone instead of region for zonal clusters

  # We can't create a cluster with no node pool defined, but we want to only use
  # separately managed node pools. So we create the smallest possible default
  # node pool and immediately delete it.
  remove_default_node_pool = var.remove_default_node_pool
  initial_node_count       = var.initial_node_count
  network                  = google_compute_network.sample_network.id
  subnetwork               = google_compute_subnetwork.sample_subnetwork.id

  networking_mode = var.networking_mode

  ip_allocation_policy {
    cluster_secondary_range_name  = var.pod_secondary_ip_range_name
    services_secondary_range_name = var.services_secondary_ip_range_name
  }

  deletion_protection = var.cluster_deletion_protection

}

resource "google_container_node_pool" "my_container_node_pool" {
  name       = var.node_pool_name
  version    = google_container_cluster.my_gke_cluster.min_master_version
  cluster    = google_container_cluster.my_gke_cluster.name
  node_count = var.node_count
  location   = var.zone # Use zone instead of region for zonal clusters

  node_config {
    spot         = var.node_spot
    disk_size_gb = var.node_disk_size
    disk_type    = var.node_disk_type
    machine_type = var.node_machine_type

    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    service_account = var.service_account_email
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform",
    ]
  }
}