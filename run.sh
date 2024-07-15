#!/usr/bin/env bash

rocker --x11 --nvidia --volume ./bags:/bags -- centauro/point_lio_unilidar:latest bash
