
variable "client" {
  description = "Please provide the client ID."
  type        = string
  default     = ""
}

variable "secret" {
  description = "Please provide the client secret."
  type        = string
  sensitive   = true
  default     = ""
}

variable "subscriptionshub" {
  description = "Please provide the subscription IDs."
  type        = string
  default     = "af5392bb-f013-4b3d-a1f9-614f19eddcfd"
}