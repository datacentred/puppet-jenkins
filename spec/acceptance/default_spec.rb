require 'spec_helper_acceptance'

describe 'puppetdeploy' do
  context 'all in one' do
    it 'provisions with no errors' do
      pp = <<-EOS
        include ::jenkins
      EOS
      # Check for clean provisioning and idempotency
      apply_manifest pp, :catch_failures => true
      apply_manifest pp, :catch_changes => true
    end
    it 'allows http connection on port 8080' do
      shell 'sleep 15'
      shell 'nc -vz 127.0.0.1 8080', :acceptable_exit_codes => 0
    end
  end
end
