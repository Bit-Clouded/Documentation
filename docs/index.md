# BitClouded Infrastructure Framework

Throughout the entire process of building this framework, for me, the founder of the project, the hardest part was the documentation. Capturing what this framework is, and what it is for. Thing is, I didn't set out to create a product. The framework started out as a set of tools for my job. However, as the standard gets higher and higher, the cost keeps increasing. Put simply, a solution need to be found in delivery infrastructure of highest quality, effeciently and economically. Thus, the product is born.

    As an Infrastructure Engineer

    I want 100% of infrastructure as code
    and that I want everything in source control
    and that I want to solve problems once
      (ever, in my life time)
    and that I want everything automated
      (scaling, backup, restore, security, etc)
    and that I want 0 external dependencies
    and that I want to prevent regression from best practices
      (immutable, serverless, server as herd not pets)

    So that what I build can be perfect
    and that I would have to do less work?....

And that's where the journey began. Funny thing is, the framework is still not perfect. Ammount of work I'm doing only have increased as I find more and more best practices and effecient technology to incorporate. So much so that I ended up deciding to run a company in order to build it properly.

And with the paradigm of "Infrastructure as Code" maybe I should open source it? Yeah let's do it.

    So that everyone's infrastructure can be perfect
    And that everyone can do less work

We'll get there, together, and at least we are far closer than anyone I know of.

## What Is It?

The Framework is comprised of 3 repositories:

  - CloudFormation Templates (codename: [Glenlivet](https://github.com/Bit-Clouded/Glenlivet))
  - Docker and Packer Definition Files (codename: [Angostura](https://github.com/Bit-Clouded/Angostura))
  - Lambda Functions (codename: [CitrusRind](https://github.com/Bit-Clouded/CitrusRind))

Between the four technologies, CloudFormation, Docker, Packer, and Lambda Functions, the project covers 100% of what is required for an AWS Infrastructure. For the ease of deployment, the output artifacts of these repositories are hosted publicly. However, you are more than welcome to fork the repositories and build and deploy everything internally.

The infrastructure is defined purely in CloudFormation templates. The defacto linux distro used for running binaries is usually Ubuntu LTS 16.04 base image provided by AWS baked using Hashicorp Packer. The binaries are all shipped in Docker containers. Lambda functions are used to here and there to glue things together.

## Getting Started

Easiest way to set up the infrastructure is via our automated provisioning platform. Please follow this [link](https://app.bitclouded.io/) to sign up and get started.

## Hosted Assets

Or altenatively you can find our hosted assets at following locations

  - Templates: https://s3.eu-west-1.amazonaws.com/prod-glenfiddichbase-publicbucket-7hoy9fpv4hb3/glenlivet/prod/&lt;template-path&gt;.template where template-path is "&lt;folder&gt;/&lt;template-name&gt;"
  - Lambdas: https://s3.&lt;region&gt;.amazonaws.com/glenfiddich-&lt;region&gt;/citrus-rind/prod/&lt;lambda-name&gt;.zip
  - Docker Images: https://hub.docker.com/r/bitclouded
  - AWS AMI:
    - ap-northeast-1: ami-0f32c769
    - ap-northeast-2: ami-0f459c61
    - ap-south-1: ami-b06c16df
    - ap-southeast-1: ami-31e57e52
    - ap-southeast-2: ami-d00811b3
    - ca-central-1: ami-99cb75fd
    - eu-central-1: ami-a6f950c9
    - eu-west-1: ami-f2ae588b
    - eu-west-2: ami-2cedfc48
    - sa-east-1: ami-0cc9bf60
    - us-east-1: ami-b38ba6c8
    - us-east-2: ami-4bb0902e
    - us-west-1: ami-00ae8560
    - us-west-2: ami-bd4fafc5

## Nitty Gritty Details

There's no better way to document deep technical details than to comment it aloneside the infrastructure code. All the templates are in yaml format, and where appropriate comments are added.

## More questions?

Visit our Gitter channel [here](https://gitter.im/BitCloudedGlenlivet). And if it's something we've missed, it'd be added to the documentation.