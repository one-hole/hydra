# 多中情况能改变用户的账户行为
# 也就是说用户的账户里面的金额只能通过这个表来修改

=begin

  accountable_type
  accountable_id

=end

class AccountDetail < ApplicationRecord

  belongs_to :accountable, polymorphic: true
  belongs_to :operateable, polymorphic: true
  belongs_to :account

  # 账户变化的主体、数额、操作者、备注
  def self.build(accountable, account, amount, operator, mark)
    AccountDetail.transaction do
      detail = create!(accountable: accountable, operateable: operator, account: account, amount: amount, mark: mark)
      detail.account.charge(amount)
    end
  end

end
