require 'rails_helper'

RSpec.describe Group, type: :model do
  
  before(:all) do
    @nagewaza = Group.create(name: "Nage-waza")
    @tewaza = Group.create(name: "Te-waza", major_group: @nagewaza)
    @ashiwaza = Group.create(name: "Ashi-waza", major_group: @nagewaza)
  end

  it "validates presence of name" do
    group = Group.new(name: '')
    expect(group).to_not be_valid
  end

  it "validates alias group_id" do
    expect(@tewaza.major_group).to eq(@tewaza.group)
    expect(@tewaza.parent).to eq(@tewaza.group)
  end

  it "validates group relations" do
    
    expect(@nagewaza.group).to be_nil

    minor_group = Group.new(:name => "Tachi-waza", :group => @nagewaza)
    minor_group.save
    expect(minor_group.group).to equal(@nagewaza)
  end

  it "return all techniques subgroups" do
    expect(@nagewaza.subgroups.pluck(:id)).to match_array([@tewaza.id, @ashiwaza.id])
  end

  it "return all techniques from a group and subgroups" do
    tewaza_techniques = Technique.create([
      {name: "Seoi-nage", group: @tewaza},
      {name: "Ippon-seoi-nage", group: @tewaza},
      {name: "Seoi-otoshi", group: @tewaza},
    ]).pluck(:id)

    ashiwaza_techniques = Technique.create([
      {name: "O-soto-gari", group: @ashiwaza},
      {name: "Ashi-harai", group: @ashiwaza},
      {name: "Uchi-mata", group: @ashiwaza},
    ]).pluck(:id)

    nagewaza_techniques = tewaza_techniques + ashiwaza_techniques

    expect(@nagewaza.techniques.pluck(:id)).to match_array(nagewaza_techniques)    
  end

  it "db:seed sentence" do
    katamewaza = Group.new(name: "Katame-waza")
    expect(katamewaza.save).to be true

    osaekomiwaza = Group.new(name: "Osaekomi-waza", major_group: katamewaza)
    expect(osaekomiwaza.save).to be true

    Technique.create([{name: "Kesa-gatame", group: osaekomiwaza},
      {name: "Kuzure-kesa-gatame", group: osaekomiwaza},
      {name: "Ushiro-kesa-gatame", group: osaekomiwaza},
      {name: "Kata-gatame", group: osaekomiwaza},
      {name: "Kami-shiho-gatame", group: osaekomiwaza},
      {name: "Kuzure-kami-shiho-gatame", group: osaekomiwaza},
      {name: "Yoko-shiho-gatame", group: osaekomiwaza},
      {name: "Tate-shiho-gatame", group: osaekomiwaza},
      {name: "Uki-gatame", group: osaekomiwaza},
      {name: "Ura-gatame", group: osaekomiwaza},
    ])
    expect(Technique.all.count).to be > 0
  end

end
