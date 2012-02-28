Description
===========

Help install the pycon website. Right now only gets to the part of a
pycon user setup with virtualenv, code checked out, and requirements
file run.

Includes a postgresql sub recepie, but opscode postgres cookbook is
lacking. I'm looking into a better one that can manage users but right
now it's not really functional.

Requirements
============

## Cookbooks required
 - python
 - git

Attributes
==========
`node[:pycon][:dir]`  -  Directory to install pycon virtualenv and
codebase  
`node[:pycon][:owner]` - Owner of the directory  
`node[:pycon][:group]` - Group owner of directoy  
`node[:pycon][:repo]` - Repo to pull the codebase from  
`node[:pycon][:branch]` - What branch to checkout  

**the below don't work yet**

`node[:pycon][:dbname]` - Database name  
`node[:pycon][:dbuser]` - Database user  
`node[:pycon][:dbpass]` - Database password  

Usage
=====





