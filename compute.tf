resource "google_compute_instance" "compute-instance"{
    name = "monitoring-test-instance"
    machine_type = "f1-micro"
    zone = "${var.zone}"

    boot_disk {
        initialize_params {
        image = "debian-cloud/debian-9"
        }
    }


    network_interface {
        network = "default"
    }

    scheduling {
        preemptible = "FALSE"
    }
}