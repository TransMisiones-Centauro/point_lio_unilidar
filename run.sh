#!/usr/bin/env bash

rocker --name point_lio --x11 --nvidia --network host --volume ./bags:/bags -- centauro/point_lio_unilidar:latest bash
