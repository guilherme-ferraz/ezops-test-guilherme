#!/bin/bash

apt-get update
apt-get install -y curl 

curl ifconfig.me 


echo "-----BEGIN RSA PRIVATE KEY-----
MIIEpQIBAAKCAQEAswEQyx3QJgzueZVdHUmw5B4uSraIjHL6DgxQb0NwvCCSssBH
AMf+PJfxka9uYDbaOoolL/B5C/VfXdq+oAZMnJYW02WSRA4fOvknGVwsVgAjqkXX
kGt7TOqTq2VLuu97O+lPhjMYEiEwV7tEBvpHFtDPi/adaYLhho0BTV8oyachaswA
TOVtb4sTZ/jtOzf19XPM1hXb8NFaj5Qeu896WJhTeyWWRUydxT034swKmjeE58rP
9jvv54uLp/w55Xz5Z1fsQSjXhrk2egmOwu6QN3sa8I5xFHR6FVjLbeYU2w3b2RSW
Ns0/nZJUM3692xmu1xvAnpCMsFIIPlQlwNvXrwIDAQABAoIBAQCd5MK7Z4DDD4UL
GgUYYHf3v+d1X6zytjh7S8FnY0V9q/26ToBS4BYRvLUInIXvuHKmUFSdBLDBK58D
Wn/rB6NsO7fGoEF0ZkCF9F/YrsUs1tKezxxl92i7X+8BsEgsjDFXl2TeKxOAamYJ
/NT0kq9CIM3x14biGuBzns0XQmjn9VnSu6r1OnwfBrusKBGWPPoa/HI++fDiGsEk
608Dda/lDHU3lyy0q6WuUCF706yVNJLdynu8R5RvAA6SS5qwJxbL0b2TTXybVBNm
HhrQPTnP50r+h7823gptTHMGuu1VYC2M8Z3IxtIFuHJLQWNA+KdUZB0ZlTRuoKc6
ed3FVxaBAoGBAOPSh83pxqo01S2TEdFqfElHFUsLX+JOiz6zaXPW77as3dAGTelE
9Kj1t7VcQD/JaOoLY5Rg+GaTDhfq5XM8yRWYxUl+79JIyLKFz/aZzwC+hIfb8Sm6
uyvxkhWtu5nRcpH7ESD4huAMikQ6RLtBhkBlIXg9OOdptmpTCNZ8avUFAoGBAMkk
0aJVojFwH2y6LHxmCA4SY0Q9KLC9yPbN3p9Zn2m1PUROdHWcZpPWJ/taBrBY6jPl
1rd6m4kWnRB1w3aupYvc2QY3lLUi8M3z3THsgaaDX78OS84fkFhdEVGwX9EN8JXW
OR5mSafarLHKX/7DZgwceb6l2WPuKHN/luArengjAoGATGFFDpAV/vJ/liv8iU0+
JgMi7Gn/14ulu3vDGwcwjvod06SJcm+f5xWaZb9r+va3qd/vnstz/E/JJdOm4Z+7
evYhDqb0GHg2cUPTmUWv1PwKytG+ZNMp9W2kIIiCoOtLkg2ujHNGJM+Pe5hderpZ
HDXLptg/v7X9ZmA4UlCcO1ECgYEAvR/+cGmeMGfhVEUVEP6Kslh9t6rduJkp/U2C
9ke5iRYdfj1aaT9ef8DMJRz3zxY7WALSyf/hgJufoNtppwz9oS1NbfgSveIVk0Cp
iYh8O0mpXCYgBrZM7ZjMcQeqgBFgVjJv0HKS7N3CpQTJD+0/5UFdA3JDnh9PL5IX
Fb4r0AsCgYEAmrVTy0qci0vTDg/1WDYQvXukHROWmS61osTPAz2xZMLbExSFl8nc
NFf4AsLjk6BsoZ1gak+m9ayxQbRjcaCYBRNgr+5HpeYJTTeCHrmHc2iQ4XCMmkq1
hh9+6tomPRpvYRhoy3E5XTnAMkO++ZcOLMPepomTn6FrMD3aludaWkQ=
-----END RSA PRIVATE KEY-----" > cert.pem

chmod 400 cert.pem
mkdir -p ~/.ssh/
chmod 700 ~/.ssh/
ssh-keyscan -H "ec2-54-232-137-215.sa-east-1.compute.amazonaws.com" >> ~/.ssh/known_hosts

ssh -i 'cert.pem' ubuntu@ec2-54-232-137-215.sa-east-1.compute.amazonaws.com 'echo "ola" > test.remote && pwd'