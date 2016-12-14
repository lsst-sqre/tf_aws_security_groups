resource "aws_security_group" "internal" {
  vpc_id      = "${var.vpc_id}"
  name        = "${var.tag}-internal"
  description = "allow all VPC internal traffic"

  ingress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    self      = true
  }

  # allow all output traffic from the VPC
  egress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    self      = true
  }

  tags {
    Name = "${var.tag}-internal"
  }
}

resource "aws_security_group" "icmp" {
  vpc_id      = "${var.vpc_id}"
  name        = "${var.tag}-icmp"
  description = "allow icmp"

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8
    to_port     = 8
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 8
    to_port     = 8
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "${var.tag}-icmp"
  }
}

resource "aws_security_group" "ssh" {
  vpc_id      = "${var.vpc_id}"
  name        = "${var.tag}-ssh"
  description = "allow external ssh"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "${var.tag}-ssh"
  }
}

resource "aws_security_group" "http" {
  vpc_id      = "${var.vpc_id}"
  name        = "${var.tag}-http"
  description = "allow external http/https"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "${var.tag}-http"
  }
}
