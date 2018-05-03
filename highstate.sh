#!/bin/bash

sudo salt-call --local --file-root srv/salt/ --pillar-root srv/pillar/  state.apply top

