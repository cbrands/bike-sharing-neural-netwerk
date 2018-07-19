#stop all containers
docker kill $(docker ps -q)

#remove old images
docker system prune -f

rm jupyter.sh
echo "jupyter notebook Your_first_neural_network.ipynb --ip 0.0.0.0 --no-browser --allow-root" > jupyter.sh
chmod 777 jupyter.sh

imagename="bikesharing"
imagename+="-app"

docker build -t $imagename .

docker run -it -p 8888:8888 -v $PWD:/opt/app $imagename
