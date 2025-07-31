package flatten

// Flatten nested input data into flat slice
func Flatten(input interface{}) []interface{} {
	result := []interface{}{}

	if slice, ok := input.([]interface{}); ok {
		for _, item := range slice {
			switch x := item.(type) {
			case []interface{}:
				result = append(result, Flatten(x)...)
			case nil:
				continue
			default:
				result = append(result, x)
			}
		}
	}

	return result
}
