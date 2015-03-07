require_relative 'spec_helper'

describe 'the system gemrc file' do
  let(:subject) { file('/etc/gemrc') }

  it 'has the public source defined' do
    expect(subject.content).to match(%r{https://gems.example.com})
  end

  it 'has the private source defined' do
    expect(subject.content).to match(%r{https://gemserver.company.com})
  end

  it 'has the install command options' do
    expect(subject.content).to match(/install: --no-rdoc --no-ri/)
  end

  it 'has the update command options' do
    expect(subject.content).to match(/update: --no-rdoc --no-ri/)
  end
end
