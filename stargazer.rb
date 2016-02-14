`touch stargazer.log`

while true
  a = Random.new.rand(0..255).to_s
  b = Random.new.rand(0..255).to_s
  c = Random.new.rand(0..255).to_s
  d = Random.new.rand(0..255).to_s
  ip = a + '.' + b + '.' + c + '.' + d
  print ip
  star = `curl -I #{ip} --anyauth --connect-timeout 0.1 --max-time 3`.to_s
  if star != ''
    `echo "#{ip}" >> stargazer.log`
    `curl -I #{ip} --anyauth --connect-timeout 0.1 --max-time 3 >> stargazer.log`
  end
end