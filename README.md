# CloudInfraProject

## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

**Note**: The following image link needs to be updated. Replace `diagram_filename.png` with the name of your diagram image file.  

![Project_Topology_Diagram](https://user-images.githubusercontent.com/77707411/117197805-42b8ea00-adb6-11eb-954f-ebf414729404.png)





This document contains the following details:
- Description of the Topology
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly available, in addition to restricting inbound access to the network. Load balancers help ensure environment availability through distribution of incoming data to web servers. Jump boxes allow for more easy administration of multiple systems and provide an additional layer between the outside and internal assets.

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the file systems of the VM's on the network. Using Kibana, Filebeat, and Metricbeat we can watch system metrics; such as cpu usage; attempted SSH logins and sudo escalation failures.

The configuration details of each machine may be found below.

| Name     | Function        | IP Address | Operating System |
|----------|-----------------|------------|------------------|
| Jump Box | Gateway         | 10.0.0.4   | Linux (Ubuntu)   |
| DVWA 1   | Web Server      | 10.0.0.5   | Linux (Ubuntu)   |
| DVWA 2   | Web Sever       | 10.0.0.6   | Linux (Ubuntu)   |
| Elk-VM   | Monitoring      | 10.1.0.5   | Linux (Ubuntu)   |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the Jump Box machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
Personal IP address

Machines within the network can only be accessed by the Jump Box. The Elk Server can have access from personal IP address through port 5601.

A summary of the access policies in place can be found in the table below.

| Name         | Publicly Accessible | Allowed IP Addresses |
|--------------|---------------------|----------------------|
| Jump Box     | Yes                 |  Personal            |
| Load Balancer| No                  |  Open                |
| DVWA 1       | No                  |  10.0.0.5            |
| DVWA 2       | No                  |  10.0.0.6            |
| Elk          | Yes                 |  Personal            |

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because services running can be limited,system installation and update can be streamlined, and processes become more replicable. 

The playbook implements the following tasks:
- installs docker.io, pip3, the docker module, and enables the docker service

[Install_Docker_file.md](https://github.com/Drjimbop/CloudInfraProject/files/6498245/Install_Docker_file.md)

![configure docker](https://user-images.githubusercontent.com/77707411/118587805-35630e80-b76b-11eb-8f58-d5f0ae8132ae.PNG)
        
- increases the virtual memory (for the VM we will use to run the ELK server)

![virtual memory](https://user-images.githubusercontent.com/77707411/118588162-deaa0480-b76b-11eb-9506-be41257ba3cc.PNG)
      
- uses sysctl module

![sysctl module](https://user-images.githubusercontent.com/77707411/118588214-ecf82080-b76b-11eb-8e72-dfa3d19f9d5c.PNG)

- downloads and launches the docker container for Elk server

 ![download docker](https://user-images.githubusercontent.com/77707411/118588249-fed9c380-b76b-11eb-87b1-a9afc084fa5c.PNG)

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

![Docker_PS](https://user-images.githubusercontent.com/77707411/117201611-d7254b80-adba-11eb-89da-9fa52df5da47.PNG)


Installing Elk Playbook
[install_elk_YML_file.md](https://github.com/Drjimbop/CloudInfraProject/files/6429908/install_elk_YML_file.md)


### Target Machines & Beats
This ELK server is configured to monitor the following machines:
- Web 1 (10.0.0.5)
- Web 2 (10.0.0.6)

We have installed the following Beats on these machines:
- Filebeat
- Metricbeat

These Beats allow us to collect the following information from each machine:

- Filebeat monitors the log files or locations that you specify, collects log events, and forwards them either to Elasticsearch or Logstash for indexing.
- Metricbeat takes the metrics and statistics that it collects and ships them to the output that you specify, such as Elasticsearch or Logstash. Examples include cpu usage which can be used to monitor system health.


### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the configuration file to your YML file.
- Update the hosts and configuration files to include your server IP addresses for your Elk
- Run the playbook, and navigate to Kibana using your elk server public IP: http://[Elk_VM_Public_IP]:5601/app/kibana

- Which file is the playbook? The Filebeat-configuration

- Where do you copy it? copy /etc/ansible/files/filebeat-config.yml to /etc/filebeat/filebeat.yml

- Which file do you update to make Ansible run the playbook on a specific machine? How do I specify which machine to install the ELK server on versus which to install Filebeat on? update filebeat-config.yml -- specify which machine to install by updating the host files with ip addresses of web/elk servers and selecting which group to run on in ansible

- Which URL do you navigate to in order to check that the ELK server is running? http://[your.ELK-VM.External.IP]:5601/app/kibana.


filebeats

Installing Filebeat Playbook
[Filebeat_YML_file.md](https://github.com/Drjimbop/CloudInfraProject/files/6429920/Filebeat_YML_file.md)
---
- name: Installing and Launch Filebeat
  hosts: webservers
  become: yes
  tasks:
    # Use command module
  - name: Download filebeat .deb file
    command: curl -L -O https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-7.4.0-amd64.deb
    # Use command module
  - name: Install filebeat .deb
    command: dpkg -i filebeat-7.4.0-amd64.deb
    # Use copy module
  - name: Drop in filebeat.yml
    copy:
      src: ./filebeat.yml
      dest: /etc/filebeat/filebeat.yml
    # Use command module
  - name: enable and configure system module
    command: filebeat modules enable system
    # Use command module
  - name: Setup filebeat
    command: filebeat setup
    # Use command module
  - name: Start filebeat service
    command: service filebeat start
    # Use systemd module
  - name: Enable 'filebeat' on system boot
    systemd:
      name: filebeat
      enabled: yes
      
Installing Metricbeat Playbook
[Metricbeat_YML_file.md](https://github.com/Drjimbop/CloudInfraProject/files/6429926/Metricbeat_YML_file.md)
---
 - name: Install metric beat
   hosts: webservers    
   become: yes
   tasks:

    # Use commmand module
  - name: Download metricbeat .deb file
    command: curl -L -O https://artifacts.elastic.co/downloads/beats/metricbeat/metricbeat-7.7.1-amd64.deb
    # Use command module
  - name: Install metricbeat .deb
    command: sudo dpkg -i metricbeat-7.7.1-amd64.deb
    # Use copy module
  - name: Drop in metricbeat.yml
    copy:
      src: /etc/ansible/files/metricbeat.yml
      dest: /etc/metricbeat/metricbeat.yml
    # Use command module
  - name: enable and configure system module
    command: metricbeat modules enable docker
    # Use command module
  - name: Setup metricbeat
    command: metricbeat setup
    # Use command module
  - name: Start metricbeat service
    command: service metricbeat start
    # Use systemd module
  - name: Enable 'metricbeat' on system boot
    systemd:
      name: metricbeat
      enabled: yes
[Metricbeat_YML_file.md](https://github.com/Drjimbop/CloudInfraProject/files/6429926/Metricbeat_YML_file.md)

