data "aws_iam_policy_document" "pd" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "pk" {
  name               = "pk-iam-role-s3"
  assume_role_policy = "${data.aws_iam_policy_document.pd.json}"
}

resource "aws_iam_instance_profile" "prakash_profile" {
  name = "test_profile"
  role = "${aws_iam_role.pk.name}"
}

resource "aws_iam_policy" "prakash_policy" {
  name        = "prakash_policy"
  description = "My test policy"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "s3:*"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}

resource "aws_iam_policy_attachment" "policy_test_attach" {
  name       = "prakash-test"
  roles      = ["${aws_iam_role.pk.name}"]
  policy_arn = "${aws_iam_policy.prakash_policy.arn}"
}
