#!/bin/bash

gifsicle linear_performance.gif -b --delete "#0" --resize 700x420
gifsicle branch_performance.gif -b --delete "#0" --resize 700x420
gifsicle neutral_performance.gif -b --delete "#0" --resize 700x420
gifsicle punctuated_performance.gif -b --delete "#0" --resize 700x420