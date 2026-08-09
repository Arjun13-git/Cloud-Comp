# Experiment 6: Simulate a Cloud Scenario Using CloudSim and Run a Scheduling Algorithm That Is Not Present in CloudSim

## Aim

To simulate a cloud scenario using CloudSim and run a scheduling algorithm that is not present in CloudSim.

---

## Objectives

- To understand the basic concepts of cloud computing simulation.
- To understand the architecture and working of CloudSim.
- To initialize the CloudSim simulation environment.
- To create a datacenter and hosts.
- To create virtual machines (VMs).
- To create and submit cloudlets.
- To understand CloudSim scheduling mechanisms.
- To implement a scheduling algorithm that is not directly available in CloudSim.
- To execute the simulation and analyze the cloudlet execution results.

---

# Part A — Procedure from the Laboratory Manual

> **Note:** This section follows the procedure given in the SCEM Cloud Computing and Security laboratory manual. The original laboratory procedure uses Eclipse and the CloudSim toolkit.

## Software / Platform Used

- Java
- Eclipse IDE
- CloudSim

---

## Step 1: Download CloudSim

Download the CloudSim installable files and extract the downloaded archive.

The laboratory manual refers to the CloudSim download page:

```text
https://code.google.com/p/cloudsim/downloads/list
```

> **Note:** This is the older download location specified by the laboratory manual.

---

## Step 2: Open Eclipse

Open the Eclipse IDE.

---

## Step 3: Create a Java Project

Create a new Java project using:

```text
File → New → Java Project
```

---

## Step 4: Import CloudSim

Import the extracted CloudSim project/library into the Java project.

Configure the required CloudSim JAR files so that the project can access the CloudSim classes.

---

## Step 5: Initialize CloudSim

Initialize the CloudSim package before creating the simulation entities.

The general initialization is:

```java
int num_user = 1;
Calendar calendar = Calendar.getInstance();
boolean trace_flag = false;

CloudSim.init(num_user, calendar, trace_flag);
```

The parameters represent:

- `num_user` — number of cloud users.
- `calendar` — simulation calendar.
- `trace_flag` — whether event tracing is enabled.

---

## Step 6: Create a Datacenter

A datacenter represents a cloud resource provider.

The datacenter contains one or more hosts and is configured using `DatacenterCharacteristics`.

The configuration includes properties such as:

- Architecture
- Operating system
- Virtual machine monitor
- Host list
- Time zone
- Processing cost
- Memory cost
- Storage cost
- Bandwidth cost

A datacenter can be created using a VM allocation policy such as:

```java
new VmAllocationPolicySimple(hostList)
```

---

## Step 7: Create a Broker

Create a broker to manage the interaction between the cloud user and the datacenter.

```java
DatacenterBroker broker = createBroker();
```

The broker manages:

- VM submission
- Cloudlet submission
- Communication with datacenters
- Receiving completed cloudlets

---

## Step 8: Create Virtual Machines

Create one or more virtual machines.

A VM is configured using parameters such as:

- VM ID
- Broker ID
- MIPS
- Number of processing elements
- RAM
- Bandwidth
- Storage
- VMM name
- Cloudlet scheduler

Example:

```java
Vm vm = new Vm(
    vmid,
    brokerId,
    mips,
    pesNumber,
    ram,
    bw,
    size,
    vmm,
    new CloudletSchedulerTimeShared()
);
```

---

## Step 9: Submit the VM List

Submit the VM list to the broker:

```java
broker.submitVmList(vmlist);
```

---

## Step 10: Create Cloudlets

A cloudlet represents a computational task submitted to the cloud.

A cloudlet contains parameters such as:

- Cloudlet ID
- Length
- Number of processing elements
- Input file size
- Output file size
- CPU utilization model
- RAM utilization model
- Bandwidth utilization model

Example:

