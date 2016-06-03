#!/bin/bash

script/install_nghttp2
script/install_libev
script/install_apns

#synchronize
ldconfig
