package letter

//ConcurrentFrequency counts letters in the input strings slice
func ConcurrentFrequency(input []string) FreqMap {
	ch := make(chan FreqMap, len(input))
	for _, s := range input {
		go func(s string) {
			ch <- Frequency(s)
		}(s)
	}

	result := FreqMap{}
	for range input {
		for key, count := range <-ch {
			result[key] += count
		}
	}
	return result
}
