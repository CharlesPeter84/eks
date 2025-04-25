#!/bin/bash

echo "Testing application svc1-app1.cptest1"

echo "From: cptest1-dep1-app1"
kubectl exec -it deployment/cptest1-dep1-app1 -n cptest1 -- curl --connect-timeout 1 -s -o /dev/null -w "%{http_code}\n" svc1-app1.cptest1

echo "From: cptest1-dep1-app2"
kubectl exec -it deployment/cptest1-dep1-app2 -n cptest1 -- curl --connect-timeout 1 -s -o /dev/null -w "%{http_code}\n" svc1-app1.cptest1

echo "From: cptest2-dep2-app1"
kubectl exec -it deployment/cptest2-dep2-app1 -n cptest2 -- curl --connect-timeout 1 -s -o /dev/null -w "%{http_code}\n" svc1-app1.cptest1

echo "From: cptest1-dep1-app2"
kubectl exec -it deployment/cptest2-dep2-app2 -n cptest2 -- curl --connect-timeout 1 -s -o /dev/null -w "%{http_code}\n" svc1-app1.cptest1

echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"

echo "Testing application svc1-app2.cptest1"

echo "From: cptest1-dep1-app1"
kubectl exec -it deployment/cptest1-dep1-app1 -n cptest1 -- curl --connect-timeout 1 -s -o /dev/null -w "%{http_code}\n" svc1-app2.cptest1

echo "From: cptest1-dep1-app2"
kubectl exec -it deployment/cptest1-dep1-app2 -n cptest1 -- curl --connect-timeout 1 -s -o /dev/null -w "%{http_code}\n" svc1-app2.cptest1

echo "From: cptest2-dep2-app1"
kubectl exec -it deployment/cptest2-dep2-app1 -n cptest2 -- curl --connect-timeout 1 -s -o /dev/null -w "%{http_code}\n" svc1-app2.cptest1

echo "From: cptest1-dep1-app2"
kubectl exec -it deployment/cptest2-dep2-app2 -n cptest2 -- curl --connect-timeout 1 -s -o /dev/null -w "%{http_code}\n" svc1-app2.cptest1


echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"

echo "Testing application svc2-app1.cptest2"

echo "From: cptest1-dep1-app1"
kubectl exec -it deployment/cptest1-dep1-app1 -n cptest1 -- curl --connect-timeout 1 -s -o /dev/null -w "%{http_code}\n" svc2-app1.cptest2

echo "From: cptest1-dep1-app2"
kubectl exec -it deployment/cptest1-dep1-app2 -n cptest1 -- curl --connect-timeout 1 -s -o /dev/null -w "%{http_code}\n" svc2-app1.cptest2

echo "From: cptest2-dep2-app1"
kubectl exec -it deployment/cptest2-dep2-app1 -n cptest2 -- curl --connect-timeout 1 -s -o /dev/null -w "%{http_code}\n" svc2-app1.cptest2

echo "From: cptest1-dep1-app2"
kubectl exec -it deployment/cptest2-dep2-app2 -n cptest2 -- curl --connect-timeout 1 -s -o /dev/null -w "%{http_code}\n" svc2-app1.cptest2


echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"

echo "Testing application svc2-app2.cptest2"

echo "From: cptest1-dep1-app1"
kubectl exec -it deployment/cptest1-dep1-app1 -n cptest1 -- curl --connect-timeout 1 -s -o /dev/null -w "%{http_code}\n" svc2-app2.cptest2

echo "From: cptest1-dep1-app2"
kubectl exec -it deployment/cptest1-dep1-app2 -n cptest1 -- curl --connect-timeout 1 -s -o /dev/null -w "%{http_code}\n" svc2-app2.cptest2

echo "From: cptest2-dep2-app1"
kubectl exec -it deployment/cptest2-dep2-app1 -n cptest2 -- curl --connect-timeout 1 -s -o /dev/null -w "%{http_code}\n" svc2-app2.cptest2

echo "From: cptest1-dep1-app2"
kubectl exec -it deployment/cptest2-dep2-app2 -n cptest2 -- curl --connect-timeout 1 -s -o /dev/null -w "%{http_code}\n" svc2-app2.cptest2
