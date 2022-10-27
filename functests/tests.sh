#!/usr/bin/env bash
#
# This file is part of MinIO DirectPV
# Copyright (c) 2021, 2022 MinIO, Inc.
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Affero General Public License for more details.
#
# You should have received a copy of the GNU Affero General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

set -ex

source "${SCRIPT_DIR}/common.sh"

function test_build() {
    DIRECTPV_CLIENT=./kubectl-directpv
    install_directpv
    export_admin_server
    add_drives
    unexport_admin_server
    deploy_minio
    uninstall_minio
    remove_drives
    uninstall_directpv
}

echo "$ME: Setup environment"
setup_lvm
setup_luks

echo "$ME: ================================= Run build test ================================="
test_build

remove_luks
remove_lvm
