resource "google_storage_bucket" "state_bucket" {
  name     = "exermon-state-bucket"
  location = var.region
}