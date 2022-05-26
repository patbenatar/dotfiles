#!/bin/bash

if [ -z "$ECS_EXEC_CLUSTER" ]; then
  echo "Set ECS_EXEC_CLUSTER and try again"
  exit 1
fi

if [ -z "$ECS_EXEC_SERVICE" ]; then
  echo "Set ECS_EXEC_SERVICE and try again"
  exit 1
fi

task_arn=$(aws ecs list-tasks --cluster $ECS_EXEC_CLUSTER --service-name $ECS_EXEC_SERVICE --profile mfa --region us-east-1 | jq -r ".taskArns[0]")
echo "Running rails console on $task_arn"

aws ecs execute-command --cluster $ECS_EXEC_CLUSTER --task $task_arn --container app --interactive --command "rails c" --profile mfa --region us-east-1

exit 0
