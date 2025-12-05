resource "google_compute_network" "sample_network" {
  name = var.network_name

  auto_create_subnetworks  = var.auto_create_subnetworks
  enable_ula_internal_ipv6 = var.enable_ula_internal_ipv6
}

resource "google_compute_subnetwork" "sample_subnetwork" {
  name = var.subnetwork_name

  ip_cidr_range = var.subnetwork_ip_cidr_range
  region        = var.region

  stack_type       = var.stack_type
  ipv6_access_type = var.ipv6_access_type

  network = google_compute_network.sample_network.id
  secondary_ip_range {
    # Services
    range_name    = var.services_secondary_ip_range_name
    ip_cidr_range = var.services_secondary_ip_range
  }

  secondary_ip_range {
    # Pods
    range_name    = var.pod_secondary_ip_range_name
    ip_cidr_range = var.pod_secondary_ip_range
  }
}
