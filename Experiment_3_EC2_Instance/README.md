# Experiment 3: Create EC2 Instance in AWS (Amazon)

## Aim

To create an EC2 instance in AWS (Amazon).

---

## Introduction

Amazon Elastic Compute Cloud (Amazon EC2) provides virtual computing resources in the AWS Cloud. An EC2 instance can be created by selecting an operating system image, instance type, storage, and networking configuration.

This experiment demonstrates the basic procedure for creating an EC2 instance and connecting to the instance using an SSH key.

> **Note:** Part A follows the procedure and screenshots from the laboratory manual. The screenshots are retained as reference material because the AWS Management Console shown in the manual is from an older interface. Part B describes the corresponding modern workflow.

---

# Part A — Procedure from the Laboratory Manual

## Software / Service Used

- Amazon Web Services (AWS)
- Amazon EC2
- AWS Management Console
- SSH
- EC2 key pair (`.pem`)

---

## Step 1: Log in to AWS and Open EC2

1. Log in to your AWS account.
2. Open the **Services** menu from the AWS Management Console.
3. Under the available services, select **EC2**.
4. From the EC2 dashboard, the running instances can be viewed under the resources section.

![AWS Services and EC2](images/01-aws-services-ec2.png)

The EC2 dashboard is used to create and manage virtual servers in AWS.

---

## Step 2: Launch an Instance

1. From the EC2 console, click **Launch instance**.
2. The **Launch an instance** page is displayed.
3. Configure the required options for the new instance.
4. Enter a suitable name for the instance.

The laboratory manual shows the **Name and tags** section of the launch page.

![Launch an Instance](images/02-launch-instance.png)

---

## Step 3: Select an AMI

Select the required **AMI (Amazon Machine Image)** according to the operating system required for the experiment.

The manual shows several operating-system choices, including:

- Amazon Linux
- macOS
- Ubuntu
- Windows
- Red Hat

Select the required operating system from the available AMIs.

![Select AMI](images/03-select-ami.png)

An AMI acts as a template containing the operating system and initial software configuration used to launch an EC2 instance.

---

## Step 4: Select the Instance Type and Create a Key Pair

The laboratory manual specifies the following instance type:

```text
t2.micro
```

The manual describes `t2.micro` as a Free Tier-eligible instance type for eligible accounts.

The instance type determines the computing resources allocated to the EC2 instance, including CPU and memory.

> **Important:** The AWS Free Tier rules and eligible instance types can change over time. The `t2.micro` configuration here is the configuration specified by the laboratory manual and should not be treated as a guarantee of current Free Tier eligibility.

### Create a Key Pair

The manual shows the **Create key pair** dialog.

A key pair is used to securely connect to the EC2 instance.

The private key is downloaded to the local computer. The manual shows the `.pem` format for the private key.

![Create Key Pair](images/04-create-key-pair.png)

### Important Security Note

The private key must be kept secure.

Never upload an EC2 private key to GitHub.

For example, files such as:

```text
*.pem
*.ppk
```

should never be committed to this repository.

---

## Step 5: Configure Network and Storage

Keep the network settings at their default values unless changes are required.

The laboratory manual also specifies the storage configuration shown in the figure:

```text
Storage: 30 GB
Volume type: gp2
Volume: Root volume
```

![Configure Storage](images/05-configure-storage.png)

The manual states that Free Tier-eligible customers can receive up to 30 GB of EBS storage under the conditions applicable to the account at the time the manual was written.

> **Note:** AWS storage options, pricing, and Free Tier eligibility may differ from those shown in the older manual.

---

## Step 6: Launch the Instance

Before launching the instance:

1. Check the selected operating system.
2. Check the instance type.
3. Verify the key pair.
4. Verify the network configuration.
5. Verify the storage configuration.
6. Check whether the selected resources are eligible for the applicable Free Tier.

Click:

**Launch instance**

The EC2 instance is then created.

---

