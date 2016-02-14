`touch stargazer.log`

while true
  a = Random.new.rand(0..255).to_s
  b = Random.new.rand(0..255).to_s
  c = Random.new.rand(0..255).to_s
  d = Random.new.rand(0..255).to_s
  ip = a + '.' + b + '.' + c + '.' + d
  print ip
  `echo "#{ip}" >> stargazer.log`
  `curl -I #{ip} --anyauth --connect-timeout 1 --max-time 3 >> stargazer.log`
end