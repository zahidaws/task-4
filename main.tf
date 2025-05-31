provider  "aws" {

 region = "ap-south-1"

}
terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

provider "docker" {
  host = "unix:///var/run/docker.sock"
}

# Pull the Ubuntu image
resource "docker_image" "ubuntu" {
  name = "ubuntu:latest"
}

# Create the Ubuntu container
resource "docker_container" "mycont1" {
  name  = "ubuntu-container"
  image = docker_image.ubuntu.image_id
}
