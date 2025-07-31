package letter

//ConcurrentFrequency counts letters in the input strings slice
func ConcurrentFrequency(arr []string) FreqMap {
	ch := make(chan FreqMap, len(arr))
	for _, s := range arr {
		go func(s string, ch chan<- FreqMap) {
			ch <- Frequency(s)
		}(s, ch)
	}

	m := FreqMap{}
	for range arr {
		b := <-ch
		for i, j := range b {
			m[i] += j
		}
	}
	return m
}
