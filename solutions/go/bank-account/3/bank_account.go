package account

import "sync"

// Account stores account information
type Account struct {
	sync.RWMutex
	balance int64
	closed  bool
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
	if a.closed {
		return a.balance, false
	}
	balance := a.balance
	a.closed = true
	a.balance = 0
	return balance, true
}

// Balance request a balance information and success flag (false on closed account)
func (a *Account) Balance() (balance int64, ok bool) {
	a.RLock()
	defer a.RUnlock()
	return a.balance, !a.closed
}

// Deposit edit account balance information
func (a *Account) Deposit(amount int64) (newBalance int64, ok bool) {
	a.Lock()
	defer a.Unlock()
	if a.closed || a.balance+amount < 0 {
		return a.balance, false
	}
	a.balance += amount
	return a.balance, true
}
