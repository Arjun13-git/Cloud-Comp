# Experiment 2: Install a C Compiler in a Virtual Machine and Execute a Simple Program

## Aim

To install a C compiler in the virtual machine created using VirtualBox and execute a simple C program.

---

## Objectives

- To understand how a Linux virtual machine can be used as a development environment.
- To use a C compiler inside the virtual machine.
- To create a C source file.
- To compile the C source file.
- To execute the generated program.
- To understand the basic workflow of compiling and executing a C program.

---

# Part A — Procedure from the Laboratory Manual

> **Note:** The original laboratory manual uses an older Ubuntu virtual appliance named `ubuntu_gt6.ova`, Oracle VM VirtualBox, `gedit`, and a legacy directory associated with Axis2. This section documents the procedure as given in the laboratory manual.

## Software Used

- Oracle VM VirtualBox
- Ubuntu virtual machine
- `ubuntu_gt6.ova`
- GCC C compiler
- `gedit` text editor

---

## 1. Import the Ubuntu Virtual Machine

### Step 1: Open VirtualBox

Open **Oracle VM VirtualBox** on the host computer.

![Import Ubuntu Appliance](images/step-01-import-ubuntu-appliance.png)

### Step 2: Import the Appliance

From the VirtualBox menu, select:

**File → Import Appliance**

The Import Appliance window will be displayed.

### Step 3: Select the Ubuntu Appliance

Browse to the location of the virtual appliance file:

```text
ubuntu_gt6.ova
```

Select the file and proceed with the import.

### Step 4: Configure USB

Open the settings of the imported virtual machine.

Navigate to the USB settings and select:

```text
USB 1.1
```

This setting is part of the original laboratory setup.

### Step 5: Start the Virtual Machine

Start the imported virtual machine:

```text
ubuntu_gt6
```

Wait for Ubuntu to boot successfully.

---

## 2. Compile and Execute a C Program

### Step 1: Open the Terminal

Open a terminal inside the Ubuntu virtual machine.

### Step 2: Navigate to the Required Directory

The laboratory manual specifies the following directory:

```bash
cd /opt/axis2/axis2-1.7.3/bin
```

Press **Enter**.

> **Note:** This directory is specific to the software environment used by the original laboratory setup. It is not a requirement of GCC itself.

### Step 3: Create the C Source File

Create a C source file using `gedit`:

```bash
gedit hello.c
```

Enter the required C program and save the file.

### Step 4: Compile the Program

Compile the source file using GCC:

```bash
gcc hello.c
```

If compilation is successful, GCC generates the default executable:

```text
a.out
```

### Step 5: Execute the Program

Run the generated executable:

```bash
./a.out
```

The output of the C program is displayed in the terminal.

---

## 3. Create the `first.c` Program

The laboratory manual also demonstrates creating another C source file.

Open the editor:

```bash
gedit first.c
```

![Creating first.c](images/step-02-create-c-program.png)

Enter the C program provided in the laboratory manual and save the file.

![C Program](images/step-03-c-program.png)

Compile the program:

```bash
gcc first.c
```

Execute the generated program:

```bash
./a.out
```

---

## Result — Part A

The C compiler was used inside the Ubuntu virtual machine to compile and execute a C program successfully.

---

# Part B — Modern Implementation

## Objective

The same learning outcome can be achieved using a current virtualization platform and a modern Linux distribution.

For this implementation:

- **VMware Workstation Pro** is used as the virtualization platform on Windows.
- **Ubuntu Linux** is used as the guest operating system.
- **GCC** is used as the C compiler.

The modern procedure does not require the legacy `ubuntu_gt6.ova` appliance, Axis2 directory, or `gedit`.

---

## Modern Software Stack

| Component | Modern Implementation |
|---|---|
| Host Operating System | Windows 10 / Windows 11 |
| Virtualization Platform | VMware Workstation Pro |
| Guest Operating System | Ubuntu Linux |
| Compiler | GCC |
| Editor | Nano / VS Code / Vim |
| Network | NAT |

---

## 1. Install VMware Workstation Pro

Download and install the current supported version of **VMware Workstation Pro** on the Windows host.

After installation, launch VMware Workstation Pro.

---

## 2. Obtain an Ubuntu ISO

Download a current Ubuntu Desktop ISO from the official Ubuntu website.

The ISO image will be used as the installation media for the virtual machine.

---

## 3. Create a New Virtual Machine

In VMware Workstation Pro:

1. Select **Create a New Virtual Machine**.
2. Select **Typical (recommended)**.
3. Select the downloaded Ubuntu ISO image.
4. Specify a name and location for the virtual machine.
5. Configure the virtual hardware.
6. Finish the virtual machine creation wizard.

A suitable configuration for a laboratory virtual machine is:

```text
Guest OS : Ubuntu Linux
CPU      : 2 virtual cores
RAM      : 4 GB
Storage  : 25–30 GB
Network  : NAT
```

The exact allocation can be adjusted according to the host system's available resources.

---

## 4. Install Ubuntu

