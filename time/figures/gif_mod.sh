#!/bin/bash

sudo gifsicle linear_performance.gif --delete "#0"  -o linear_performance.gif
sudo gifsicle branch_performance.gif --delete "#0"  -o branch_performance.gif
sudo gifsicle neutral_performance.gif --delete "#0"  -o neutral_performance.gif 
sudo gifsicle punctuated_performance.gif --delete "#0" -o punctuated_performance.gif