```java
Cloudlet cloudlet = new Cloudlet(
    id,
    length,
    pesNumber,
    fileSize,
    outputSize,
    utilizationModel,
    utilizationModel,
    utilizationModel
);
```

---

## Step 11: Submit the Cloudlet List

Submit the cloudlet list to the broker:

```java
broker.submitCloudletList(cloudletList);
```

---

## Step 12: Start the Simulation

Start the CloudSim simulation:

```java
CloudSim.startSimulation();
```

After the simulation finishes:

```java
CloudSim.stopSimulation();
```

The completed cloudlets can then be retrieved from the broker.

---

## Step 13: Display the Results

The completed cloudlets are obtained using:

```java
List<Cloudlet> newList = broker.getCloudletReceivedList();
```

The result can display:

```text
Cloudlet ID
STATUS
Data center ID
VM ID
Time
Start Time
Finish Time
```

---

## Sample Output

The laboratory manual provides a sample output based on a basic CloudSim example:

```text
Starting CloudSimExample1...
Initialising...
Starting CloudSim version 3.0
Datacenter_0 is starting...
Broker is starting...
Entities started.
Broker: Cloud Resource List received
Broker: Trying to Create VM #0 in Datacenter_0
Broker: VM #0 has been created
Broker: Sending cloudlet 0 to VM #0
Cloudlet 0 received
Broker: All Cloudlets executed. Finishing...
Broker is shutting down...
Simulation completed.
```

The manual's result table contains fields including:

```text
Cloudlet ID
STATUS
Data center ID
VM ID
Time
Start Time
Finish Time
```

The sample demonstrates successful execution of a CloudSim cloudlet. 

---

## Result — Part A

A basic cloud computing scenario was simulated using CloudSim. The CloudSim environment was initialized, a datacenter and broker were created, a virtual machine and cloudlet were configured, and the simulation was executed successfully.

---

# Part B — Modern Implementation

The original laboratory manual uses an older Eclipse-based CloudSim workflow. For the implementation documented in this repository, the experiment is adapted to the following environment:

```text
Operating System      : EndeavourOS Linux
IDE                   : IntelliJ IDEA
Programming Language  : Java
Cloud Simulation      : CloudSim 3.0.3
```

The objective remains the same: simulate a cloud environment and implement a scheduling algorithm that is not directly provided by CloudSim.

The modern workflow is:

```text
Create IntelliJ Java Project
          ↓
Add CloudSim 3.0.3 Libraries
          ↓
Initialize CloudSim
          ↓
Create Datacenter
          ↓
Create Broker
          ↓
Create Virtual Machine
          ↓
Create Cloudlets
          ↓
Apply Custom Scheduling Algorithm
          ↓
Submit VMs and Cloudlets
          ↓
Start Simulation
          ↓
Collect Results
          ↓
Display Results
```

---

## Step 1: Verify Java

Check that Java is installed:

```bash
java -version
```

Check the Java compiler:

```bash
javac -version
```

The CloudSim application requires a working Java development environment.

---

## Step 2: Create the IntelliJ IDEA Project

Create a new Java project in IntelliJ IDEA.

Use a project name such as:

```text
Experiment6CloudSim
```

Configure the project to use the installed JDK.

---

## Step 3: Download CloudSim 3.0.3

CloudSim 3.0.3 is used for this implementation.

The CloudSim 3.0.3 distribution contains the required JAR files under its `jars` directory.

The important library is:

```text
cloudsim-3.0.3.jar
```

CloudSim 3.0.3 also requires Apache Commons Math:

```text
commons-math3-3.6.1.jar
```

---

## Step 4: Add CloudSim Libraries to IntelliJ IDEA

In IntelliJ IDEA:

```text
File
→ Project Structure
→ Modules
→ Dependencies
→ +
→ JARs or Directories
```

Add:

```text
cloudsim-3.0.3.jar
commons-math3-3.6.1.jar
```

Set their scope to:

```text
Compile
```

Apply the changes.

