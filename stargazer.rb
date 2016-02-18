`touch stargazer.log`

while true
  ip = ([proc { Random.rand(0..255) }]*4).map(&:call).join('.')
  #ip = '200.77.168.145' #testing ip
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
  elsif (star.include? '301 Moved' or star.include? '302 Moved') and star.include? ('Location')
    #do a new one
  end

end