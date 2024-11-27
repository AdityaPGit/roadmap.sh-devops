HostConfig='roadmapsh'
LocalLocation='/Users/adityapandey/documents/roadmap.sh-devops/nginxlocal/'
RemoteLocation='/srv/rsnginx/html'

rsync -av --delete $LocalLocation $HostConfig:$RemoteLocation