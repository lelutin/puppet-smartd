# frozen_string_literal: true

Facter.add(:smartd) do
  setcode do
    Facter::Core::Execution.which('smartd')
  end
end
