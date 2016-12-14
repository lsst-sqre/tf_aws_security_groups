output "internal_id" {
  value = "${aws_security_group.internal.id}"
}

output "out_id" {
  value = "${aws_security_group.out.id}"
}

output "icmp_id" {
  value = "${aws_security_group.icmp.id}"
}

output "ssh_id" {
  value = "${aws_security_group.ssh.id}"
}

output "http_id" {
  value = "${aws_security_group.http.id}"
}
