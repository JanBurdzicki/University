#!/bin/bash

head -c 1G <(yes a | tr -d '\n' | head -c 1G) > in_a
head -c 1G <(yes ab | tr -d '\n' | head -c 1G) > in_ab
