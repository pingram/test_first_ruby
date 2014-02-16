# set numtimes to 1 if not otherwise specified
def measure(numtimes = 1)
	starttime = Time.now
	numtimes.times { yield }		# yield the block numtimes
	endtime = Time.now
	return (endtime - starttime) / numtimes.to_f
end