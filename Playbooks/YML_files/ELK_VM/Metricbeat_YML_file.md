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