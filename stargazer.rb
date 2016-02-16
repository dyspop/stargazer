`touch stargazer.log`

while (puts ip = ([proc { Random.rand(0..255) }]*4).map(&:call).join('.')) || ip
  `echo "#{ip + "\n" + @star}" >> stargazer.log` unless (@star = `curl -I #{ip} --anyauth --connect-timeout 0.1 --max-time 3`.to_s).empty?
end
