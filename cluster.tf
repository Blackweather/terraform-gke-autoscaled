resource "google_service_account" "gke_sa" {
  project = var.project

  account_id   = "gke-sa-id"
  display_name = "GKE Service Account"
}

resource "google_container_cluster" "primary" {
  name     = "autoscaled-gke-cluster"
  location = var.zone
  project  = var.project

  depends_on = [google_project_service.container_api]

  remove_default_node_pool = true
  initial_node_count       = var.initial_node_count
}

resource "google_container_node_pool" "primary_nodes" {
  name               = "autoscaled-node-pool"
  location           = var.zone
  project            = var.project
  cluster            = google_container_cluster.primary.name
  initial_node_count = var.initial_node_count

  autoscaling {
    min_node_count = var.min_node_count
    max_node_count = var.max_node_count
  }

  node_config {
    machine_type = var.machine_type

    service_account = google_service_account.gke_sa.email
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}