Start the newly created virtual machine.

Ubuntu will boot from the ISO image and display its installation wizard.

Follow the installation process to:

1. Select the language.
2. Select the keyboard layout.
3. Configure the installation.
4. Create a user account.
5. Configure the password.
6. Install Ubuntu.
7. Restart the virtual machine.

After restarting, log in to the installed Ubuntu system.

---

## 5. Install and Verify GCC

Open a terminal inside the Ubuntu virtual machine.

First check whether GCC is already installed:

```bash
gcc --version
```

If GCC is not installed, update the package index:

```bash
sudo apt update
```

Install the basic C/C++ development tools:

```bash
sudo apt install build-essential
```

Verify the installation:

```bash
gcc --version
```

A GCC version number should be displayed.

---

## 6. Create a C Program

Create a directory for the experiment:

```bash
mkdir -p ~/c-programs
cd ~/c-programs
```

Create a source file:

```bash
nano hello.c
```

Enter the following program:

```c
#include <stdio.h>

int main(void)
{
    printf("Hello from C inside a virtual machine!\n");
    return 0;
}
```

Save the file and exit the editor.

---

## 7. Compile the C Program

Compile the source file using GCC:

```bash
gcc hello.c -o hello
```

Here:

- `gcc` invokes the C compiler.
- `hello.c` is the input source file.
- `-o hello` specifies the name of the output executable.

If compilation is successful, an executable named `hello` is created.

Verify the files:

```bash
ls
```

Expected files include:

```text
hello
hello.c
```

---

## 8. Execute the Program

Run the compiled program:

```bash
./hello
```

Expected output:

```text
Hello from C inside a virtual machine!
```

---

## 9. Compile Using the Default Output Name

GCC can also be used in the same form shown in the original laboratory manual:

```bash
gcc hello.c
```

This produces the default executable:

```text
a.out
```

Execute it using:

```bash
./a.out
```

This demonstrates the same basic compilation and execution workflow used in the original experiment.

---

# Comparison: Original vs Modern Implementation

| Component | Original Laboratory Manual | Modern Implementation |
|---|---|---|
| Virtualization software | Oracle VM VirtualBox | VMware Workstation Pro |
| Guest OS | `ubuntu_gt6.ova` | Current Ubuntu Linux ISO |
| Host environment | Windows | Windows 10 / 11 |
| C compiler | GCC | GCC |
| Text editor | `gedit` | Nano / VS Code / Vim |
| Source directory | `/opt/axis2/axis2-1.7.3/bin` | `~/c-programs` |
| Compilation | `gcc hello.c` | `gcc hello.c -o hello` |
| Default executable | `a.out` | `hello` or `a.out` |
| Virtual machine setup | Import OVA appliance | Create VM from ISO |

---

# Important Commands

### Check GCC

```bash
gcc --version
```

### Install GCC and development tools on Ubuntu

```bash
sudo apt update
sudo apt install build-essential
```

### Compile with a named executable

```bash
gcc hello.c -o hello
```

### Execute

```bash
./hello
```

### Compile with GCC's default output name

```bash
gcc hello.c
```

### Execute the default output

```bash
./a.out
```

---

# Key Concepts

## Virtual Machine

A virtual machine is a software-defined computer that runs as a guest environment on a physical host system.

A virtual machine can have its own:

- CPU allocation
- RAM
- Virtual storage
- Network interface
- Operating system

## Guest Operating System

The operating system running inside the virtual machine.

Example:

```text
Ubuntu Linux
```

## GCC

GCC stands for **GNU Compiler Collection**.

For C programming, GCC converts C source code into an executable program.

The basic workflow is:

```text
C Source Code
      |
      v
     GCC
      |
      v
Executable Program
```

## Compilation

Compilation converts source code such as:

```text
hello.c
```

into executable machine code.

Example:

```bash
gcc hello.c -o hello
```

## Execution

The compiled program can be executed from the terminal:

```bash
./hello
```

---

# Advantages of Using a Virtual Machine

1. Multiple operating systems can run on a single physical computer.
2. A separate Linux development environment can be created without replacing the host operating system.
3. Software can be tested in an isolated environment.
4. Virtual machine configurations can be reproduced easily.
5. Different development environments can coexist on the same computer.

---

# Result

A C compiler was installed and used inside a Linux virtual machine.

A C source program was created, compiled using GCC, and executed successfully.

---

# Conclusion

This experiment demonstrates how a virtual machine can provide an isolated Linux environment for C programming.

The original laboratory procedure uses an older VirtualBox and Ubuntu appliance workflow. The modern implementation achieves the same objective using VMware Workstation Pro, Ubuntu Linux, and GCC with a current ISO-based virtual machine setup.

---

# References

1. Cloud Computing and Security Laboratory Manual, Department of Computer Science & Engineering, Sahyadri College of Engineering & Management, Mangaluru.
2. GNU Compiler Collection (GCC) documentation.
3. Ubuntu documentation.
4. VMware Workstation Pro documentation.
