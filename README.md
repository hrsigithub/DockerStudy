
## Dockerのコンテナ作成など</br>

```docker builder prune```</br>
```docker build -t python-dev:1.0 .```</br>
```docker run --name python-dev -it -d -v /Users/hrsi/dev/DockerStudy:/pythonProjects python-dev:1.0```</br>
```docker start python-dev```</br>
```docker exec -it  python-dev bash```</br>



## Dockerの全削除の方法</br>
```docker image prune -af```</br>
```docker volume prune -f```</br>
```docker container prune -f```</br>
```docker system prune -f```</br>
