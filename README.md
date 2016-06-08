###AppleRequests - Apple Push Notification Library

The AppleRequests project is a C library that provides easy-to-use Python bindings for sending push notification requests to the Apple Push Notification servers.

###Development Status

The project currently supports sending single push notification requests over a non-persistent HTTP/2 (over TLSv1.2) connection.

###Requirements

The following packages are required to build the AppleRequests library:

* nghttp2 >= 1.11.1 (https://nghttp2.org/)
* libevent >= 2.0.22 (http://libevent.org/)

Note: The nghttp2 library must be built and installed with openSSL support.

###Building

The project can be built and installed with:

```
make
make install
```

Additionally, the `install.sh` script will download, build, and install all dependencies along with the AppleRequests library itself.

If using the `install.sh` script, the `scripts/install_nghttp2` must be slightly modified to ensure that the openSSl libraries can be found correctly.

Note: The package is in the process of moving to GNU Autotools and pip packaging.

###Examples

The `examples` directory contains sample use cases on how to send Apple push notification requests in both C and Python.


###Contributing

The project is currently maintained by Chris Orcutt (orcutt.chris@gmail.com).

All bug reports and feature requests go into GitHub's issue tracker with the appropriate tags.

Collaboration and contributions are greatly welcome! =]