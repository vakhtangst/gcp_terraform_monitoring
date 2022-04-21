resource "google_monitoring_notification_channel" "basic" {
  display_name = "Notification vakhtang 1"
  type         = "email"
  labels = {
    email_address = "vakhtang.st@gmail.com"
  }
}

resource "google_monitoring_notification_channel" "email" {
  display_name = "Notification vakhtang 2"
  type         = "email"
  labels = {
    email_address = "vakhtang.devops@gmail.com"
  }
}