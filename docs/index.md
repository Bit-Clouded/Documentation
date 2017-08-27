# BitClouded Infrastructure

## What Is It?

Taking the principle of Infrastructure as Code, we have pushed it to encapsulate 100% of the infrastructure, as opposed to pieces where its convenient. What we have now is an infrastructure framework that is modular, extensible and coherent. Currently the components include:

  - CloudFormation Templates (codename: [Glenlivet](https://github.com/Bit-Clouded/Glenlivet))
  - Docker Definition Files (codename: [Angostura](https://github.com/Bit-Clouded/Angostura))
  - Packer Definition Files (codename: [CitrusRind](https://github.com/Bit-Clouded/CitrusRind))

Built into it are all the best practices when it comes to infrastructure and platform designs; high availability, centralised logging, immutable infrastructure, the list goes on.

We also believe in sharing and collaboration and thus everything is open sourced. Everyone's all too familiar with the advantage of leveraging an open source framework so I won't go on. It is also backed with a provisioning platform and professional services.


## Number of Quick Start and Best Practices ticked off

  - [CloudWatch Log Agents](http://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/QuickStartEC2Instance.html)
  - [CloudTrail](http://docs.aws.amazon.com/awscloudtrail/latest/userguide/cloudtrail-getting-started.html)
  - [SSM Agent](http://docs.aws.amazon.com/systems-manager/latest/userguide/ssm-agent.html)
  - [Enabling VPC Logs](http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/flow-logs.html)