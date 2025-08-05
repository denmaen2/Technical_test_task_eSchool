# Technical_test_task_eSchool
Useful links:

Azure cli https://learn.microsoft.com/en-us/cli/azure/ad/sp?view=azure-cli-latest

Azure terraform https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs

Ansible Java https://serverfault.com/questions/980852/ansible-openjdk-8-jdk-and-ubuntu-18-04-woes

Ansible MVN https://galaxy.ansible.com/ui/standalone/roles/gantsign/maven/install/

Ansible Git clone https://jhooq.com/ansible-git-clone-repository/

Ansible MySQL https://medium.com/splunkuserdeveloperadministrator/creating-mysql-databases-with-ansible-925ab28598ab

Ansible MySQL https://serverfault.com/questions/1130682/setting-mysql-using-ansible-in-ubuntu-remote-machine

Error https://serverfault.com/questions/1135627/error-unexpected-parameter-type-in-action-ansible-playbook

Ansible MySQL https://www.geeksforgeeks.org/devops/how-to-install-mysql-using-ansible-playbook/

Ansible Build some commands used from Jenkins https://github.com/yurkovskiy/eSchool/blob/master/JenkinsFile

Terraform for azure youtube 
https://www.youtube.com/watch?v=6oJzsBl_-so

for password
https://www.lastpass.com/features/password-generator

AI used for fixing issues during building (as a debug helper) and as helper of code below in MySQL ansible role:

- name: MySQL allow remote connections
  lineinfile:
    path: /etc/mysql/mysql.conf.d/mysqld.cnf
    regexp: '^mysqlx-bind-address'
    line: 'mysqlx-bind-address = 0.0.0.0'
    backup: yes
  become: yes
  register: mysqlx_config_changed

- name: MySQL privileges
  mysql_query:
    login_unix_socket: /var/run/mysqld/mysqld.sock
    query: "FLUSH PRIVILEGES"
  become: yes
