# Kubernetes currently only supports a secret or configmap in a single dir.
# This symlink hack makes sure we have a standard ceph config with both conf and keyrings

echo "k8s: Symlinking secrets"
ln -s /etc/ceph/secrets/* /etc/ceph/

echo "k8s: Symlinking ceph.conf"
ln -s /etc/ceph/conf/ceph.conf /etc/ceph/ceph.conf

exec /bin/ceph_exporter
