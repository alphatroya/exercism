package twofer

import "fmt"

// method return two-fer string depending of input name
func ShareWith(name string) string {
	var realName string
	if name == "" {
		realName = "you"
	} else {
		realName = name
	}
	return fmt.Sprintf("One for %s, one for me.", realName)
}