# Connecting to the EC2 Instance Using an SSH Key

After the instance has been created, the laboratory manual provides the following procedure for connecting to it.

---

## Step 1: Select the EC2 Instance and Click Connect

From the EC2 **Instances** page:

1. Select the server / EC2 instance.
2. Click the **Connect** button at the top of the page.

The manual shows the selected running instance and the **Connect** button.

![Select Instance and Connect](images/06-select-instance-connect.png)

---

## Step 2: Obtain the SSH Connection Information

The **Connect to instance** page provides connection information for the selected EC2 instance.

The laboratory manual instructs the user to use the SSH key / key-pair information provided for connecting to the EC2 instance.

![Connect to Instance - SSH Client](images/07-connect-instance-ssh.png)

The SSH connection details include the information required to establish a remote terminal session with the instance.

---

## Step 3: Connect from the Terminal

Open a terminal on the local computer.

Navigate to the directory where the `.pem` private key is stored.

The manual demonstrates using the SSH connection information in the terminal to connect to the EC2 instance.

A typical SSH command has the following form:

```bash
ssh -i "key-name.pem" username@public-ip-address
```

The exact username depends on the operating system / AMI selected for the EC2 instance.

The manual's final screenshot shows the terminal after the SSH connection has been established.

![SSH Terminal Connection](images/08-ssh-terminal.png)

---

## Result — Part A

An EC2 instance was created in Amazon Web Services by selecting an operating system image, instance type, key pair, network configuration, and storage.

The EC2 instance was then accessed remotely using an SSH key.

---

# Part B — Modern Implementation

The AWS console shown in the laboratory manual is based on an older interface. The same experiment can be performed using the current AWS EC2 console.

The fundamental workflow remains:

```text
AWS Management Console
        ↓
EC2
        ↓
Launch instance
        ↓
Select AMI
        ↓
Select instance type
        ↓
Create / select key pair
        ↓
Configure networking
        ↓
Configure storage
        ↓
Launch instance
        ↓
Connect to instance
```

No screenshots are included in Part B because this section is the modernized procedure.

---

## Step 1: Open Amazon EC2

1. Sign in to the AWS Management Console.
2. Open the **EC2** service.
3. Select **Instances**.
4. Click **Launch instance**.

---

## Step 2: Configure the Instance Name

Under **Name and tags**, enter a descriptive name.

For example:

```text
cloud-comp-experiment-3
```

---

## Step 3: Select an AMI

Under **Application and OS Images**, select a suitable AMI.

For a basic Linux virtual server, an official Amazon Linux or Ubuntu AMI can be selected.

The AMI determines the operating system and initial software environment of the instance.

---

## Step 4: Select an Instance Type

Select a small instance type suitable for the experiment.

The original manual specifies:

```text
t2.micro
```

However, the available instance types and Free Tier rules have changed over time.

Therefore, when performing this experiment today:

1. Check the instance types available in the selected AWS Region.
2. Check the Free Tier eligibility for the AWS account.
3. Select an appropriate small instance type.
4. Avoid selecting a resource that may generate unexpected charges.

---

## Step 5: Create or Select a Key Pair

Create a new key pair or select an existing key pair.

For an SSH connection, an OpenSSH-compatible private key such as a `.pem` file can be used.

Store the private key securely.

On Linux, the key can be given restrictive permissions with:

```bash
chmod 400 key-name.pem
```

Never upload the private key to GitHub.

---

## Step 6: Configure Network Settings

Review the following settings:

- VPC
- Subnet
- Auto-assign public IP
- Security group
- Inbound rules

For a basic laboratory instance, the default VPC configuration can be used when appropriate.

For SSH access, TCP port `22` must be permitted by the security group.

Only allow the network access required for the experiment.

---

## Step 7: Configure Storage

Review the root EBS volume.

The exact volume type and available options may differ from the `30 GB gp2` configuration shown in the laboratory manual.

Choose an appropriate storage configuration for the experiment and review the associated cost information.

