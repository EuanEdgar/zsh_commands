# This has been replaced with php_serve.sh because bash is more performant

port = ARGV[0]

ifconfig = `ifconfig | grep 192`
local_ip = ifconfig.scan(/\d{1,3}/)[0...4].join '.'

host = "#{local_ip}:#{port}"

puts "Starting local development server on:
#{host}
"

`php -S #{host}`