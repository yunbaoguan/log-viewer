# Docker build for log-viewer

LogViewer: https://github.com/sevdokimov/log-viewer

## Docker Execution

A configuration file should be provided: /opt/logviewer/config.conf

```
    docker run -d --name=logviewer \
        -p 8111:8111 \
        -v /path/to/config.conf:/opt/logviewer/config.conf:ro \
        yunbaoguan/log-viewer 

```

Point your browser to and enjoy: http://localhost:8111


## Existing config.conf

Existing configuration is place here for reference:

```
log-viewer.server.port=8111 // A port to bind Web UI

log-viewer.server.context-path="/"

// log-viewer.server.interface=localhost

log-viewer.use-web-socket=true

log-viewer.backdoor_server.port=9595

// List of file patterns describing visible files and subdirectories
logs = [
  {
    path: "**/*.log"  // All files with ".log" extension are visible by default
  }
  {
    path: "**/*.log.*"  // All files like "*.log.1" are visible by default
  }

//  {
//    path: ${HOME}"/my-app/logs/*.log"
//    format: {
//      type: LogbackLogFormat
//      pattern: "%date{yyyy-MM-dd_HH:mm:ss.SSS} [%thread] %-5level %logger{35} - %X{pipelineId}%X{contentId}%msg%n"
//    }
//  }
]

authentication.enabled = false // Enabling/disabling Basic HTTP authentication

// List of users for basic authentication. Used when `authentication.enabled=true`
users = [
  { name: "user1", password: "1" },
  { name: "user2", password-md5: "c81e728d9d4c2f636f067f89cc14862c" }, // The password is "2". Specified as md5 hash of "2" string.
]


// shorten log paths
log-paths = {

//  // "my-app" is a query parameter in URL, http://localhost:8111/logs?log=my-app  shows logs from ~/my-app/logs/my-app.log
//  my-app = {
//    file = ${HOME}"/my-app/logs/my-app.log"
//  }

//  // "multinode-app" is a query parameter in URL, http://localhost:8111/logs?log=multinode-app shows logs from
//  // /opt/multinode-app/logs/app.log files on "node-cn-01", "node-cn-02" and "node-cn-03" hosts.
//  multinode-app = {
//    file = "/opt/multinode-app/logs/app.log"
//    host = ["node-cn-01", "node-cn-02", "node-cn-03"]
//  }
}

ui-config {
//  properties."java-exception-renderer.home-package" = ["com.mycompany.myapp"]  // the name of java package highlighted in stacktraces

  send-usage-statistics: true // ping "http://myregexp.com/log-viewer-statistic/$version/*.png" URL when LogViewer is opening
}
```
