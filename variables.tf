# variable "user_uuid" {
#   type    = string
#   description = "The UUID of the user."

#   validation {
#     condition     = can(regex("^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$", var.user_uuid))
#     error_message = "Invalid user_uuid format. It should be in the form of a UUID (e.g., 123e4567-e89b-12d3-a456-426655440000)."
#   }
# }