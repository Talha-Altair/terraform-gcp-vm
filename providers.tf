provider "google" {
    project = "altair-330820"
    region  = "asia-south1"
    credentials = "${file("creds.json")}"
}