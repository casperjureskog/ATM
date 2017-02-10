###  ATM Challenge

 Fist week assigmnet from Craft Acadenmy Bootcamp.
 The challenge is to simulate an ATM machine with ruby code.

###Usage

Open irb in the terminal.

```irb
2.3.3 :002 > load './lib/person.rb'
 => true
2.3.3 :003 > load './lib/atm.rb'
 => true
2.3.3 :004 > load './lib/account.rb'
/Users/casper/Projects/ATM/lib/account.rb:6: warning: already initialized constant Account::STANDARD_VALIDITY_YRS
/Users/casper/Projects/ATM/lib/account.rb:6: warning: previous definition of STANDARD_VALIDITY_YRS was here
 => true
2.3.3 :005 >
```

```irb
2.3.3 :006 > casper = Person.new(name: 'Casper')
 => #<Person:0x007ff0f10027a8 @name="Casper", @cash=0, @account=nil>
2.3.3 :007 > casper.create_account
 => #<Account:0x007ff0ef082298 @pin_code=2420, @balance=0, @account_status=:active, @exp_date="02/22", @owner=#<Person:0x007ff0f10027a8 @name="Casper", @cash=0, @account=#<Account:0x007ff0ef082298 ...>>>
2.3.3 :008 > bankomat = Atm.new
 => #<Atm:0x007ff0ef079558 @funds=1000>
2.3.3 :009 > casper.deposit 100
 => 100
2.3.3 :010 > casper.withdraw(atm: bankomat, amount: 50)
 => -50
2.3.3 :011 >
```
