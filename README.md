# OpenShift client tools Docker image

## Example of usage

```
$ docker run --name oc -it michelesr/oc
app@2e30ab81d4b5:/$ oc login 10.2.2.2 -u admin -p password --insecure-skip-tls-verify=true
Login successful.

You have access to the following projects and can switch between them with 'oc project <projectname>':

  * default (current)
  * openshift
  * openshift-infra
  * sample

Using project "default".
app@6db4e9f072a7:/$ oc get project
NAME              DISPLAY NAME   STATUS
sample                           Active
default                          Active
openshift                        Active
openshift-infra                  Active
app@6db4e9f072a7:/$ ...
```
