# Volumes

The volumes are located inside the Pod.

StorageClass <---cria dos disponiveis aqui--- PVC
PVC ----cria com base nos requisitos---> PV

## StorageClass

Defines classes of storage that will be available in the cluster to be used for the PVC. These classes are used togther with providers that make the hard work of integration with different places, like AWS, Azure, or locally and creating the volumes dynamically.

## Persistence Volumes

Describe a volume with storage size, storage class, host path and his location, the access modes.

# Persistence Volumes Claim

It's a request to use a volume that is sent to the StorageClass, then the StorageClass send us over a PersistentVolume.

**VolumeBindingMode**: only delivers the disk after someone asks for it.

# Commands

```bash
# list all the storage classes
k get sc

# describe a storage class
k describe sc custom-storage-class 

# list all persistent volumes
k get pv
```
