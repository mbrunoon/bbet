require 'rails_helper'

RSpec.describe Technique, type: :model do
  
  it "validate presence of technique name" do
    technique = Technique.new({
      "name" => "O-soto-gari",
      "url" => "https://www.youtube.com/watch?v=c-A_nP7mKAc"
    })
    expect(technique).to be_valid
  end

  it "validate blank technique name" do
    technique = Technique.new({
      "name" => "",
      "url" => "https://www.youtube.com/watch?v=c-A_nP7mKAc"
    })
    expect(technique).to_not be_valid
  end


end
