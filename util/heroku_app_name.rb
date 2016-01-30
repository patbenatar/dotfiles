#!/usr/bin/ruby

regex = /^#{ARGV[0]}\s*(git@heroku\..*:|https:\/\/git.heroku.com\/)(.*)\.git \(push\)/
matches = regex.match `git remote -v`
print matches[2]
