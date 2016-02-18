`touch stargazer.log`

while true
  ip = ([proc { Random.rand(0..255) }]*4).map(&:call).join('.')
  #ip = '200.251.23.49' #testing ip
  print ip
  star = `curl -I #{ip} --anyauth --connect-timeout 0.1 --max-time 3`.to_s
  if star != ''
    `date >> stargazer.log`
    `echo "#{ip}" >> stargazer.log`
    `curl -I #{ip} --anyauth --connect-timeout 0.1 --max-time 3 >> stargazer.log`
  end
  #pattern match for other protocols and version numbers here would be great, I just suck at regex:
  if star.include? '200 OK'
    `open http://#{ip} -g`
  elsif (star.include? '301 Moved' or star.include? '302 Moved') and star.include? 'Location'
    moved_location = star.split('ocation: ')
    moved_location_uri = moved_location[1].split("\n")
    `open #{moved_location_uri[0]} -g`
  end
  print "\n\n\n" + star + "\n\n\n"
end