---
- name: Config Web VM with Docker
  hosts: webservers
  become: true
  tasks:

  - name: Install docker.io
    apt:
      force_apt_get: yes
      name: docker.io
      state: present

  - name: Install pip3
    apt:
      name: python3-pip
      state: present

  - name: Install docker python module
    pip:
      name: docker
      state: present

  - name: download and launch docker web container
    docker_container:
      name: dvwa
      image: cyberxsecurity/dvwa
      state: started
      restart_policy: always
      published_ports: 80:80

  - name: Enable docker service
    systemd:
      name: docker
      enabled: yes