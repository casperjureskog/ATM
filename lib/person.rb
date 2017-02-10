require "date"
require './lib/account'


class Person
  attr_accessor :name, :cash, :account

  def initialize(attrs = {})
    self.name = set_name(attrs [:name])
    self.cash = 0
    self.account = nil
  end


  def create_account
    self.account = Account.new(owner: self)
  end

  def deposit(amount)
    # if amount >= self.cash then
    #   raise RuntimeError, 'not enough cash'
    # else
      self.account == nil ? missing_account : deposit_funds(amount)
    # end
  end

  def withdraw(attrs = {})
    self.account == nil ? missing_account : withdraw_funds(attrs[:atm], attrs[:amount])
  end


  private

  def set_name(name)
    name == nil ? missing_name : name
  end

  def increase_cash(response)
     self.cash += response[:amount]
  end

  def deposit_funds(amount)
    self.cash -= amount
    self.account.balance += amount

  end

  def missing_name
    raise ArgumentError, 'A name is required'
  end

  def missing_account
     raise RuntimeError, 'No account present'
  end

  def withdraw_funds(atm, amount)
    atm ? perform_withdraw(amount, atm) : atm_missing
  end

  def atm_missing
    raise RuntimeError, 'An ATM is required'
  end

  def perform_withdraw(amount, atm)
    atm.withdraw(amount, self.account.pin_code, self.account, self.account.account_status)
    self.cash += amount
  end

end
