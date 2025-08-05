# Technical_test_task_eSchool
Useful links:

https://learn.microsoft.com/en-us/cli/azure/ad/sp?view=azure-cli-latest
https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs
https://serverfault.com/questions/980852/ansible-openjdk-8-jdk-and-ubuntu-18-04-woes
https://www.geeksforgeeks.org/devops/how-to-install-git-using-ansible/
https://galaxy.ansible.com/ui/standalone/roles/gantsign/maven/install/
https://jhooq.com/ansible-git-clone-repository/
https://medium.com/splunkuserdeveloperadministrator/creating-mysql-databases-with-ansible-925ab28598ab
https://serverfault.com/questions/1130682/setting-mysql-using-ansible-in-ubuntu-remote-machine
https://serverfault.com/questions/1135627/error-unexpected-parameter-type-in-action-ansible-playbook
https://www.geeksforgeeks.org/devops/how-to-install-mysql-using-ansible-playbook/
https://github.com/yurkovskiy/eSchool/blob/master/JenkinsFile

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
# Technical_test_task_eSchool
