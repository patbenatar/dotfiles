#!/usr/bin/ruby

regex = /^#{ARGV[0]}\s*git@heroku\..*:(.*)\.git \(push\)/
matches = regex.match `git remote -v`
print matches[1]
