# Security

The framework is designed to be secure by default.

## Network Level Security

The underlying network topology vaguely follows [AWS's set up here](http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_Scenario2.html). However, it's further enhanced for extra network segregation and availability. To sum up the network security at a high level

  - No servers have public IP address and are never publicy addressable.
  - All subnets have strict ACL set to allow outbound service ports and inbound [ephemeral data ports](http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_Appendix_NACLs.html)
  - No SSH or RDP ports are open by default to any address
  - All templates' security groups are dedicated per template and are designed with no inbound connection allowed other than HTTP(s) on the load balancer
  - All templates' security groups are designed to interlock each other and function across depending/dependant templates with 0 adjustments

## SSH Key Disabled

All templates are default to be provisioned with no SSH private keys. This is achived using a default value of empty string:

    Parameters:
      KeyPairName:
        Description: Name of an existing EC2 KeyPair to enable SSH access to the instances
        Type: String
        Default: ''

In conjunction with conditional logic:

    Conditions:
      HasNoKeypair: !Equals 
        - !Ref KeyPairName
        - ''

And

    Resources:
      SampleLaunchConfiguration:
        Type: 'AWS::AutoScaling::LaunchConfiguration'
        KeyName: !If 
          - HasNoKeypair
          - !Ref 'AWS::NoValue'
          - !Ref KeyPairName

By design, infrastructure should require minimal tempering and intervention. Syslog and Docker logs are shipped to a central CloudWatch Log stream. SSM Agents are deployed to [cover the rest of the operational needs](https://aws.amazon.com/blogs/aws/manage-instances-at-scale-without-ssh-access-using-ec2-run-command/).

As an absolute last resort, templates can be updated with SSH keys in the parameters and rotate the servers to allow access.

## Containerised Application

Everything runs in Docker. Docker containers provide [Kernel namespace and cgroup isolation](https://docs.docker.com/engine/security/security/) as well as [AppArmor integration on Ubuntu](https://docs.docker.com/engine/security/apparmor/). Should the application become compromised, it's limited to the scope of the application itself.

## AWS Inspector

Deployed as a modular aspect and deployed through SSM State Management Document as part of the [analytics/logs-store template](https://github.com/Bit-Clouded/Glenlivet/blob/master/analytics/logs-store.template#L662). All servers have [AWS Inspector](https://aws.amazon.com/inspector/) installed by default.

## SSL

All templates provide SSL Certificate ARN parameters by default. As soon as the Certificate ARN is filled, traffic is forced on to SSL.

## Transparency

Multiple logs are deployed by default with the framework for the purpose of transparency and auditing.

  - CloudTrail
  - Linux Authlog
  - S3 / CloudFront / Load Balancer Logs

## Future Roadmap

There's a number of exciting security features on our roadmap / actively researched on.

  - (Very soon) [KMS](https://aws.amazon.com/kms/) turned on for all native integrations; EBS, RDS, SQS
  - [LinuxKit](https://github.com/linuxkit/linuxkit), or an [alternative](http://rancher.com/rancher-os/) [minimal](https://www.ubuntu.com/desktop/snappy) [linux](https://www.projectatomic.io/) [distro](https://coreos.com/) that has reduced attack surface
  - [Notary](https://github.com/docker/notary)
  - [Hashicorp Vault](https://www.vaultproject.io/) for PKI and integration with RDS / IAM
  - [CoreOS Clair](https://github.com/coreos/clair)
  - [AWS Web Application Firewall]
  - Inverse server uptime monitoring. A.k.a dispose of server living longer than x configurable duration
  - [Open Source Honey Pots](https://github.com/paralax/awesome-honeypots)

Obviously no infrastructure can ever be too secure. There's a lot that's covered, and there's a lot more to cover.