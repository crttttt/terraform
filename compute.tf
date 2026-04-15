resource "google_compute_instance" "vm" {
  name         = "wp-instance"
  machine_type = "e2-medium"
  zone         = "europe-west1-b"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network = google_compute_network.vpc.name
    access_config {}
  }

  metadata_startup_script = file("scripts/startup.sh")
}