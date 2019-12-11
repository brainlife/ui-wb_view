set -e
set -x

name=brainlife/ui-wb_view
docker build -t $name .
docker tag $name $name:1
docker push $name