The CloudSim classes should now be available to the project.

---

## Step 5: Verify the CloudSim Installation

Before implementing the custom scheduling algorithm, run the standard CloudSim example.

A successful execution should show messages similar to:

```text
Starting CloudSimExample1...
Initialising...
Starting CloudSim version 3.0
Datacenter_0 is starting...
Broker is starting...
Entities started.
...
Cloudlet 0 received
...
Simulation completed.
```

This confirms that:

- Java is configured correctly.
- CloudSim 3.0.3 is available.
- The required dependencies are available.
- IntelliJ IDEA can execute CloudSim programs.

---

# Step 6: Create the Custom Scheduling Program

Create a Java class:

```text
CustomSchedulingExample.java
```

Use the package:

```text
org.cloudbus.cloudsim.examples
```

The program creates:

- One datacenter
- One host
- One broker
- One virtual machine
- Four cloudlets

The cloudlets have different execution lengths so that a custom scheduling algorithm can be applied.

---

# Step 7: Create the Cloudlets

The experiment uses the following cloudlet lengths:

| Cloudlet ID | Length (MI) |
|---:|---:|
| 0 | 40000 |
| 1 | 10000 |
| 2 | 30000 |
| 3 | 20000 |

The original order is:

```text
0 → 1 → 2 → 3
```

---

# Step 8: Implement the Custom Scheduling Algorithm

For the custom scheduling requirement, **Shortest Job First (SJF)** is implemented.

SJF orders tasks according to their computational length, placing the shortest task first.

For the cloudlets used in this experiment:

```text
Cloudlet 0 → 40000 MI
Cloudlet 1 → 10000 MI
Cloudlet 2 → 30000 MI
Cloudlet 3 → 20000 MI
```

The SJF order becomes:

```text
Cloudlet 1 → 10000 MI
Cloudlet 3 → 20000 MI
Cloudlet 2 → 30000 MI
Cloudlet 0 → 40000 MI
```

Therefore:

```text
Original order:
0 → 1 → 2 → 3

SJF order:
1 → 3 → 2 → 0
```

---

## SJF Implementation

The cloudlet list can be sorted using:

```java
cloudletList.sort(
    Comparator.comparingLong(
        Cloudlet::getCloudletLength
    )
);
```

This compares the length of each cloudlet and sorts the list in ascending order.

The sorted list is then submitted to the broker:

```java
broker.submitCloudletList(cloudletList);
```

---

# Step 9: Complete CloudSim Program

