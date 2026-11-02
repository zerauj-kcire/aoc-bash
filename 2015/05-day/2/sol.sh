#!/bin/bash

input="input.txt";
# input="ex";

grep "\(..\).*\1" $input | grep "\(.\).\1" | wc -l;
# SOLVED
