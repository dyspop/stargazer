require 'geoip'
`touch stargazer.log`

while true
  ip = ([proc { Random.rand(0..255) }]*4).map(&:call).join('.')
  #ip = '73.0.201.233' #testing ip
  star = `curl -I #{ip} --anyauth --connect-timeout 0.1 --max-time 3`.to_s
  if star != ''
    `date >> stargazer.log`
    `echo "#{ip}" >> stargazer.log`
    `echo nslookup #{ip} >> stargazer.log`
    `curl -I #{ip} --anyauth --connect-timeout 0.1 --max-time 3 >> stargazer.log`
  end
  #pattern match for other protocols and version numbers here would be great, I just suck at regex:
  if star.include? '200 OK'
    `open http://#{ip} -g`
  elsif (star.include? '301 Moved' or star.include? '302 Moved' or star.include? '301 Redirect') and star.include? 'Location'
    moved_location = star.split('ocation: ')
    print moved_location
    moved_location_uri = moved_location[1].split("\n")
    print moved_location_uri
    `open #{moved_location_uri[0]} -g`
  end
  #break
end