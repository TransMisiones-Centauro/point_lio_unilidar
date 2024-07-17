#!/usr/bin/env bash

rocker --name point_lio --x11 --nvidia --volume ./bags:/bags -- centauro/point_lio_unilidar:latest bash
