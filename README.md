# CloudInfraProject

## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

**Note**: The following image link needs to be updated. Replace `diagram_filename.png` with the name of your diagram image file.  

![Project_Topology_Diagram](https://user-images.githubusercontent.com/77707411/117197805-42b8ea00-adb6-11eb-954f-ebf414729404.png)

This document contains the following details:
- Description of the Topologu
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly available, in addition to restricting inbound access to the network.
- _TODO: What aspect of security do load balancers protect? What is the advantage of a jump box?_

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the file systems of the VM's on the network. Using Kibana, Filebeat, and Metricbeat we can watch system metrics; such as cpu usage; attempted SSH logins and sudo escalation failures.

The configuration details of each machine may be found below.
_Note: Use the [Markdown Table Generator](http://www.tablesgenerator.com/markdown_tables) to add/remove values from the table_.

| Name     | Function        | IP Address | Operating System |
|----------|-----------------|------------|------------------|
| Jump Box | Gateway         | 10.0.0.4   | Linux            |
| DVWA 1   | Web Server      | 10.0.0.5   | Linux            |
| DVWA 2   | Web Sever       | 10.0.0.6   | Linux            |
| Elk-VM   | Monitoring      | 10.1.0.5   | Linux            |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the Jump Box machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
138.91.165.37

Machines within the network can only be accessed by other machines in the Virtual network. The DVWA servers Web-1 and Web-2 send traffic to the ELK server.

A summary of the access policies in place can be found in the table below.

| Name     | Publicly Accessible | Allowed IP Addresses |
|----------|---------------------|----------------------|
| Jump Box | Yes                 |  138.91.165.37       |
| DVWA 1   | No                  |  10.0.0.1-24         |
| DVWA 2   | No                  |  10.0.0.1-24         |
| Elk      | No                  |  10.1.0.1-24         |

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because...
- _TODO: What is the main advantage of automating configuration with Ansible?_

The playbook implements the following tasks:
- _TODO: In 3-5 bullets, explain the steps of the ELK installation play. E.g., install Docker; download image; etc._
- ...
- ...

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

![Docker_PS](https://user-images.githubusercontent.com/77707411/117201611-d7254b80-adba-11eb-89da-9fa52df5da47.PNG)


Installing Elk Playbook
[install_elk_YML_file.md](https://github.com/Drjimbop/CloudInfraProject/files/6429908/install_elk_YML_file.md)



### Target Machines & Beats
This ELK server is configured to monitor the following machines:
DVWA 1 and 2:
10.0.0.5 and 10.0.0.6_

We have installed the following Beats on these machines:
Filebeat and Metric Beat

These Beats allow us to collect the following information from each machine:
Filebeat monitors the log files or locations that you specify, collects log events, and forwards them either to Elasticsearch or Logstash for indexing.
Metricbeat takes the metrics and statistics that it collects and ships them to the output that you specify, such as Elasticsearch or Logstash.

Installing Filebeat Playbook
[Filebeat_YML_file.md](https://github.com/Drjimbop/CloudInfraProject/files/6429920/Filebeat_YML_file.md)

Installing Metricbeat Playbook
[Metricbeat_YML_file.md](https://github.com/Drjimbop/CloudInfraProject/files/6429926/Metricbeat_YML_file.md)

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the configuration file to your YML file.
- Update the hosts and configuration files to include your server IP addresses for your Elk
- Run the playbook, and navigate to Kibana using your elk server public IP: http://13.72.78.85:5601/app/kibana

_TODO: Answer the following questions to fill in the blanks:_
- _Which file is the playbook? Where do you copy it?_
- _Which file do you update to make Ansible run the playbook on a specific machine? How do I specify which machine to install the ELK server on versus which to install Filebeat on?_
- _Which URL do you navigate to in order to check that the ELK server is running?


In Jumpbox, start and attach the ansible container 
sudo docker start trusting_bhabha
trusting_bhabha
sudo docker attach trusting_bhabha

From Ansible container, configure hosts files and Elk configuration files, then run Elk Playbook
ansible-playbook intsall_elk.yml

Start Elk
sudo docker start elk

SSH into Elk server to test
ssh azdmin@10.1.0.5


