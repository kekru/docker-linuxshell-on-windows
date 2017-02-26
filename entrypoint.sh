#!/bin/bash

git config --global user.email "$gitemail"
git config --global user.name "$gitname"

exec "$@"
