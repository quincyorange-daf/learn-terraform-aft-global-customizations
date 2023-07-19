data "aws_iam_policy_document" "tag_itp_technical_service" {
  statement {
    sid    = "TagITPTechnicalService"
    effect = "Allow"

    actions = [
      "ec2:CreateInstances"
    ]

    resources = [
      "arn:aws:ec2:*:*:instance/*"
    ]

    condition {
      test     = "StringEquals"
      variable = "aws:ResourceTag/ITPTechnicalService"
      values   = [
        "ISS",
        "Storage and Virtualization",
        "Identity Infrastructure",
        "Software A",
        "Software B",
        "Service Centre",
        "Hybrid Cloud",
        "Analytics",
        "Workplace Technology",
        "Server Administration",
        "Application Hosting Linux",
        "Application Hosting Windows"
      ]
    }
  }
}

resource "aws_organizations_policy" "tag_itp_technical_service" {
  name        = "TagITPTechnicalService"
  description = "Allow certain EC2 instance types only."
  content     = data.aws_iam_policy_document.tag_itp_technical_service.json
}

resource "aws_organizations_policy_attachment" "tag_itp_technical_service_scp" {
  policy_id = aws_organizations_policy.tag_itp_technical_service.id
  target_id = "ou-gggb-0k7see5q"
}
