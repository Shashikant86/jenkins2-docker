# Jenkins 2.0 and Docker 

The new version of the Jenkins a.k.a Jenkins 2.0 will be released very soon. Jenkins 2.0 will be bringing us some new amazing features.

Pipeline as Code
 * Improved User Interface and User Experience
 * Security & plugin Enhancements
 * New Jenkins WebSite as one stop for getting started guide

# USAGE 

## Setup Docker 

* Clone the repo 

         $ git clone https://github.com/Shashikant86/jenkins2-docker
         $ cd jenkins2-docker 

 Build Images Jenkins Master and Jenkins Data 
 
         $ docker build -t jenkins-data -f Dockerfile-data .
         $ docker build -t jenkins2 .
Now launch Containers 

        $ docker run --name=jenkins-data jenkins-data
        $ docker run -p 8080:8080 -p 50000:50000 --name=jenkins-master --volumes-from=jenkins-data -d jenkins2

Now we can see Jenkins 2.0 will be started on Docker host ip and Port 8080 e.g http://192.168.99.100:8080/

![image](https://github.com/Shashikant86/jenkins2-docker/blob/master/gifs/dj.gif)

## Setup Jenkins

Now that we are running instance of the Jenkins at ‘http://192.168.99.100:8080/‘ (Assuming 192.168.99.100 is your Docker-Machine or equivalent IP), we can setup up the things

* Admin Password
Jenkins 2.0 will ask for the Admin password stored in the Jenkins Master container. We can get it and paste it in the console

           $ docker exec jenkins-master cat /var/jenkins_home/secrets/initialAdminPassword

* User Details
The next step is to fill in the required user details in order to login into the Jenkins.

* Plugins

You can then install default plugins

Now, we have ready instance of Jenkins to configure Jobs and Pipelines.
![image](https://github.com/Shashikant86/jenkins2-docker/blob/master/gifs/jenkins-startup.gif)

## Jenkins 2.0

Jenkins features are explained in the brief above but we will demonstrate two powerful features

#### Pipeline as Code
In the previous version of the Jenkins. We have

Pipeline as a code has following benefits

* Easily define simple and complex pipelines through the DSL in a Jenkinsfile.
* Pipeline as code provides a common language to help teams (e.g. Dev and Ops) work together.
* Easily share pipelines between teams by storing common “steps” in shared repositories.
 

Here is the demo how to create a default pipeline using Jenkins 2.o.
![image](https://github.com/Shashikant86/jenkins2-docker/blob/master/gifs/pipeline.gif)

#### MultiBrnach Pipeline 

It creates pipeline for the every branch 

![image](https://github.com/Shashikant86/jenkins2-docker/blob/master/gifs/multibranch_pipeline.gif)
