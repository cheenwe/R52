#!/usr/bin/env ruby
# 版本更新
file=File.open("VERSION","r")
version ="V0.0.1"
file.each { |line|  version = line }

current_version = version.succ
current_branch = "data-manage"

open('VERSION', 'w') do |f|
  f << current_version.chomp
end

puts "请输入提交内容:"

STDOUT.flush
input = gets.chomp
input = "fixed" if input.size == 0
puts "Commit is: " + input.chomp

def system!(*args)
  system(*args) || abort("\n== Command #{args} failed ==")
end

# system! "cd client && git pull && npm run deploy && cd .."
system! "git add --all && git commit -m #{input}"

system! "git tag -a #{current_version} -m #{input}"
# system! "git push origin #{current_version} && git push my #{current_version}"
system! "git push origin #{current_branch}"

puts current_version
