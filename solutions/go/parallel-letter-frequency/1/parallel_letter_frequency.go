package letter

import "sync"

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
	close(ch)

	m := FreqMap{}
	for b := range ch {
		for i, j := range b {
			m[i] += j
		}
	}
	return m
}
