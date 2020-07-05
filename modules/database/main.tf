resource "random_id" "db_name_suffix" {
  byte_length = 4
}


resource "google_sql_database_instance" "mysql" {
  name             = "mysql-db-${random_id.db_name_suffix.hex}"
  database_version = "MYSQL_5_7"
  region           = var.region

  settings {
    tier = "db-f1-micro"

    ip_configuration {
      dynamic "authorized_networks" {
        for_each = var.db_authorized_networks

        content {
            value = authorized_networks.value

        }
      }
    }
  }
}

resource "google_sql_user" "users" {
  name     = "admin"
  instance = google_sql_database_instance.mysql.name
  host     = "%"
  password = var.db_password
}

resource "google_sql_database" "database" {
  name     = "exercise"
  instance = google_sql_database_instance.mysql.name
}