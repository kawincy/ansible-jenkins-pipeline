# Jenkins → Ansible → Server Automation Pipeline

A local DevOps pipeline demonstrating infrastructure automation using Jenkins and Ansible.

## Architecture
- **Jenkins** — CI/CD orchestrator, triggers Ansible on demand
- **Ansible** — configuration management, SSHes into target and enforces desired state
- **Target Server** — Ubuntu container acting as a managed node

## What it does
- Installs Git on the target server
- Creates a project directory
- Deploys a configuration file
- Demonstrates idempotency — running the playbook multiple times produces the same result
- Demonstrates drift remediation — if server state changes, the next pipeline run corrects it

## Stack
- Docker
- Jenkins
- Ansible
- Ubuntu 22.04

## How to run
1. Build and start the target container
2. Start Jenkins
3. Trigger the ansible-pipeline job
4. Watch Ansible configure the target server
