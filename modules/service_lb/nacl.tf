resource "aws_network_acl_rule" "client" {
  count          = length(var.client_access_ips) * local.firewall_enabled
  network_acl_id = tolist(data.aws_network_acls.proxy[0].ids)[0]
  rule_number    = 1000 + count.index
  egress         = false
  protocol       = "tcp"
  rule_action    = "allow"
  cidr_block     = var.client_access_ips[count.index]
  from_port      = 443
  to_port        = 443
}

resource "aws_network_acl_rule" "ohpen" {
  count          = length(var.ohpen_access_ips) * local.firewall_enabled
  network_acl_id = tolist(data.aws_network_acls.proxy[0].ids)[0]
  rule_number    = 1100 + count.index
  egress         = false
  protocol       = -1
  rule_action    = "allow"
  cidr_block     = var.ohpen_access_ips[count.index]
}
