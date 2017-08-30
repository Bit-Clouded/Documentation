# BitClouded Infrastructure Framework

Throughout the entire process of building this framework, for me, the founder of the project, the hardest part was the documentation. Capturing what this framework is, and what it is for. Thing is, I didn't set out to create a product. The framework started out as a set of tools for my job. I like to do things well, and I can't in good conscience make my employer pay for the last 10% of quality that they don't need. Essentially:

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

And that's where the journey began. Funny thing is, the framework is still not perfect. Ammount of work I'm doing only have increased as I find more and more best practices and effecient technology to incorporate that I ended up deciding to run a company in order to build it properly.... Oh well.

And with the paradigm of "Infrastructure as Code" maybe I should open source it? Yeah let's do it.

    So that everyone's infrastructure can be perfect
    And that everyone can do less work

We'll get there, together, and at least what I know is we are far closer than anyone I know of.

## What Is It?

The Framework is comprised of 3 repositories:

  - CloudFormation Templates (codename: [Glenlivet](https://github.com/Bit-Clouded/Glenlivet))
  - Docker and Packer Definition Files (codename: [Angostura](https://github.com/Bit-Clouded/Angostura))
  - Lambda Functions (codename: [CitrusRind](https://github.com/Bit-Clouded/CitrusRind))

Between the four technologies, CloudFormation, Docker, Packer, and Lambda Functions, the project covers 100% of what is required for an AWS Infrastructure. For the ease of deployment, the output artifacts of these repositories are hosted publicly. However, you are more than welcome to fork the repositories and build and deploy everything internally.

The infrastructure is defined purely in CloudFormation templates. The defacto linux distro used for running binaries is usually Ubuntu LTS 16.04 base image provided by AWS baked using Hashicorp Packer. The binaries are all shipped in Docker containers. Lambda functions are used to here and there to glue things together.

## Getting Started

Easiest way to set up the infrastructure is via our automated provisioning platform. Please follow this [link](https://app.bitclouded.io/) to sign up and get started.