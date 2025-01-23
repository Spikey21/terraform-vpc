resource "aws_key_pair" "terrakey" {
  key_name   = "terra-key-2"
  public_key = file(".ssh/terra-key.pub")
}
