lxc profile delete cointhink
lxc profile create cointhink
cat profile | lxc profile edit cointhink

IMAGE="6978077ac9f8"
NAME="alpine-cointhink-`date +%Y-%m-%d`"
#OUT=`lxc launch $IMAGE 2>&1`
#NAME=`echo $OUT| cut -d ' ' -f 2`

echo building $NAME
lxc launch $IMAGE $NAME -p cointhink

lxc file push init.cointhink $NAME/etc/init.d/cointhink-script
lxc file push -p --mode=755 start $NAME/cointhink/
lxc file push -p ../scripting/start.py $NAME/cointhink/
lxc file push -r ../protobuf/python/proto $NAME/cointhink/
lxc file push setup.sh $NAME/
echo running setup.sh
lxc exec $NAME -- /bin/sh -x /setup.sh
lxc restart $NAME

echo $NAME configured

