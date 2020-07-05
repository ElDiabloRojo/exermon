terraform {
  backend "gcs" {
    bucket = "exermon-backend-bucket"
    prefix = "database"
    credentials = "/Users/samholden/.gcp/holden-apy-55bcd7c518e6.json"
  }
}