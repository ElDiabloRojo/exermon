variable "region" {
    type    = string
    default = "europe-north1"
}

variable "db_password" {
    type    = string
    default = "changeme"
}

variable "db_authorized_networks" {
    type    = list
}