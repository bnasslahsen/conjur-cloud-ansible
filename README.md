# Demo project for Ansible

## Pre-requisites
- OS Linux / MacOS
- conjur-cli

https://www.conjur.org/blog/technical-deep-dive-security-automation-with-red-hat-ansible-tower-part-one/

## Ansible Setup
- Create BNL ROOT Branch - AS Security Admin
```shell
conjur policy update -b data -f root-branch.yml
```

- Create Ansible Branch - AS Security Admin
```shell
conjur policy update -b data/bnl -f ansible-branch.yml
```

- Delegation on the branch for the team - AS Security Admin
```shell
conjur policy update -b data/vault -f ansible-user-grants.yml
```

- Declare Your Apps - AS Projects Team
```shell
./load-hosts.sh
```
