#!/bin/bash
# user data will get sudo access
dnf install ansible -y
cd /tmp
git clone https://github.com/kalidindi-naveen/Expense-Ansible-Roles.git
cd Expense-Ansible-Roles
ansible-playbook main.yaml -e SERVER=be -e login_password=ExpenseApp1
ansible-playbook main.yml -e SERVER=fe