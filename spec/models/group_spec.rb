require 'rails_helper'

RSpec.describe Group, type: :model do
  
  before(:all) do
    @nagewaza = Group.create(name: "Nage-waza")
    @tewaza = Group.create(name: "Te-waza", major_group: @nagewaza.id)
    @ashiwaza = Group.create(name: "Ashi-waza", major_group: @nagewaza.id)
  end

  it "validates presence of name" do
    group = Group.new(name: '')
    expect(group).to_not be_valid
  end

  it "validates alias attribute parent/parent_id" do
    expect(@tewaza.major_group).to eq(@tewaza.parent_id)
    expect(@tewaza.major_group).to eq(@tewaza.parent)
  end

  it "validates group relations" do
    
    expect(@nagewaza.major_group).to be_nil

    minor_group = Group.new(:name => "Tachi-waza", :major_group => 0)
    expect(minor_group).to_not be_valid

    minor_group.major_group = @nagewaza.id
    minor_group.save
    expect(minor_group.major_group).to equal(@nagewaza.id)
  end

  it "return all techniques subgroups" do
    expect(@nagewaza.subgroups.pluck(:id)).to eq([@tewaza.id, @ashiwaza.id])
  end

  it "return all techniques from a group and subgroups" do

    tewaza_techiniques = Technique.create([
      {name: "Seoi-nage", group: @tewaza},
      {name: "Ippon-seoi-nage", group: @tewaza},
      {name: "Seoi-otoshi", group: @tewaza},
    ]).pluck(:id)

    ashiwaza_techiniques = Technique.create([
      {name: "O-soto-gari", group: @ashiwaza},
      {name: "Ashi-harai", group: @ashiwaza},
      {name: "Uchi-mata", group: @ashiwaza},
    ]).pluck(:id)

    nagewaza_techiniques = tewaza_techiniques + ashiwaza_techiniques

    expect(@nagewaza.techiniques.pluck(:id)).to eq(nagewaza_techiniques)    
  end

end
