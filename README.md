# ezops-test-guilherme

Aplicação base: [Simple Chat with NodeJs + Express + Mongoose + Socket.io](https://betterprogramming.pub/simple-chat-application-in-node-js-using-express-mongoose-and-socket-io-ee62d94f5804)

<br>

## RUN with Docker
<br>

#### build image
    *  docker-compose build
<br>

#### run app (option 1)
    * docker-compose up
<br>

#### run app (option 2)
    * docker run -itd --name=ezops-test-guilherme_web_1 -p=3000:3000 ezops-test-guilherme_web:latest
<br>


### CI/CD
https://medium.com/thelorry-product-tech-data/amazon-ec2-deployment-complete-ci-cd-pipeline-using-github-actions-and-aws-codedeploy-8a477123ff7e

## TODO

    add ci/test 
    add edit option message
    add delete option message