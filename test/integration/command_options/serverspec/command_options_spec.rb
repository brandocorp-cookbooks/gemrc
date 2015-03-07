require_relative 'spec_helper'

describe 'foobar gemrc command options' do
  let(:subject) { file('/home/foobar/.gemrc') }

  %w(
    build cert check cleanup contents dependency environment fetch
    generate_index help install list lock mirror open outdated owner pristine
    push query rdoc search server source specification stale uninstall unpack
    update which yank
  ).each do |cmd|
    it "has the #{cmd} command options" do
      expect(subject.content).to match(/#{cmd}: --quiet/)
    end
  end
end
