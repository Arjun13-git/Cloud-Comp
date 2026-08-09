# Cloud Computing & Security Laboratory

> **Sahyadri College of Engineering & Management (SCEM), Mangaluru**  
> Department of Computer Science & Engineering

A practical collection of **Cloud Computing and Security laboratory experiments**, documenting both the procedures from the laboratory manual and modern implementations adapted to current development environments.

The repository combines virtualization, Linux development, AWS EC2, Salesforce Apex, cloud simulation, and cloud-hosted web application deployment.

---

## 📚 Experiments

| No. | Experiment | Primary Technologies |
|:---:|---|---|
| **1** | [Installation of Virtualization Software](./Experiment_1_VirtualBox/) | VMware Workstation Pro, Virtualization, Linux |
| **2** | [Install a C Compiler in a Virtual Machine and Execute a Simple Program](./Experiment_2_C_Compiler/) | Ubuntu, GCC, C, VirtualBox |
| **3** | [Create EC2 Instance in AWS](./Experiment_3_EC2_Instance/) | AWS EC2, AMI, SSH, Key Pair |
| **4** | [Develop a Simple Application Using Apex](./Experiment_4_Salesforce_Apex/) | Salesforce, Apex, SOQL, DML |
| **6** | [Simulate a Cloud Scenario Using CloudSim](./Experiment_6_CloudSim/) | Java, CloudSim 3.0.3, IntelliJ IDEA, SJF |
| **8** | [Deploy Dynamic Web Application on EC2](./Experiment_8_EC2_Dynamic_Web_App/) | AWS EC2, Amazon Linux, Apache, HTML/CSS/JavaScript |

> **Repository note:** The experiment numbering follows the laboratory manual. The current repository contains Experiments **1, 2, 3, 4, 6, and 8**.

---

## 🗂️ Repository Structure

```text
Cloud-Comp/
│
├── Experiment_1_VirtualBox/
│   ├── README.md
│   └── images/
│
├── Experiment_2_C_Compiler/
│   ├── README.md
│   └── images/
│
├── Experiment_3_EC2_Instance/
│   ├── README.md
│   └── images/
│
├── Experiment_4_Salesforce_Apex/
│   ├── README.md
│   ├── images/
│   └── src/
│
├── Experiment_6_CloudSim/
│   └── README.md
│
├── Experiment_8_EC2_Dynamic_Web_App/
│   ├── README.md
│   ├── index.html
│   ├── .gitignore
│   └── images/
│
└── README.md
```

Each experiment has its own README containing the relevant **aim, objectives, procedure, implementation details, commands/code, results, and conclusion** where applicable.

---

# 🧪 Experiment Overview

## Experiment 1 — Installation of Virtualization Software

**Aim:**  
To install virtualization software and create virtual machines with different flavours of Linux or Windows operating systems.

The experiment introduces the fundamentals of virtualization, including the distinction between:

- Host operating system
- Guest operating system
- Virtual CPU
- Virtual RAM
- Virtual storage
- Virtual networking

The repository documents the original laboratory procedure and a modern implementation using **VMware Workstation Pro**.

➡️ **[Open Experiment 1 →](./Experiment_1_VirtualBox/)**

---

## Experiment 2 — C Compiler in a Virtual Machine

**Aim:**  
To install a C compiler in the virtual machine created using VirtualBox and execute a simple C program.

The experiment demonstrates the complete basic C development workflow:

```text
Ubuntu Virtual Machine
        ↓
Create C Source File
        ↓
GCC Compiler
        ↓
Compile Program
        ↓
Execute Program
        ↓
View Output
```

The modern implementation uses:

- Ubuntu Linux
- GCC
- C
- VirtualBox

➡️ **[Open Experiment 2 →](./Experiment_2_C_Compiler/)**

---

## Experiment 3 — Create an EC2 Instance in AWS

**Aim:**  
To create an EC2 instance in AWS (Amazon).

This experiment introduces **Amazon Elastic Compute Cloud (EC2)** and demonstrates the process of creating a virtual server in AWS.

The workflow covers:

```text
AWS Console
    ↓
EC2
    ↓
Launch Instance
    ↓
Select AMI
    ↓
Select Instance Type
    ↓
Create Key Pair
    ↓
Configure Storage
    ↓
Configure Network
    ↓
Launch
    ↓
Connect through SSH / EC2 Instance Connect
```

Important AWS concepts covered include:

- EC2 instances
- AMIs
- Instance types
- Key pairs
- Security groups
- EBS storage
- Public/private IP addressing
- SSH connectivity

