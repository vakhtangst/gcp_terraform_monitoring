variable "notification_users_basic" {
  description = "List for users notification for basic group"
  type        = list(string)
  default     = ["vakhtang.st@gmail.com", "vakhtang.devops@gmail.com"]
}

resource "google_monitoring_notification_channel" "basic" {
  display_name = "Notification vakhtang 1"
  type         = "email"
  labels = {
    email_address = "vakhtang.st@gmail.com"
  }
}

# resource "google_monitoring_notification_channel" "email" {
#   display_name = "Notification vakhtang 2"
#   type         = "email"
#   labels = {
#     email_address = "vakhtang.devops@gmail.com"
#   }
# }

resource "google_monitoring_notification_channel" "email" {
  count        = length(var.notification_users_basic)
  display_name = "Send email to ${element(var.notification_users_basic, count.index)}"
  type         = "email"
  labels = {
    email_address = element(var.notification_users_basic, count.index)
  }

}
