# helm-intoduction

1. Test the python file locally:
   * cd api 
   * python api.py

2. Build the docker image and push it to DockerHub:
	* docker image build -t deb0pratim/dummy_flask_app:1.0 .

3. Test the generated manifest file:
	* helm template ./api-chart

4. Install the application via helm-charts:
	* helm install -f api.yaml api ./api-chart

5. Package the application by running helm package command:
	* helm package api-chart -d api-chart/charts

6. Deploy the charts in a particular namespace:
	* helm install prod-api --namespace prod -f prod-api.yaml api-chart/charts/flask-app-1.tgz  
<ins>The output should be as follows: </ins>  
NAME: prod-api  
LAST DEPLOYED: Fri Apr 23 11:38:19 2021  
NAMESPACE: prod  
STATUS: deployed  
REVISION: 1  
TEST SUITE: None  
	* Run a helm-list to view the release:  
helm list --namespace prod  
<ins>The output should be as follows: </ins>  
NAME            NAMESPACE       REVISION        UPDATED                                 STATUS          CHART          APP VERSION  
prod-api        prod            1               2021-04-23 11:38:19.8884551 +0530 IST   deployed        flask-app-1    1.0

7. Optionally, you can port-forward it to your local host to view the output:
	* k port-forward -n prod svc/helm-flask-lb 5001:80

8. Make changes to api.py and build your docker image again with a new tag:
	* docker image build -t deb0pratim/dummy_flask_app:1.1 .

9. Re-package your application again with the "--version" flag:
	* helm package api-chart -d api-chart/charts --version 1.1

10. Re-deploy your application by running the "upgrade" command:
	* helm upgrade prod-api --namespace pre-prod -f prod-api.yaml api-chart/charts/flask-app-1.1.tgz  
<ins>The output should be as follows: </ins>  
Release "preprod-api" has been upgraded. Happy Helming!  
NAME: preprod-api  
LAST DEPLOYED: Fri Apr 23 12:33:26 2021  
NAMESPACE: pre-prod  
STATUS: deployed  
REVISION: 2  
TEST SUITE: None  

11. Confirm that the new version is working either by hitting the loadbalancer Url or 
by doing a port-forward:
	* kubectl port-forward -n prod svc/helm-flask-lb 5002:80














