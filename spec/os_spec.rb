require 'spec_helper'
require 'ronin/os'

describe OS do
  subject do
    OS.new(:name => 'Linux', :version => '2.6.11')
  end

  it "should require a name" do
    os = OS.new
    os.should_not be_valid

    os.name = 'test'
    os.should be_valid
  end

  it "should provide methods for built-in OSes" do
    OS.linux.should_not be_nil
  end

  it "should provide methods for creating OSes with versions" do
    OS.linux('2.6.11').should be_valid
  end

  describe "#to_s" do
    it "should convert both the name and version" do
      os = OS.new(:name => 'Linux', :version => '2.6.23')

      os.to_s.should == 'Linux 2.6.23'
    end

    it "should convert just the name if there is no version" do
      os = OS.new(:name => 'Linux')

      os.to_s.should == os.name
    end
  end

  it "should implicitly splat the name and version" do
    os = OS.new(:name => 'Linux', :version => '2.6.23')
    name, version = os

    name.should == os.name
    version.should == os.version
  end
end
