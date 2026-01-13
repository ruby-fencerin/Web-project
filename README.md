[link to ideas] (https://docs.google.com/document/d/1o_Ai8DddpeUatv2TnIrNdKO5C4gUGg-BkQhyw9SoOig/edit?usp=sharing)


## Как се пуска програмата?

0. Изтегля се (Docker Desktop)[https://www.docker.com/products/docker-desktop/] и се инсталира.

1. В основната папка на приложението през терминала се изпълняват последователно тези команди:

```terminal
docker-compose build
docker-compose up -d
```

Бележка: Ще се изпълни термниала с много команди. Всичко е наред.

2. След създаването на последния контейнер може да се посети главната страница на http://localhost:8080/index.php и phpMyAdmin на http://localhost:8081

## За спиране на програмата:
Има два варианта:
1) Чрез GUI на Docker Desktop: В Containers под Actions има стоп бутон (син объл квадрат)
2) Чрез терминала: От основната папка чрез командата
```terminal
docker-compose down
```


