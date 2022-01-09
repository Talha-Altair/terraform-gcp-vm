
resource "google_compute_instance" "default" {
  name         = var.machine_name
  machine_type = var.machine_type
  zone         = "asia-south1-a"

  metadata = {
    ssh-keys = "${var.gce_ssh_user}:${file(var.gce_ssh_pub_key_file)}"
  }

  boot_disk {
    initialize_params {
      image = var.machine_boot_distro
    }
  }

  network_interface {
    network = "default"

    access_config {
      // Include this section to give the VM an external ip address
    }
  }

  metadata_startup_script = "sudo apt-get update"

  // Apply the firewall rule to allow external IPs to access this instance
  tags = ["firewall-tag-for-target"]
}

resource "google_compute_firewall" "firewall_tag_for_target" {
  name    = "default-allow-http-terraform"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["22", "9200", "5601"]
  }

  // Allow traffic from everywhere to instances with an http-server tag
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["firewall-tag-for-target"]
}

output "ip" {
  value = google_compute_instance.default.network_interface.0.access_config.0.nat_ip
}