```java
package org.cloudbus.cloudsim.examples;

import org.cloudbus.cloudsim.*;
import org.cloudbus.cloudsim.core.CloudSim;
import org.cloudbus.cloudsim.provisioners.BwProvisionerSimple;
import org.cloudbus.cloudsim.provisioners.PeProvisionerSimple;
import org.cloudbus.cloudsim.provisioners.RamProvisionerSimple;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Comparator;
import java.util.List;

public class CustomSchedulingExample {

    private static List<Vm> createVms(int brokerId) {

        List<Vm> vmList = new ArrayList<>();

        int vmId = 0;
        int mips = 1000;
        int pesNumber = 1;
        int ram = 1024;
        long bandwidth = 1000;
        long size = 10000;
        String vmm = "Xen";

        Vm vm = new Vm(
                vmId,
                brokerId,
                mips,
                pesNumber,
                ram,
                bandwidth,
                size,
                vmm,
                new CloudletSchedulerTimeShared()
        );

        vmList.add(vm);

        return vmList;
    }

    private static List<Cloudlet> createCloudlets(int brokerId) {

        List<Cloudlet> cloudletList = new ArrayList<>();

        long[] lengths = {
                40000,
                10000,
                30000,
                20000
        };

        int pesNumber = 1;
        long fileSize = 300;
        long outputSize = 300;

        UtilizationModel utilizationModel =
                new UtilizationModelFull();

        for (int i = 0; i < lengths.length; i++) {

            Cloudlet cloudlet = new Cloudlet(
                    i,
                    lengths[i],
                    pesNumber,
                    fileSize,
                    outputSize,
                    utilizationModel,
                    utilizationModel,
                    utilizationModel
            );

            cloudlet.setUserId(brokerId);

            cloudletList.add(cloudlet);
        }

        return cloudletList;
    }

    private static Datacenter createDatacenter(String name) {

        List<Host> hostList = new ArrayList<>();
        List<Pe> peList = new ArrayList<>();

        int mips = 1000;

        peList.add(
                new Pe(
                        0,
                        new PeProvisionerSimple(mips)
                )
        );

        int hostId = 0;
        int ram = 2048;
        long storage = 1000000;
        int bandwidth = 10000;

        hostList.add(
                new Host(
                        hostId,
                        new RamProvisionerSimple(ram),
                        new BwProvisionerSimple(bandwidth),
                        storage,
                        peList,
                        new VmSchedulerTimeShared(peList)
                )
        );

        String architecture = "x86";
        String operatingSystem = "Linux";
        String vmm = "Xen";

        double timeZone = 10.0;
        double costPerSecond = 3.0;
        double costPerMemory = 0.05;
        double costPerStorage = 0.001;
        double costPerBandwidth = 0.0;

        DatacenterCharacteristics characteristics =
                new DatacenterCharacteristics(
                        architecture,
                        operatingSystem,
                        vmm,
                        hostList,
                        timeZone,
                        costPerSecond,
                        costPerMemory,
                        costPerStorage,
                        costPerBandwidth
                );

        Datacenter datacenter = null;

        try {

            datacenter = new Datacenter(
                    name,
                    characteristics,
                    new VmAllocationPolicySimple(hostList),
                    new ArrayList<Storage>(),
                    0
            );

        } catch (Exception e) {
            e.printStackTrace();
        }

        return datacenter;
    }

    private static DatacenterBroker createBroker()
            throws Exception {

        return new DatacenterBroker("Broker");
    }

    private static void printResults(List<Cloudlet> list) {

        System.out.println();
        System.out.println("========== CLOUDLET RESULTS ==========");

        System.out.printf(
                "%-12s %-12s %-15s %-10s %-12s %-12s %-12s%n",
                "Cloudlet ID",
                "STATUS",
                "Datacenter ID",
                "VM ID",
                "Time",
                "Start Time",
                "Finish Time"
        );

        for (Cloudlet cloudlet : list) {

            String status =
                    cloudlet.getCloudletStatus()
                            == Cloudlet.SUCCESS
                            ? "SUCCESS"
                            : "FAILED";

            System.out.printf(
                    "%-12d %-12s %-15d %-10d %-12.2f %-12.2f %-12.2f%n",
                    cloudlet.getCloudletId(),
                    status,
                    cloudlet.getResourceId(),
                    cloudlet.getVmId(),
                    cloudlet.getActualCPUTime(),
                    cloudlet.getExecStartTime(),
                    cloudlet.getFinishTime()
            );
        }
    }

    public static void main(String[] args) {

        try {

            int numberOfUsers = 1;

            Calendar calendar =
                    Calendar.getInstance();

            boolean traceFlag = false;

            CloudSim.init(
                    numberOfUsers,
                    calendar,
                    traceFlag
            );

            createDatacenter("Datacenter_0");

            DatacenterBroker broker =
                    createBroker();

            int brokerId = broker.getId();

            List<Vm> vmList =
                    createVms(brokerId);

            List<Cloudlet> cloudletList =
                    createCloudlets(brokerId);

            System.out.println(
                    "Original Cloudlet Order:"
            );

            for (Cloudlet cloudlet : cloudletList) {

                System.out.println(
                        "Cloudlet "
                                + cloudlet.getCloudletId()
                                + " - Length: "
                                + cloudlet.getCloudletLength()
                );
            }

            /*
             * Custom Scheduling Algorithm:
             * Shortest Job First (SJF)
             */
            cloudletList.sort(
                    Comparator.comparingLong(
                            Cloudlet::getCloudletLength
                    )
            );

            System.out.println();
            System.out.println(
                    "SJF Scheduled Cloudlet Order:"
            );

            for (Cloudlet cloudlet : cloudletList) {

                System.out.println(
                        "Cloudlet "
                                + cloudlet.getCloudletId()
                                + " - Length: "
                                + cloudlet.getCloudletLength()
                );
            }

            broker.submitVmList(vmList);

            broker.submitCloudletList(
                    cloudletList
            );

            System.out.println();
            System.out.println(
                    "Starting CloudSim Simulation..."
            );

            CloudSim.startSimulation();

            List<Cloudlet> resultList =
                    broker.getCloudletReceivedList();

            CloudSim.stopSimulation();

            printResults(resultList);

            System.out.println();
            System.out.println(
                    "Simulation completed."
            );

        } catch (Exception e) {

            e.printStackTrace();
        }
    }
}
```

