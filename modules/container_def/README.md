# Fargate Task Definition Module

Stolen from: [cloudposse](https://github.com/cloudposse/terraform-aws-ecs-container-definition)

## Port mappings

```(terraform)
port_mappings = [
    {
      containerPort = 8080
      hostPort      = 80
      protocol      = "tcp"
    },
    {
      containerPort = 8081
      hostPort      = 443
      protocol      = "udp"
    }
  ]
```

## Environment Variables

### File

```(terraform)
environment_files = [
    {
      value = "arn:aws:s3:::s3_bucket_name/envfile_01.env"
      type  = "s3"
    },
    {
      value = "arn:aws:s3:::s3_bucket_name/another_envfile.env"
      type  = "s3"
    }
  ]
```

### String

```(terraform)
environment = [
    {
      name  = "string_var"
      value = "123"
    },
    {
      name  = "another_string_var"
      value = "true"
    },
    {
      name  = "yet_another_string_var"
      value = "false"
    },
    {
      name  = "false_boolean_var"
      value = false
    },
    {
      name  = "integer_var"
      value = 42
    }
  ]
```

