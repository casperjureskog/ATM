class Atm
  attr_accessor :funds

  def initialize
    @funds = 1000
  end

  def withdraw(amount, pin_code, account, account_status)
    case
    when insufficient_funds_in_account?(amount, account) then
      { status: true, message: 'insufficient funds', date: Date.today }
    when insufficient_funds_in_atm?(amount)
      { status: false, message: 'insufficient funds in ATM', date: Date.today }
    when incorrect_pin?(pin_code, account.pin_code)
      { status: false, message: 'wrong pin code', date: Date.today }
    when card_expired?(account.exp_date)
      { status: false, message: 'card expired', date: Date.today }
    when account_stat?(account_status)
      { status: :disabled, message: 'account not active', date: Date.today }
    else
      preform_transaction(amount, account)

    end
  end

  private

  def insufficient_funds_in_account?(amount, account)
    amount > account.balance
  end

  def insufficient_funds_in_atm?(amount)
    @funds < amount
  end

  def preform_transaction(amount, account)
     @funds -= amount
     account.balance = account.balance -amount
     { status: true, message: 'success', date: Date.today, amount: amount }
  end

  def incorrect_pin?(pin_code, actual_pin)
    pin_code != actual_pin
  end

  def card_expired?(exp_date)
    Date.strptime(exp_date, '%m/%y') < Date.today
  end

  def account_stat?(account_status)
    account_status === :disabled
  end

end
