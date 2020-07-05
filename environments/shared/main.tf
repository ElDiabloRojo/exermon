terraform {
  backend "gcs" {
    bucket = "exermon-state-bucket"
    prefix = "backend/terraform.tfstate"
    credentials = "/Users/samholden/.gcp/holden-apy-55bcd7c518e6.json"
  }
}

module "backend" {
  source             = "../../modules/backend"
  region             = "europe-north1"
}