➡️ **[Open Experiment 3 →](./Experiment_3_EC2_Instance/)**

---

## Experiment 4 — Salesforce Apex Application

**Aim:**  
To develop a simple custom application using the **Apex programming language** on the Salesforce cloud platform.

The experiment introduces Apex development through the Salesforce Developer Console.

The repository's implementation goes beyond a basic `HelloWorldApp` and demonstrates practical Salesforce data manipulation using:

- Apex classes
- Apex methods
- Salesforce objects
- SOQL
- DML
- Create
- Read
- Update
- Delete

The implementation includes the Apex source file:

```text
Experiment_4_Salesforce_Apex/src/ASRTechAccountManager.apxc
```

➡️ **[Open Experiment 4 →](./Experiment_4_Salesforce_Apex/)**

---

## Experiment 6 — CloudSim Scheduling Simulation

**Aim:**  
To simulate a cloud scenario using CloudSim and run a scheduling algorithm that is not present in CloudSim.

The experiment models a cloud environment containing:

```text
CloudSim
   ↓
Datacenter
   ↓
Host
   ↓
Virtual Machine
   ↓
Cloudlets
```

The modern implementation uses:

| Component | Implementation |
|---|---|
| Operating System | EndeavourOS Linux |
| IDE | IntelliJ IDEA |
| Programming Language | Java |
| Cloud Simulation | CloudSim 3.0.3 |
| Additional Library | Apache Commons Math |
| Scheduling Algorithm | Shortest Job First (SJF) |

The custom scheduling implementation orders cloudlets by computational length.

Example:

```text
Original order:
0 → 1 → 2 → 3

SJF order:
1 → 3 → 2 → 0
```

➡️ **[Open Experiment 6 →](./Experiment_6_CloudSim/)**

---

## Experiment 8 — Dynamic Web Application on AWS EC2

**Aim:**  
To deploy a dynamic web application on an EC2 instance on AWS.

This experiment combines AWS infrastructure with web-server deployment.

The deployment workflow is:

```text
AWS EC2
   ↓
Amazon Linux
   ↓
Apache HTTP Server
   ↓
/var/www/html/
   ↓
index.html
   ↓
Public IPv4 Address
   ↓
Web Browser
```

The repository contains a custom shopping application called **CloudCart** instead of simply using the original template from the laboratory manual.

### CloudCart features

- Responsive UI
- Product catalogue
- Product search
- Category filtering
- Product sorting
- Shopping cart
- Quantity controls
- Item removal
- Local storage persistence
- Simulated checkout
- Promo/deal interaction
- Toast notifications
- Mobile-friendly layout

The application is intentionally self-contained and can be served directly by Apache without a Node.js or frontend build system.

➡️ **[Open Experiment 8 →](./Experiment_8_EC2_Dynamic_Web_App/)**

---

# 🛠️ Technologies Used

### Virtualization

- VMware Workstation Pro
- Oracle VM VirtualBox
- Ubuntu Linux

### Programming

- C
- Java
- Apex
- HTML
- CSS
- JavaScript

### Cloud Platforms

- Amazon Web Services (AWS)
- Amazon EC2
- Salesforce

### Cloud Simulation

- CloudSim 3.0.3
- Apache Commons Math

### Web Server

- Apache HTTP Server (`httpd`)
- Amazon Linux

### Development Tools

- IntelliJ IDEA
- Eclipse
- Salesforce Developer Console
- GCC

---

# ☁️ Cloud Computing Concepts Covered

Across the experiments, the repository demonstrates several core cloud-computing concepts:

- Virtualization
- Virtual machines
- Cloud infrastructure
- Infrastructure as a Service (IaaS)
- Amazon EC2
- Amazon Machine Images (AMI)
- Cloud storage
- Security groups
- SSH authentication
- Cloud resource provisioning
- Virtual machines in simulated cloud environments
- Cloudlets and workload simulation
- Scheduling algorithms
- Cloud-hosted web applications
- Platform-based development using Salesforce

---

# 🔐 Security Practices

The repository follows a few important security practices when working with cloud resources.

### Never commit private keys

AWS private keys such as:

```text
*.pem
*.ppk
```

should never be committed to the repository.

### Never commit cloud credentials

Do not store:

```text
AWS access keys
AWS secret keys
Salesforce passwords
API tokens
Private credentials
```

inside source files or README files.

### Restrict network access

EC2 security-group rules should expose only the ports required by the application.

