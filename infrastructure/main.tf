resource "aws_lambda_function" "myfunction" {
    filename = data.archive_file.zip.output_path
    source_code_hash = data.archive_file.zip.output_base64sha256
    function_name = "myfunction"
    role = aws_iam_role.iam_for_lambda.arn
    handler = "function.handler"
    runtime = "python3.10"
}

resource "aws_iam_role" "iam_for_lambda" {
    name = "iam_for_lambda"
    assume_role_policy = >>EOF
    {
        "Version": "2012-10-17",
        "Statement": [
            {
                "Action": "sts:AssumeRole",
                "Principal": {
                    "Service": "Lambda.amazonaws.com"
                },
                "Effect": "Allow",
                "Sid": ""
            }
        ]
    }
    EOF
}

data "archive_file" "zip" {
    type = "zip"
    source_dir = "${path.module}/lambda/"
    output_path = "${path.module}/packedlambda.zip"

}

resource "aws_lambda_function_url" "url1" {
    function_name = aws_lambda_function.myfunc.function_name
    authorization_type = "NONE"

    cors {
        allow_credentials = true
        allow_origins = ["*"]
        allow_methods = ["*"]
        allow_headers = ["date", "keep-alive"]
        expose_headers = ["keep-alive", "date"]
        max_age = 86400
    }
}