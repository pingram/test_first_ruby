def measure(numtimes = 1)
	starttime = Time.now
	numtimes.times { yield }
	endtime = Time.now
	return (endtime - starttime) / numtimes.to_f
end