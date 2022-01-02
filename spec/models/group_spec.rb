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


  it "return all techniques subgroups" do
    nagewaza = Group.create(name: "Nage-waza")
    tewaza = Group.create(name: "Te-waza", major_group: nagewaza.id)
    ashiwaza = Group.create(name: "Ashi-waza", major_group: nagewaza.id)
    expect(nagewaza.subgroups.pluck(:id)).to eq([tewaza.id, ashiwaza.id])
  end


  it "return all techniques from a group and subgroups" do

    nagewaza = Group.create(name: "Nage-waza")
    tewaza = Group.create(name: "Te-waza", major_group: nagewaza.id)
    ashiwaza = Group.create(name: "Ashi-waza", major_group: nagewaza.id)

    tewaza_techiniques = Technique.create([
      {name: "Seoi-nage", group_id: tewaza.id},
      {name: "Ippon-seoi-nage", group_id: tewaza.id},
      {name: "Seoi-otoshi", group_id: tewaza.id},
    ]).pluck(:id)

    ashiwaza_techiniques = Technique.create([
      {name: "O-soto-gari", group_id: ashiwaza.id},
      {name: "Ashi-harai", group_id: ashiwaza.id},
      {name: "Uchi-mata", group_id: ashiwaza.id},
    ]).pluck(:id)

    nagewaza_techiniques = tewaza_techiniques + ashiwaza_techiniques

    expect(nagewaza.techiniques.pluck(:id)).to eq(nagewaza_techiniques)    
  end

end
