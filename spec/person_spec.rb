require './lib/person'
require './lib/atm'
require './lib/account'

describe Person do

  subject { described_class.new(name: 'Casper') }

  it 'is expected to have a :name on initialize' do
     expect(subject.name).not_to be nil
   end

  it 'is expected to raise error if no name is set' do
     expect { described_class.new }.to raise_error 'A name is required'
  end

   it 'is expected to have a :cash attribute with value of 0 on initialize' do
     expect(subject.cash).to eq 0
   end

   it 'is expected to have a :account attribute' do
     expect(subject.account).to eq nil
   end

   describe 'can create an Account' do
     before { subject.create_account }
     it 'of Account class' do
       expect(subject.account).to be_an_instance_of Account
     end

    it 'with himself as a owner' do
      expect(subject.account.owner).to be subject
     end
   end

  describe 'can manage funds if an account been created' do
     let(:atm) { Atm.new }
  before { subject.create_account }
    it 'can deposit funds' do
      expect(subject.deposit(100)).to be_truthy
    end
  end

  describe 'can not manage funds if no account been created' do
    it 'can\'t deposit funds' do
      expect { subject.deposit(100) }.to raise_error(RuntimeError, 'No account present')
    end
  end


  end