# Basic Variable
variable "project_id" {
  description = "Google Cloud Project ID"
  type        = string
}

variable "region" {
  description = "Google Cloud Region"
  type        = string
}

variable "zone" {
  description = "Google Cloud Zone"
  type        = string
}

# VPC
variable "network_name" {
  description = "Google VPC Network Name"
  type        = string
}

variable "auto_create_subnetworks" {
  description = "Auto Create Subnetworks"
  type        = bool
}

variable "enable_ula_internal_ipv6" {
  description = "Enable ULA Internal IPv6"
  type        = bool
}

variable "subnetwork_name" {
  description = "Google VPC Subnetwork Name"
  type        = string
}

variable "subnetwork_ip_cidr_range" {
  description = "Google VPC Subnetwork IP CIDR Range"
  type        = string
}

variable "stack_type" {
  description = "Subnetwork Stack Type"
  type        = string
}

variable "ipv6_access_type" {
  description = "Subnetwork IPv6 Access Type"
  type        = string
}

variable "services_secondary_ip_range_name" {
  description = "Secondary IP Range Name for Services"
  type        = string
}

variable "pod_secondary_ip_range_name" {
  description = "Secondary IP Range Name for Pods"
  type        = string
}

variable "services_secondary_ip_range" {
  description = "Secondary IP Range for Services"
  type        = string
}

variable "pod_secondary_ip_range" {
  description = "Secondary IP Range for Pods"
  type        = string
}

# Artifact Registry
variable "repository_id" {
  description = "Artifact Registry Repository ID"
  type        = string
}

variable "repository_format" {
  description = "Artifact Registry Repository Format"
  type        = string
}

variable "repository_description" {
  description = "Artifact Registry Repository Description"
  type        = string
}

# IAM Service Account
variable "service_account_email" {
  description = "Email from existing IAM Service Account"
  type        = string
}

# GKE Cluster
variable "cluster_name" {
  description = "GKE Cluster Name"
  type        = string
}

variable "networking_mode" {
  description = "GKE Networking Mode"
  type        = string
}

# Container Node Pool
variable "node_pool_name" {
  description = "GKE Node Pool Name"
  type        = string
}

variable "initial_node_count" {
  description = "Initial Node Count for GKE Node Pool"
  type        = number
}

variable "remove_default_node_pool" {
  description = "Remove Default Node Pool"
  type        = bool
}

variable "node_count" {
  description = "Number of Nodes in the Node Pool"
  type        = number
}

variable "node_spot" {
  description = "Use Spot Nodes"
  type        = bool
}

variable "node_disk_size" {
  description = "Node Disk Size"
  type        = number
}

variable "node_disk_type" {
  description = "Node Disk Type"
  type        = string
}

variable "node_machine_type" {
  description = "Node Machine Type"
  type        = string
}

variable "cluster_deletion_protection" {
  description = "Cluster Deletion Protection"
  type        = bool
}

variable "cluster_version" {
  description = "GKE Cluster Version"
  type        = string
}