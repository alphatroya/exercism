package letter

import "sync"

//ConcurrentFrequency counts letters in the input strings slice
func ConcurrentFrequency(arr []string) FreqMap {
	waitGroup := new(sync.WaitGroup)
	ch := make(chan FreqMap, len(arr))
	for _, s := range arr {
		waitGroup.Add(1)
		go func(s string, ch chan<- FreqMap) {
			ch <- Frequency(s)
			waitGroup.Done()
		}(s, ch)
	}

	waitGroup.Wait()

	m := FreqMap{}
	for range arr {
		b := <-ch
		for i, j := range b {
			m[i] += j
		}
	}
	return m
}
