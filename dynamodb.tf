provider "aws" {
  region = "us-east-1"
}

resource "aws_dynamodb_table" "product_table" {
  name           = "ProductTable"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "ProductId"
  range_key      = "Price"

  attribute {
    name = "ProductId"
    type = "S"
  }

  attribute {
    name = "Price"
    type = "N"
  }

  tags = {
    Name = "ProductTable"
  }
}

resource "aws_dynamodb_table_item" "example_item" {
  table_name = aws_dynamodb_table.product_table.name

  hash_key  = "ProductId"
  range_key = "Price"

  item = <<ITEM
  {
    "ProductId": {"S": "product123"},
    "Price": {"N": "99.99"},
    "Description": {"S": "Example product description"}
  }
  ITEM
}
