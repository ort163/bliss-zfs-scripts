#!/bin/bash

# Copyright 2013-2017 Jonathan Vasquez <jon@xyinn.org>
# 
# Redistribution and use in source and binary forms, with or without modification,
# are permitted provided that the following conditions are met:
#
# 1. Redistributions of source code must retain the above copyright notice, this
# list of conditions and the following disclaimer.
#
# 2. Redistributions in binary form must reproduce the above copyright notice,
# this list of conditions and the following disclaimer in the documentation and/or
# other materials provided with the distribution.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
# ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
# WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
# DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR
# ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
# (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
# LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON
# ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
# (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
# SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

# Description: This is just for debugging/stress testing the clean_snapshots script

DATASET_ROOT="tank/gentoo/root"
DATASET_HOME="tank/gentoo/home"
FAKE_DATE="1990-01-01"
FAKE_HOUR="0000"
FAKE_TAG="TEST"
FAKE="${FAKE_DATE}-${FAKE_HOUR}"

MAX=10

for i in $(seq -w 1 ${MAX}); do
    SNAPSHOT1="${DATASET_ROOT}@${FAKE}-${i}-${FAKE_TAG}"
    SNAPSHOT2="${DATASET_HOME}@${FAKE}-${i}-${FAKE_TAG}"
    echo "Creating snapshot: ${SNAPSHOT1}"
    zfs snapshot ${SNAPSHOT1}
    echo "Creating snapshot: ${SNAPSHOT2}"
    zfs snapshot ${SNAPSHOT2}
done
