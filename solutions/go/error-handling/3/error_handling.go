package erratum

// Use try to open ResourceOpener instance and pass message to it's result. Return error if any problems proceed.
func Use(o ResourceOpener, message string) (err error) {
	resource, err := o()
	for err != nil {
		if _, ok := err.(TransientError); !ok {
			return err
		}
		resource, err = o()
	}

	defer func() {
		r := recover()
		if r != nil {
			switch c := r.(type) {
			case FrobError:
				resource.Defrob(c.defrobTag)
				err = c
			case error:
				err = c
			}
		}
		resource.Close()
	}()
	resource.Frob(message)
	return nil
}
