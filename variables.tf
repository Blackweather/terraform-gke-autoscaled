variable "project" {
  type    = string
  default = ""
}

variable "zone" {
  type    = string
  default = "us-central1-c"
}

variable "initial_node_count" {
  type    = number
  default = 1
}

variable "min_node_count" {
  type    = number
  default = 1
}

variable "max_node_count" {
  type    = number
  default = 2
}

variable "machine_type" {
  type    = string
  default = "e2-medium"
}
