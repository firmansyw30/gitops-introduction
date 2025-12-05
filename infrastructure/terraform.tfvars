# Basic Variables
project_id = "our-hull-385315"
region     = "asia-southeast2"
zone       = "asia-southeast2-a"

# VPC
network_name                     = "my-sample-network"
auto_create_subnetworks          = false
enable_ula_internal_ipv6         = true
subnetwork_name                  = "my-sample-subnetwork"
subnetwork_ip_cidr_range         = "10.0.0.0/16"
stack_type                       = "IPV4_IPV6"
ipv6_access_type                 = "EXTERNAL"
services_secondary_ip_range_name = "services-range"
pod_secondary_ip_range_name      = "pod-ranges"
services_secondary_ip_range      = "192.168.0.0/24"
pod_secondary_ip_range           = "192.168.1.0/24"

# Artifact Registry
repository_id          = "my-sample-react-app-repo"
repository_format      = "DOCKER"
repository_description = "Artifact Registry for sample React app"

# IAM Service Account
service_account_email = "personal-service-account@our-hull-385315.iam.gserviceaccount.com"

# GKE Cluster
cluster_name    = "my-sample-gke-cluster"
networking_mode = "VPC_NATIVE"
cluster_version = "latest"

# Container Node Pool
node_pool_name              = "my-sample-node-pool"
initial_node_count          = 1
remove_default_node_pool    = true
node_count                  = 1
node_spot                   = true
node_disk_size              = 20
node_disk_type              = "pd-standard"
node_machine_type           = "e2-small"
cluster_deletion_protection = false
