/*data "aws_eip" "by_allocation_id" {
  id = "eipalloc-0655f1ffa6c031052"
}*/
resource "aws_eip" "eip" {
  instance = aws_instance.VM1.id
  vpc      = true
}