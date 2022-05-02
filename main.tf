provider "google" {
  credentials = file("cred.json")
  project     = "testing-347616"
  zone        = "us-west4-b"
  region      = "us-west4"
}

# output "name" {
#   value = "${google_monitoring_notification_channel.email.*.id}"
# }