# Operations

The framework focusses on automation at scale and reducing operational frictions.

## Immutable Infrastructure

The framework aims to achieve as much immutability as possible by using Launch Configuration and Autoscaling Group wherever possible. On top of that, all servers are running AMI prebaked with Docker and launching applications via Docker containers. This eliminates needs for extensive server mutation during the boot strap sequence.

Immutable infrastructure brings with it many advantages that are [very well understood](https://www.google.com.au/search?q=immutable+infrastructure)

  - Server as Cattles. Servers can easily be disposed of thanks to LC/ASG, and application can be reset by restarting Docker containers with AWS run command.
  - Operational Indepencence. Gone are the days of relying on package managers (aptitude, yum, pip, gem, the list goes on) to be reliably available when servers are being launched.
  - Malleable and Extensible. AMI and Docker Images can be reliably rebaked and extended. Rolling out changes is also an extremely simple afair by updating CloudFormation AMI / Docker Image parameters.
  - Automated Change Tracking. All images can be run on CI platforms such as Jenkins or Bamboo, and all rollouts and deployments are tracked through CloudTrail and CloudConfig.

## AWS SSM

The SSM is baked in as part of the base image and all the appropriate permissions for AWS Run Command and Document Association are set up and ready to go.

## Back Up and Restore

All templates resources that acts as datastores has the deletion policy set to automatically retain data; retain or snapshot where appropriate. The relevant templates also has snapshot parameter built in to automatically restore from these snapshots.

## Easy Provisioning

Resources have names, where possible, generated on the fly in the format of StackName-LogicalId-RandomSuffix. This is to avoid resource name clashing when provisioning multiple instances of the same template.

Almost all of templates parameters are either derived from other template resources / parameters / outputs or are populated with sensible defaults. This is to reduce friction in provisioning new stacks.

## Reliable Server Launching

Servers are bootstrapped using only userdata and docker run commands. Everything is configured and baked as docker images and brought in as containers. Cfn-init is considered completely redundant and produce the following undesirable attributes:

  - Increased launch time
  - Decreased launch reliability
  - Increased moving parts; linux package manager, python and cfn-init
  - Not truly immutable servers as there's chance each servers are different.

All autoscaling groups + launch configuration pairs have the appropraite creation and update policy. This is to ensure new servers launched have been bootstrapped correctly. In conjunction with unmutated servers and containers the servers can be truly considered immutable.

## Future Roadmap

  - Tags propagation for RDS and EBS snapshot
  - Centralised relevant alerting
  - Cloudwatch Event capture and further automation; RDS snapshot cross region copy
  - Automatic server rotation to ensure servers do not stay around too long and introduce state mutation.
  - Automatic S3 restore.