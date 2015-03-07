require_relative 'spec_helper'

describe 'foobar gemrc sources' do
  let(:subject) { file('/home/foobar/.gemrc') }

  it 'has the sources configuration' do
    expect(subject.content).to match(/:sources:/)
  end

  it 'has the public source defined' do
    expect(subject.content).to match(%r{ - https://gems.example.com})
  end

  it 'has the private source defined' do
    expect(subject.content).to match(%r{ - https://gemserver.company.com})
  end
end
