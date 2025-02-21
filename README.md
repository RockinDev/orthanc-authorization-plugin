## Orthanc Advanced Authorization Plugin

The original Orthanc's authorization plugin repository contains no instructions on how to build the plugin. This repo helps automate the build process as a Linux container image.

This build is supposed to be used as part of a multi-stage container build where the resulting plugin's shared library is installed onto Orthanc's server plugin directory.

### Build instructions

```sh
$ ./build.sh
```

### Example Orthanc server multi-stage build

```Dockerfile
FROM orthanc-authorization-plugin as authorization-plugin-builder

FROM jodogne/orthanc

ARG ORTHANC_PLUGIN_DIR=/usr/local/share/orthanc/plugins/

COPY --from=authorization-plugin-builder /root/orthanc-authorization/build/libOrthancAuthorization.so ${ORTHANC_PLUGIN_DIR}
```