---

# Step 10: Run the Program

Run:

```text
CustomSchedulingExample
```

from IntelliJ IDEA.

The program first prints the original cloudlet order.

It then applies SJF and prints the reordered cloudlets.

The expected scheduling order is:

```text
Cloudlet 1 - Length: 10000
Cloudlet 3 - Length: 20000
Cloudlet 2 - Length: 30000
Cloudlet 0 - Length: 40000
```

The CloudSim simulation is then started and the completed cloudlet results are printed.

---

# Expected Output

The beginning of the output should resemble:

```text
Original Cloudlet Order:
Cloudlet 0 - Length: 40000
Cloudlet 1 - Length: 10000
Cloudlet 2 - Length: 30000
Cloudlet 3 - Length: 20000

SJF Scheduled Cloudlet Order:
Cloudlet 1 - Length: 10000
Cloudlet 3 - Length: 20000
Cloudlet 2 - Length: 30000
Cloudlet 0 - Length: 40000

Starting CloudSim Simulation...
```

CloudSim then prints its normal simulation messages.

The final section is displayed in the following format:

```text
========== CLOUDLET RESULTS ==========

Cloudlet ID  STATUS       Datacenter ID   VM ID      Time
...
```

The exact execution times, start times, and finish times are generated by CloudSim during execution.

> **Note:** The values in the final result table should be taken from the actual execution of the program rather than manually entered into this README.

---

# Understanding the Implementation

## CloudSim

`CloudSim` provides the simulation environment used to model the cloud infrastructure and simulation events.

---

## Datacenter

The `Datacenter` represents the cloud resource provider.

It contains physical hosts and manages the allocation of virtual machines.

---

## Host

A `Host` represents a physical computing machine.

The host provides:

- CPU processing elements
- RAM
- Bandwidth
- Storage

---

## Virtual Machine

A `Vm` represents a virtual machine running inside the simulated datacenter.

The VM is configured with:

- MIPS
- RAM
- Bandwidth
- Storage
- Number of processing elements
- Cloudlet scheduler

---

## Broker

`DatacenterBroker` acts on behalf of the cloud user.

It submits:

- VM lists
- Cloudlet lists

to the simulated datacenter.

---

## Cloudlet

A `Cloudlet` represents a computational task.

The cloudlet length determines the amount of computation required.

In this experiment:

```text
Cloudlet 0 → 40000 MI
Cloudlet 1 → 10000 MI
Cloudlet 2 → 30000 MI
Cloudlet 3 → 20000 MI
```

---

# Custom Scheduling Algorithm — Shortest Job First

The custom scheduling algorithm is **Shortest Job First (SJF)**.

The algorithm sorts cloudlets according to their computational length in ascending order.

### Input

```text
C0 = 40000 MI
C1 = 10000 MI
C2 = 30000 MI
C3 = 20000 MI
```

