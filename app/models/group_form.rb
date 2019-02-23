class GroupForm
  include ActiveModel::Model

  attr_accessor :name, :user
  attr_reader :group

  validates :user, presence: true
  validates :name, presence: true, length: { maximum: 120 }

  def save
    if valid?
      persist!
    else
      false
    end
  end

  def self.model_name
    Group.model_name
  end

  private

  def persist!
    @group = Group.create!(name: name)
    Membership.new(group: @group, user: user).save!
  end
end
