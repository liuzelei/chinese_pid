require 'spec_helper'

RSpec.describe ChinesePid do
  it "validate chinese pid" do
    p1 = ChinesePid.new("310104197912241276")
    expect(p1.gender).to eq(1)
    expect(p1.birthday).to eq(Date.new(1979, 12, 24))
    expect(p1.valid?).to be_truthy

    p2 = ChinesePid.new("310112199412155389")
    expect(p2.gender).to eq(0)
    expect(p2.birthday).to eq(Date.new(1994, 12, 15))
    expect(p2.valid?).to be_truthy

    p3 = ChinesePid.new("310112199412155380")
    expect(p3.gender).to be_nil
    expect(p3.birthday).to be_nil
    expect(p3.valid?).to be_falsey

    p4 = ChinesePid.new("310104791224127")
    expect(p4.gender).to eq(1)
    expect(p4.birthday).to eq(Date.new(1979, 12, 24))
    expect(p4.valid?).to be_truthy

    p5 = ChinesePid.new("310112941215538")
    expect(p5.gender).to eq(0)
    expect(p5.birthday).to eq(Date.new(1994, 12, 15))
    expect(p5.valid?).to be_truthy

    p6 = ChinesePid.new("31011294121553")
    expect(p6.gender).to be_nil
    expect(p6.birthday).to be_nil
    expect(p6.valid?).to be_falsey

    p7 = ChinesePid.new("31011619780516889X")
    expect(p7.gender).to eq(1)
    expect(p7.birthday).to eq(Date.new(1978, 5, 16))
    expect(p7.valid?).to be_truthy

    p8 = ChinesePid.new("110101201201012998")
    expect(p8.gender).to eq(1)
    expect(p8.birthday).to eq(Date.new(2012, 1, 1))
    expect(p8.valid?).to be_truthy

    # add 10 month
    p10 = ChinesePid.new("310221195510153639")
    expect(p10.gender).to eq(1)
    expect(p10.birthday).to eq(Date.new(1955, 10, 15))
    expect(p10.valid?).to be_truthy
  end
end
