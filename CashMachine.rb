class CashMachine

  def initialize
    @balance = 100.0

    if File.exist?('balance.txt')
      f = File.open('balance.txt')
      @balance = f.read.to_f
      f.close
    end
  end

  def get_balance
    @balance
  end

  def keep_balance
    f = File.open('balance.txt', 'w')
    f.write(@balance)
    f.close
  end

  def get_deposit(sum)
    if !sum.positive?
      'Amount must be greater than zero '
    else
      @balance += sum
      "Your new balance: #{@balance}"
    end
  end

  def get_write_off(sum)
    if sum <= 0
      'Amount must be greater than zero '
    elsif sum > @balance
      'Insufficient funds'
    else
      @balance -= sum
      "Your new balance: #{@balance}"
    end
  end

end
