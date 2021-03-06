# lxc launch images:alpine/3.5/amd64 tempgrab

lxc profile delete cointhink
lxc profile create cointhink
cat profile | lxc profile edit cointhink

IMAGE="38fcd9743858"
NAME="cointhink-`date +%Y-%m-%d`"
#OUT=`lxc launch $IMAGE 2>&1`
#NAME=`echo $OUT| cut -d ' ' -f 2`

echo building $NAME from $IMAGE
lxc launch $IMAGE $NAME -p cointhink
if [ $? -ne 0 ]
then
echo lxc launch failed. abort.
exit
fi

lxc file push inittab $NAME/etc/inittab
lxc file push init.cointhink $NAME/etc/init.d/cointhink-script
lxc file push -p --mode=755 start $NAME/cointhink/
lxc file push -p ../scripting/start.py $NAME/cointhink/
lxc file push -p ../scripting/cointhink.py $NAME/cointhink/
lxc file push -p ../scripting/auth.py $NAME/cointhink/
lxc file push -p websocket-0.44.0-noerr-_app.py $NAME/cointhink/
lxc file push -r ../protobuf/python/proto $NAME/cointhink/
lxc file push setup.sh $NAME/
echo running setup.sh
lxc exec $NAME -- /bin/sh -x /setup.sh
echo $NAME configured
lxc stop $NAME
lxc publish $NAME --alias=$NAME
echo $NAME published

