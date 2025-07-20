# Simulate a long-running resource to demonstrate state locking

resource "time_sleep" "wait_100_seconds" {

  create_duration = "100s" # This will cause Terraform to "sleep" for 100 seconds when creating this resource
}
