---
title: "Bito CLI 包装成流式服务"
date: 2023-06-02T10:55:00+08:00
weight: 1
tags: bito
---


bito> 使用Spring Boot将Bito CLI封装为支持多人使用的流式会话服务，提供SSE post请求接口服务实现


bito response>
以下是一个简单的示例，演示如何使用Spring Boot将Bito CLI封装为支持多人使用的流式会话服务，并提供SSE post请求接口服务实现。

1. 创建一个Spring Boot项目，并添加以下依赖：

```xml
<dependency>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-starter-webflux</artifactId>
</dependency>

<dependency>
    <groupId>com.fasterxml.jackson.core</groupId>
    <artifactId>jackson-databind</artifactId>
</dependency>

<dependency>
    <groupId>com.github.docker-java</groupId>
    <artifactId>docker-java</artifactId>
    <version>3.0.14</version>
</dependency>
```

2. 创建一个RestController类，提供SSE post请求接口服务：

```java
@RestController
public class BitoController {

    private final BitoService bitoService;

    public BitoController(BitoService bitoService) {
        this.bitoService = bitoService;
    }

    @PostMapping(value = "/bito", produces = MediaType.TEXT_EVENT_STREAM_VALUE)
    public Flux<String> bito(@RequestBody String command) {
        return bitoService.execute(command);
    }
}
```

3. 创建一个Service类，封装Bito CLI：

```java
@Service
public class BitoService {

    private final DockerClient dockerClient;

    public BitoService(DockerClient dockerClient) {
        this.dockerClient = dockerClient;
    }

    public Flux<String> execute(String command) {
        try {
            String[] cmd = command.split(" ");
            String[] args = Arrays.copyOfRange(cmd, 1, cmd.length);

            ExecCreateCmdResponse execCreateCmdResponse = dockerClient.execCreateCmd(cmd[0])
                    .withAttachStdout(true)
                    .withAttachStderr(true)
                    .withCmd(args)
                    .exec();

            return Flux.create(emitter -> {
                dockerClient.execStartCmd(execCreateCmdResponse.getId())
                        .exec(new ExecStartResultCallback(emitter));
            });
        } catch (Exception e) {
            return Flux.error(e);
        }
    }
}
```

4. 创建一个ResultCallback类，用于处理Bito CLI的输出：

```java
public class ExecStartResultCallback extends ResultCallbackTemplate<ExecStartResultCallback, Frame> {

    private final FluxSink<String> emitter;

    public ExecStartResultCallback(FluxSink<String> emitter) {
        this.emitter = emitter;
    }

    @Override
    public void onNext(Frame item) {
        try {
            String message = new String(item.getPayload(), StandardCharsets.UTF_8);
            emitter.next(message);
        } catch (Exception e) {
            onError(e);
        }
    }

    @Override
    public void onError(Throwable throwable) {
        emitter.error(throwable);
    }

    @Override
    public void onComplete() {
        emitter.complete();
    }
}
```

5. 配置DockerClient bean：

```java
@Configuration
public class DockerConfiguration {

    @Bean
    public DockerClient dockerClient() {
        return DockerClientBuilder.getInstance().build();
    }
}
```

6. 运行Spring Boot应用程序，然后使用curl或其他HTTP客户端发送POST请求：

```bash
curl -X POST -H "Content-Type: text/plain" -d "docker ps" http://localhost:8080/bito
```

7. 您将收到一个SSE流，其中包含Bito CLI的输出。

这是一个简单的示例，演示如何使用Spring Boot将Bito CLI封装为支持多人使用的流式会话服务，并提供SSE post请求接口服务实现。您可以根据自己的需求进行更改和扩展。