Typical laboratory web deployment ports include:

```text
22   SSH
80   HTTP
443  HTTPS
```

Production deployments should use appropriately restricted rules and HTTPS wherever applicable.

---

# 📖 Documentation Style

Each experiment is organized around two complementary parts where applicable:

### Part A — Laboratory Manual

Documents the original procedure supplied by the college laboratory manual, including the terminology and workflow used in the manual.

### Part B — Modern Implementation

Provides an updated implementation using current tools, operating systems, IDEs, libraries, or deployment approaches where appropriate.

This keeps the repository useful for both:

1. **Laboratory record/reference purposes**
2. **Actual hands-on implementation**

---

# 🚀 Getting Started

The experiments are independent, so you do **not** need to execute them in a single sequence.

Start with the experiment you want to perform:

```text
Experiment_1_VirtualBox/
Experiment_2_C_Compiler/
Experiment_3_EC2_Instance/
Experiment_4_Salesforce_Apex/
Experiment_6_CloudSim/
Experiment_8_EC2_Dynamic_Web_App/
```

Each directory contains its own detailed instructions.

### Recommended order for learning

If you are performing the experiments from scratch, the following order provides a sensible progression:

```text
1. Virtualization
       ↓
2. Linux + C development
       ↓
3. AWS EC2 fundamentals
       ↓
4. Salesforce cloud development
       ↓
6. Cloud simulation + scheduling
       ↓
8. EC2 web application deployment
```

---

# ⚠️ Important Notes

- Some procedures in the original laboratory manual use older software versions or interfaces.
- AWS and Salesforce interfaces can change over time.
- AWS pricing and free-tier eligibility can change; verify the current status in your AWS account before creating resources.
- CloudSim 3.0.3 is an older simulation toolkit, but it is retained for compatibility with the laboratory experiment.
- The modern implementation sections are intended to make the experiments practical with currently available development environments.
- Experiment-specific details should always be taken from the README inside that experiment's directory.

---

# 📌 Quick Navigation

| Experiment | Documentation |
|---|---|
| 1 — Virtualization | [README](./Experiment_1_VirtualBox/README.md) |
| 2 — C Compiler | [README](./Experiment_2_C_Compiler/README.md) |
| 3 — AWS EC2 | [README](./Experiment_3_EC2_Instance/README.md) |
| 4 — Salesforce Apex | [README](./Experiment_4_Salesforce_Apex/README.md) |
| 6 — CloudSim | [README](./Experiment_6_CloudSim/README.md) |
| 8 — EC2 Dynamic Web App | [README](./Experiment_8_EC2_Dynamic_Web_App/README.md) |

---

# 🎯 Learning Outcomes

After completing the documented experiments, you should have practical exposure to:

- Setting up and using virtual machines
- Working with Linux inside a virtualized environment
- Compiling and executing C programs
- Provisioning virtual servers in AWS
- Connecting to cloud instances securely
- Working with cloud storage and networking
- Developing Apex applications on Salesforce
- Performing database-style operations using SOQL and DML
- Simulating cloud infrastructure with CloudSim
- Implementing custom scheduling logic
- Installing and configuring an Apache web server
- Deploying a web application to an AWS EC2 instance
- Understanding the relationship between virtualization, cloud infrastructure, simulation, and application deployment

---

# 👨‍💻 Repository

**Cloud Computing & Security Laboratory**

Developed and documented as a practical laboratory repository for the **Computer Science & Engineering Department, Sahyadri College of Engineering & Management (SCEM), Mangaluru**.

---

## ⭐ Experiments at a Glance

```text
┌─────────────────────────────────────────────────────────────┐
│             CLOUD COMPUTING & SECURITY LAB                  │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  EXP 1  →  Virtualization                                  │
│           VMware / Virtual Machines                         │
│                                                             │
│  EXP 2  →  C Development                                    │
│           Ubuntu / GCC / C                                  │
│                                                             │
│  EXP 3  →  Cloud Infrastructure                             │
│           AWS EC2 / SSH / AMI                               │
│                                                             │
│  EXP 4  →  Cloud Application Development                    │
│           Salesforce / Apex / SOQL / DML                    │
│                                                             │
│  EXP 6  →  Cloud Simulation                                 │
│           CloudSim / Java / SJF                             │
│                                                             │
│  EXP 8  →  Cloud Application Deployment                     │
│           AWS EC2 / Apache / CloudCart                      │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

---

**Built for learning cloud computing by actually working with it — from virtual machines to cloud infrastructure to deployed applications.**
