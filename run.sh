#!/usr/bin/env bash

. venv/bin/activate
cd sioworkers

exec supervisord -c supervisord.conf --nodaemon
