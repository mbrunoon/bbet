require 'rails_helper'

RSpec.describe Group, type: :model do
  
  it "validates presence of name" do
    group = Group.new(:name => "")
    expect(group).to_not be_valid
  end

  it "validates group references" do
    major_group = Group.create(:name => "Nage-waza")
    expect(major_group.major_group).to be_nil

    minor_group = Group.new(:name => "Tachi-waza", :major_group => 0)
    expect(minor_group).to_not be_valid

    minor_group.major_group = major_group.id
    minor_group.save
    expect(minor_group.major_group).to equal(major_group.id)
  end

end
