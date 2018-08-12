require 'spec_helper'

module IllBeBack
  describe Manager do

    let(:binding) { double 'binding' }

    it 'should not debug' do
      expect(binding).not_to receive(:pry)
      subject.debug { binding.fruit } # not called
    end

    it 'should stop once' do
      expect(binding).to receive(:pry).once.with(no_args)
      subject.debug { binding.fruit } # not called
      subject.prepare!
      subject.debug { binding.pry } # called
      subject.debug { binding.fruit } # not called
    end

    it 'should stop twice' do
      expect(binding).to receive(:pry).twice.with(no_args)
      subject.debug(2.times) { binding.fruit } # not called
      subject.prepare!
      subject.debug(2.times) { binding.pry } # called
      subject.debug(2.times) { binding.pry } # called
      subject.debug(2.times) { binding.fruit } # not called
    end

    it 'should stop at 2nd call' do
      expect(binding).to receive(:pry).once.with(no_args)
      subject.prepare!
      subject.debug_at_call(2) { binding.fruit } # not called
      subject.debug_at_call(2) { binding.pry } # called
      subject.debug_at_call(2) { binding.fruit } # not called
      subject.debug_at_call(2) { binding.fruit } # not called
    end

    it 'should stop between 2nd and 4th calls' do
      expect(binding).to receive(:pry).at_least(3).times.with(no_args)
      subject.prepare!
      subject.debug_between_calls(2, 4) { binding.fruit } # not called
      subject.debug_between_calls(2, 4) { binding.pry } # called
      subject.debug_between_calls(2, 4) { binding.pry } # called
      subject.debug_between_calls(2, 4) { binding.pry } # called
      subject.debug_between_calls(2, 4) { binding.fruit } # not called
      subject.debug_between_calls(2, 4) { binding.fruit } # not called
    end

  end
end
