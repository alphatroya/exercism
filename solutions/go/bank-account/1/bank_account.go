package account

import "sync"

// Account stores account information
type Account struct {
	sync.Mutex
	balance int64
}

// Open creates a new account. If negative deposit amount provided returns nil
func Open(initialDeposit int64) *Account {
	if initialDeposit < 0 {
		return nil
	}
	return &Account{balance: initialDeposit}
}

// Close an account, returns payout information and success flag (false on closed account)
func (a *Account) Close() (payout int64, ok bool) {
	a.Lock()
	defer a.Unlock()
	if a.balance < 0 {
		return 0, false
	}
	balance := a.balance
	a.balance = -1
	return balance, true
}

// Balance request a balance information and success flag (false on closed account)
func (a *Account) Balance() (balance int64, ok bool) {
	a.Lock()
	defer a.Unlock()
	if a.balance < 0 {
		return 0, false
	}
	return a.balance, true
}

// Deposit edit account balance information
func (a *Account) Deposit(amount int64) (newBalance int64, ok bool) {
	a.Lock()
	defer a.Unlock()
	if a.balance < 0 {
		return 0, false
	}
	if a.balance+amount < 0 {
		return a.balance, false
	}
	a.balance += amount
	return a.balance, true
}
