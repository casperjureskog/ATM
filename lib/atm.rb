class Atm
  attr_accessor :funds

  def initialize
    @funds = 1000
  end

  def withdraw(amount, pin_code, account, account_status )
    case
    when insufficient_funds_in_account?(amount, account) then
      return_error_message('insufficient funds')
    when insufficient_funds_in_atm?(amount)
      return_error_message('insufficient funds in ATM')
    when incorrect_pin?(pin_code, account.pin_code)
      return_error_message('wrong pin code')
    when card_expired?(account.exp_date)
      return_error_message('card expired')
    when account_stat?(account_status)
      return_error_message('account not active')
    else
      preform_transaction(amount, account)
    end
end
  private

  def return_error_message(message)
{ status: false,
  message: (message),
   date: Date.today }
  end

  def insufficient_funds_in_account?(amount, account)
    amount > account.balance
  end

  def insufficient_funds_in_atm?(amount)
    @funds < amount
  end

  def preform_transaction(amount, account)
     @funds -= amount
     account.balance = account.balance - amount
     { status: false, message: 'success', date: Date.today, amount: amount, bills: add_bills(amount) }
  end

  def add_bills(amount)
   denominations = [20, 10, 5]
    bills = []
    denominations.each do |bill|
      while amount - bill >= 0
        amount -= bill
        bills << bill
      end
    end
    bills

  end

  def incorrect_pin?(pin_code, actual_pin)
    pin_code != actual_pin
  end

  def card_expired?(exp_date)
    Date.strptime(exp_date, '%m/%y') < Date.today
  end

  def account_stat?(account_status)
    account_status === :false
  end

end
