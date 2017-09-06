# Monitoring

The monitoring aspect centralises the activation and collection of all logs and metrics into a central location.

## Logs

All the logs are configured and aggregated in a single template, the [analytics/logs-store](https://github.com/Bit-Clouded/Glenlivet/blob/master/analytics/logs-store.template) template

  - CloudWatch Logs
  - CloudConfig Snapshots
  - Application Load Balancer Logs
  - Elastic Load Balancer Logs
  - S3 Access Logs
  - CloudFront Access Logs
  - VPC Logs
  - Linux Syslog Logs
  - Linux Authlog Logs
  - Linux Docker Logs

## Metrics

  - Linux Memory Utilization

## CloudWatch Log Agent

For a number of logs and metrics, the [CloudWatch Log Agent](http://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/AgentReference.html) needs to be deployed. It is done using by associating the AWS State Management Document with the required instances. Thus it can be turned on/off and replaced if necessary.

The log agent is deployed as a docker container. The Dockerfile can be found [here](https://github.com/Bit-Clouded/Angostura/tree/master/utility/aws-cwl-agent). It is baked and [hosted on dockerhub](https://hub.docker.com/r/bitclouded/aws-cwl-agent/).

## Future Roadmap

  - Windows Event Logs
  - Windows Performance Counters
  - Linux /var/log/kern.log