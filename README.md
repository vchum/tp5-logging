# TP5

## Objective:
Implement a solution for centralizing and managing logs in a Kubernetes cluster as well as the applications it contains.

## Description of files provided:

- info.md: description of the various steps involved in installing and setting up the ECK suite.
- install folder:
  - script.sh: to launch the yaml files used to install the resources and the one that will install the RBAC security rules.
  - nginx-deployment & nginx-service: allows you to deploy the Nginx web server and its service.
- config folder: contains screenshots of our logging solution.

## Prerequisites:
- Linux system.
- Min. configuration: Minikube with 10Go memory and 2 cpus.
- Install kubectl
- Install HELM

### How to deploy the log centralization solution:
Deploy the ECK suite, including elasticSearch, which runs queries to search and analyze large volumes of data in real time.

Elastic Agent, for simplified data collection management, replacing legacy Beats (Filebeat, Metricbeat, etc.) in a unified agent.

Fleet provides a web interface in Kibana to centrally manage Elastic Agents and their policies.

It runs immediately after the script is launched.


#### How to deploy the Nginx application:
Nginx is installed using the script file at the same time as ECK is deployed.

##### How to add new applications to log centralization:
To add new applications to log centralization with Flee, you need to:

- Go to the Fleet section, check the status of fleets (server and agent).
- Click on Add Integrations, and search Nginx or an Apache server, for example.
- Configure the installation as required.
- Add the integration with an existing host, select it (Elastic Agent) and click on "Save and continue".
- The integration starts collecting data and sending it to Elasticsearch.
- Collected data can be viewed in Kibana.

###### Presentation and justification of the log storage and rotation strategy:
Fleet enables agents to be managed and deployed on multiple hosts from within Kibana, making it easy to manage agents on a large number of servers. 

Filebeat, which does not offer centralized agent management.

What's more, Fleet is designed to work efficiently with Kibana, as it supports various types of audit logs and metrics, unlike Filebeats.

It's efficient on large-scale environments and lets you configure and manage security policies for your agents, including configuring security for data collection.

Tightly integrated with Elastic Security, Fleet makes it easy to monitor the security of your hosts.

###### Defining KQL queries:
- For a list of available indexes:

_index : * 

- To display logs for the last 24 hours:

@timestamp >= now-24h

- To filter logs to see only those from a specific container for a given application:

container.name: "your_application

- Delete logs older than X (X to be defined according to your strategy) :
KQL is mainly used for searching and viewing data, not for index administration and management. 
Deleting logs older than X days must be managed at the Elasticsearch level itself, usually using index management policies.

- Filter Nginx logs:

message: "Nginx" OR user_agent: "Nginx"

###### In a terminal:
curl -u "elastic:<password>" -k "https://localhost:9200/_cat/indices?v"