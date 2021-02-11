# test setup

This repository contains the tools:

* [open-svc](https://github.com/superbrothers/kubectl-open-svc-plugin)
* [kubespy](https://github.com/huazhihao/kubespy)
* [sniff](https://github.com/eldadru/ksniff)

## preparation

* creating and push image `docker build -t eu.gcr.io/cloud-native-coding/code-server-java-debug:3.4.1 .`
* execute `k apply -k .` in folder `...cnd…ejs/config` to deploy

## demo open-svc

* execute `k open-svc myapp`

## demo kubespy

This is a patched kubespy script. Repo see above...

* execute `./kubespy.sh myapp`
* open Chrome with `http://localhost:8080/?folder=/home/cnde/project`
* add extension `Java IDE Pack`, reload browser window, go back to File View
* wait for Java to setup, accept default Java Language Support
* switch to `Debugger View` add `launch.json`, add configuration `Java attach` and change Port to `8000`
* add breakpoint at `ProductAPI.java` e.g. at line 22
* start debugger with `Java Attach` selected
* in terminal type `curl localhost:8888/api/v1/products` to check breakpoint

## demo sniff

the above application has to be started and Wireshark has to be installed

1. create load

    ```bash
    k run load --image=busybox -- /bin/sh -c "while true; do wget -O index.html http://myapp:8888/; sleep 1; done"
    ```

2. start sniffing

    ```bash
    k sniff load -n trainer -p --socket /var/run/docker.sock
    ```
