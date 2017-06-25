require 'spec_helper'

module IllBeBack
  describe Manager do

    let(:debugger){ double }
    let(:subject){ Manager.new(debugger) }

    it 'shouldnt be armed' do
      expect(subject.armed?).to eq false
    end

    it 'should be armed' do
      subject.prepare!
      expect(subject.armed?).to eq true
    end

    it 'shouldnt call the debugger' do
      subject.debug
    end

    it 'should call the debugger' do
      caller = double
      subject.prepare!
      expect(debugger).to receive(:call).with(caller)
      manager = subject
      caller.instance_exec { manager.debug }
    end

  end
end
