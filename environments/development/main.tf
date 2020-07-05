terraform {
  backend "gcs" {
    bucket = "exermon-state-bucket"
    prefix = "development/terraform.tfstate"
    credentials = "/Users/samholden/.gcp/holden-apy-55bcd7c518e6.json"
  }
}

module "database" {
  source                 = "../../modules/database"
  region                 = "europe-north1"
  db_authorized_networks = [
    "64.18.0.0/20",
    "64.233.160.0/19",
    "66.102.0.0/20",
    "66.249.80.0/20",
    "72.14.192.0/18",
    "74.125.0.0/16",
    "173.194.0.0/16",
    "207.126.144.0/20",
    "209.85.128.0/17",
    "216.239.32.0/19"
  ]
}