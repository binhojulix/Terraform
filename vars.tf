variable "amis" {
    type = map

    default = {
        "us-east-1" = "ami-06878d265978313ca"
        "us-east-2" = "ami-00df23eac3b277b5f"
    }
  
}


variable "cdris_acesso_remoto" {
  type = list
  default = ["191.183.43.164/32", "191.183.43.164/32"]
}