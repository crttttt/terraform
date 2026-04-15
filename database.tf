resource "google_sql_database_instance" "db" {
  name             = "wp-db"
  database_version = "MYSQL_8_0"
  region           = var.region

  settings {
    tier = "db-f1-micro"

    ip_configuration {
      ipv4_enabled = false
  }
}

resource "google_sql_database" "database" {
  name     = "wordpress"
  instance = google_sql_database_instance.db.name
}

resource "google_sql_user" "user" {
  name     = "wpuser"
  instance = google_sql_database_instance.db.name
  password = "password123"
}
