# Create EKS cluster
resource "aws_eks_cluster" "my_cluster" {
  name     = "my-cluster"
  role_arn = "arn:aws:iam::993741443707:role/spacelift-main"
  tags = {
    Name = "demo-cluster"
  }

  vpc_config {
    subnet_ids = ["subnet-9f300116" ]
  }

}

#create node group 1
resource "aws_eks_node_group" "node_group_one" {
  cluster_name    = aws_eks_cluster.my_cluster.name
  node_group_name = "node-group-1"
  node_role_arn   = "arn:aws:iam::993741443707:role/spacelift-main"
  subnet_ids = ["subnet-9f300116" ]
  
  scaling_config {
    desired_size = 1
    max_size     = 2
    min_size     = 1
  }

  # Tag the nodes in the node group
  tags = {
    Name = "node-group-1"
  }
}
