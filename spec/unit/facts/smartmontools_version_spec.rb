# frozen_string_literal: true

require 'spec_helper'

describe 'smartmontools_version', type: :fact do
  before { Facter.clear }

  context 'when smartd fact not set' do
    it 'returns nil' do
      allow(Facter.fact(:smartd)).to receive(:value).and_return(nil)
      expect(Facter.fact(:smartmontools_version).value).to be_nil
    end
  end

  context 'when smartd fact is broken' do
    it 'returns nil' do
      allow(Facter.fact(:smartd)).to receive(:value).and_return('foobar')
      expect(Facter.fact(:smartmontools_version).value).to be_nil
    end
  end

  context 'when smartd fact is working' do
    it 'returns the version string' do
      allow(Facter.fact(:smartd)).to receive(:value).and_return('/usr/sbin/smartd')
      allow(Facter::Util::Resolution).to receive(:exec).
        with('/usr/sbin/smartd --version').
        and_return(file_fixture('smartd/version-smartmontools-5.42-2.el5').read)
      expect(Facter.fact(:smartmontools_version).value).to eq('5.42')
    end

    it 'returns the version string even with additional dots in last component' do
      allow(Facter.fact(:smartd)).to receive(:value).and_return('/usr/sbin/smartd')
      allow(Facter::Util::Resolution).to receive(:exec).
        with('/usr/sbin/smartd --version').
        and_return(file_fixture('smartd/version-smartmontools-5.43-1.el6.x86_64').read)
      expect(Facter.fact(:smartmontools_version).value).to eq('5.43')
    end
  end
end
