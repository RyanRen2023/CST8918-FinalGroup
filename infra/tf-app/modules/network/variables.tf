variable "group_number" {
  description = "Your group number from Brightspace (e.g., 10)."
  type        = string
  default     = "10"
}

variable "location" {
  description = "Azure region for the resource group and VNet."
  type        = string
  default     = "canadacentral"
}

variable "tags" {
  description = "Optional resource tags."
  type        = map(string)
  default     = {
    "Cost Center" = "000"
  }
}