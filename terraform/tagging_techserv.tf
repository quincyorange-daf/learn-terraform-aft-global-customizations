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