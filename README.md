# ansible-collection-general

Ansible Collection for General Purpose Roles (by si9r.org)

| | |
| --:                | :-- |
| __Ansible Galaxy__ | [~~si9r.general~~](https://galaxy.ansible.com/ui/repo/published/si9r/general/) |
| __GitHub__         | [si9r-org/ansible-collection-general](https://github.com/si9r-org/ansible-collection-general) |

#### ROLES

| Role        | Description |
| --:         | :--         |
| `sops`      | 'Secure OPerationS' (sops) and 'Actually Good Encryption' (age) |
| ~~`hashicorp`~~ | HashiCorp repo and applications |
| ~~`cni`~~       | 'Container Networking Interface' (cni) |

#### INSTALLATION

```yaml
# File: requirements.yaml
# $ ansible-galaxy install -r requirements.yml
---
collections:
  - name: https://github.com/si9r-org/ansible-collection-general.git
    type: git
    version: main
  #- name: si9r.general
  #  type: galaxy
```
