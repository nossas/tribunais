require 'spec_helper'

describe Poke do
  it { should validate_presence_of :user_id }
  it { should validate_uniqueness_of :user_id }
end
