# Klaster ECS
resource "aws_ecs_cluster" "main" {
  name = "tk_main-cluster"
}

# Definicja zadania ECS
resource "aws_ecs_task_definition" "app_task" {
  family                   = "tk_app-task-family"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "256"
  memory                   = "512"

  container_definitions = jsonencode([
    {
      name      = "tk_my-app-container"
      image     = aws_ecr_repository.app_repo.repository_url
      essential = true
      portMappings = [
        {
          containerPort = 80
          hostPort      = 80
        }
      ]
    }
  ])
}

# Usługa ECS
resource "aws_ecs_service" "app_service" {
  name            = "tk_app-service"
  cluster         = aws_ecs_cluster.main.id
  task_definition = aws_ecs_task_definition.app_task.arn
  desired_count   = 1
  launch_type     = "FARGATE"

  network_configuration {
    subnets         = [aws_subnet.public.id]
    security_groups = [aws_security_group.ecs_sg.id]
    assign_public_ip = true
  }
}