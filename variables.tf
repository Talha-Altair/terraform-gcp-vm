variable "gce_ssh_user" {
  description = "gce_ssh_user"
  default     = "talha"
}

variable "gce_ssh_pub_key_file" {
  description = "gce_ssh_user"
  default     = "~/.ssh/id_rsa_2.pub"
}

variable "machine_name" {
  description = "machine_name"
  default     = "talha-test-machine"
}

variable "machine_boot_distro" {
  description = "machine_boot_distro"
  default     = "ubuntu-os-cloud/ubuntu-2004-focal-v20211118"
}

variable "machine_type" {
  description = "machine_type"
  default     = "e2-micro"
}