---

## Step 8: Review and Launch

Before launching, verify:

```text
Instance name
AMI
Instance type
Key pair
VPC
Subnet
Security group
Storage
```

Click:

**Launch instance**

Wait for the instance to reach the:

```text
Running
```

state.

---

## Step 9: Connect to the Instance

Select the running instance and click:

**Connect**

Depending on the current configuration, AWS may provide connection options such as:

- EC2 Instance Connect
- SSH client
- AWS Systems Manager

For an SSH connection, use the private key associated with the instance.

Example:

```bash
ssh -i "key-name.pem" username@public-ip-address
```

The exact username depends on the AMI.

---

## Step 10: Verify the Connection

After connecting to the EC2 instance, basic system information can be checked.

For a Linux instance:

```bash
uname -a
```

and:

```bash
cat /etc/os-release
```

These commands verify that the terminal session is running on the remote EC2 instance.

---

## Step 11: Clean Up the Instance

If the EC2 instance was created only for laboratory work, terminate it after completing the experiment.

From the EC2 console:

```text
Instances
    ↓
Select the instance
    ↓
Instance state
    ↓
Terminate instance
```

Also check for other resources that may have been created during the experiment.

This is important because AWS resources can incur charges depending on the account, region, resource type, and applicable Free Tier benefits.

---

# Comparison: Original Manual vs Modern Implementation

| Component | Original Laboratory Manual | Modern Implementation |
|---|---|---|
| Cloud provider | Amazon Web Services | Amazon Web Services |
| Service | EC2 | EC2 |
| Console | Older AWS Management Console | Current AWS Management Console |
| AMI | Select required OS | Select current supported AMI |
| Instance type | `t2.micro` | Current suitable instance type |
| Key pair | `.pem` | Current supported SSH key |
| Networking | Default settings | VPC, subnet and security group |
| Storage | 30 GB `gp2` | Current EBS configuration |
| Connection | SSH key | SSH / EC2 Instance Connect / other supported method |
| Cleanup | Not emphasized | Stop/terminate unused resources |

---

# Key Concepts

## Amazon EC2

Amazon Elastic Compute Cloud (EC2) provides virtual computing capacity in the AWS Cloud.

An EC2 instance functions as a virtual server that can run an operating system and applications.

## Amazon Machine Image (AMI)

An AMI is a template used to launch an EC2 instance.

It provides the operating system and initial software configuration for the instance.

## Instance Type

The instance type determines the computing resources assigned to an EC2 instance, including CPU and memory characteristics.

## Key Pair

An EC2 key pair provides a mechanism for securely authenticating to an instance.

The private key must remain with the user and must be protected from unauthorized access.

## Security Group

A security group controls network traffic to and from an EC2 instance and acts as a virtual firewall.

## Amazon EBS

Amazon Elastic Block Store (EBS) provides block-level storage for EC2 instances.

---

# Important Security and Cost Considerations

### Protect private keys

Never commit private keys to GitHub.

Add the following to `.gitignore` when working with EC2 keys:

```gitignore
*.pem
*.ppk
```

### Restrict SSH access

SSH access should be restricted to the required source IP addresses whenever possible.

Avoid unnecessarily exposing SSH to the entire Internet.

### Check Free Tier eligibility

The laboratory manual refers to Free Tier eligibility for its configuration. AWS Free Tier terms, limits, and eligible resources can change.

Always check the current AWS console and account eligibility before launching resources.

### Terminate temporary resources

Terminate an EC2 instance when it is no longer required for the experiment and verify that unnecessary associated resources have also been removed.

---

# Conclusion

The experiment demonstrates the creation of a virtual server using Amazon EC2.

An EC2 instance is created by selecting an AMI, instance type, key pair, network configuration, and storage. The instance can then be accessed remotely using an SSH connection.

The original laboratory procedure is documented in Part A, while Part B provides the corresponding modern workflow using the current AWS EC2 environment.
