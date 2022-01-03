require 'rails_helper'

RSpec.describe Technique, type: :model do
  
  before(:all) do 
    @group = Group.create(name: "Tachi-waza")
  end


  it "validate presence of technique name" do
    technique = Technique.new({
      :name => "O-soto-gari",
      :group => @group
    })
    expect(technique).to be_valid
  end

  it "validate blank technique name" do
    technique = Technique.new({
      :name => "",
      :url => "https://www.youtube.com/watch?v=c-A_nP7mKAc",
      :group => @group
    })
    expect(technique).to_not be_valid
  end

  it "validate technique relations" do
    technique = Technique.create(name: "Seoi-nage", group: @group)
    expect(technique.group).to eq(@group)
  end

  it "db:seed" do
    Rails.application.load_seed
    expect(Technique.all.count).to be > 0
  end

end
