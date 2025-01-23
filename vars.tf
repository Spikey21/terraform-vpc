variable "REGION" {
  default = "us-east-1"
}

variable "ZONE1" {
  default = "us-east-1a"
}

variable "ZONE2" {
  default = "us-east-1b"
}

variable "ZONE3" {
  default = "us-east-1c"
}


variable "amiIDs" {
  type = map(any)
  default = {
    us-east-1 = "ami-04b4f1a9cf54c11d0"
    us-east-2 = "ami-0cb91c7de36eed2cb"
  }
}

variable "webUSER" {
  default = "ubuntu"
}