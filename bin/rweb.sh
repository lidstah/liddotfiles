#!/bin/bash

html2text $1 | pandoc -t plain