### Original Order

```text
C0 → C1 → C2 → C3
```

### After SJF

```text
C1 → C3 → C2 → C0
```

### Sorted Lengths

```text
10000 → 20000 → 30000 → 40000
```

The shortest computational task is therefore placed first.

---

# Why SJF Is a Custom Scheduling Algorithm

CloudSim 3.0.3 provides scheduling classes such as:

```java
CloudletSchedulerTimeShared
```

and:

```java
CloudletSchedulerSpaceShared
```

These are scheduling mechanisms provided by CloudSim.

The SJF policy implemented in this experiment is different: it determines the **order of cloudlet submission based on cloudlet length** before the cloudlets are passed to the broker.

The custom logic is:

```java
cloudletList.sort(
    Comparator.comparingLong(
        Cloudlet::getCloudletLength
    )
);
```

Thus, the experiment demonstrates how a scheduling policy not directly provided as a CloudSim scheduling class can be incorporated into a CloudSim simulation.

---

# Important CloudSim Concepts

| Concept | Description |
|---|---|
| CloudSim | Framework for simulating cloud computing environments |
| Datacenter | Simulated cloud resource provider |
| Host | Physical computing machine inside a datacenter |
| VM | Virtual machine running on a host |
| Broker | Manages VM and cloudlet submissions |
| Cloudlet | Represents a computational task |
| MIPS | Million Instructions Per Second |
| TimeShared | Shares processing capacity between cloudlets |
| SpaceShared | Allocates processing capacity using a space-shared policy |
| SJF | Shortest Job First scheduling strategy |
| SO | Simulation object representing the modeled cloud environment |

---

# Comparison

| Feature | Basic CloudSim Example | This Experiment |
|---|---|---|
| CloudSim initialization | Yes | Yes |
| Datacenter | Yes | Yes |
| Host | Yes | Yes |
| Broker | Yes | Yes |
| VM | Yes | Yes |
| Cloudlets | Yes | Yes |
| Cloudlet scheduler | Built-in | Built-in VM scheduler + custom cloudlet ordering |
| Custom scheduling logic | No | Yes |
| Scheduling strategy | Default submission order | Shortest Job First |
| Simulation results | Yes | Yes |

---

# Result

A cloud computing scenario was simulated successfully using CloudSim 3.0.3.

A datacenter, host, broker, virtual machine, and multiple cloudlets were created. A custom **Shortest Job First (SJF)** scheduling algorithm was implemented by sorting the cloudlets according to their computational length before submitting them to the CloudSim broker.

The simulation was executed successfully and the cloudlet execution results were displayed.

---

# Conclusion

This experiment demonstrates the use of CloudSim for simulating a cloud computing environment and incorporating a custom scheduling strategy.

The experiment covers:

- CloudSim initialization
- Datacenter creation
- Host creation
- Broker creation
- VM creation
- Cloudlet creation
- Cloudlet scheduling
- Simulation execution
- Result analysis

The custom **Shortest Job First (SJF)** strategy orders cloudlets from shortest to longest based on their computational length.

The implementation therefore demonstrates how a scheduling policy that is not directly provided as a built-in CloudSim scheduling class can be incorporated into a CloudSim simulation.

---

# Repository Structure

The Experiment 6 directory contains only the documentation and source code required for the experiment.

```text
Experiment_6_CloudSim/
├── README.md
└── src/
    └── org/
        └── cloudbus/
            └── cloudsim/
                └── examples/
                    └── CustomSchedulingExample.java
```

No image files are required for this experiment because the laboratory manual does not contain any images for Experiment 6.

---

# Reference

- CS722I1C: Cloud Computing and Security Laboratory Manual, Department of Computer Science & Engineering, Sahyadri College of Engineering & Management, Mangaluru.
- CloudSim 3.0.3.
- CloudSim Toolkit documentation and source distribution.
