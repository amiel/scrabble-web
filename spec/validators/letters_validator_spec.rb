require 'spec_helper'

describe LettersValidator do

  let(:errors) { Hash.new { |h, k| h[k] = [] } }
  let(:record) { stub(errors: errors) }
  let(:validator) { LettersValidator.new(attributes: [:word]) }

  it 'is valid with only letters' do
    validator.validate_each(record, :word, 'ABCdef')
    expect(record.errors).to be_empty
  end

  it 'is valid with a non-letter' do
    validator.validate_each(record, :word, 'HI THERE')
    expect(record.errors[:word]).to_not be_empty
  end

  it 'does not error when nil' do
    validator.validate_each(record, :word, nil)
    expect(record.errors).to be_empty
  end
end
