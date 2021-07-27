# The backend for a recipie app
---
## How to use
1. Make sure you have docker, minikube and kubernetes installed and setup
2. Run the makefile by running the command `make` in the backend folder. This will setup the configmaps, secrets and deployments the project requires.
3. Run the command `minikube service chefio-service` to attatch a public ip to the service and view the project in a browser.
4. If the project cannot be viewed in abrowser, this is likely because kubernetes is still pulling the image from docker hub and creating a container so give it somme time. Run the command `kubectl get pod` to view the status of all the pods running in the cluster.
5. Run the command `kubectl logs chefio-***** -f` to follow the logs and ensure that the server has started. Where `chefio-****` is the id of the chefio server pod not the database pod.
6. This project has not been tested on a multi node cluster and is not suitable for production