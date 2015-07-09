require 'spec_helper'

describe SharefileConnect do
  # it 'has a version number' do
  #   expect(SharefileConnect::VERSION).not_to be nil
  # end
  #
  # xit "must include httparty methods" do
  #   SharefileConnect::Connection.must_include HTTParty
  # end
  #
  # context 'enviroment variables' do
  #   it('loads envs') { expect(SharefileConnect::BASE_URI).to eq('https://monashees.sf-api.com/sf/v3') }
  # end
  #
  #
  # describe 'Connection' do
  #   let(:connection) { SharefileConnect::Connection.new }
  #
  #   before do
  #     VCR.insert_cassette 'connection', :record => :new_episodes
  #   end
  #
  #   after do
  #     VCR.eject_cassette
  #   end
  #
  #   it(:token_keys) { expect(connection.token.keys).to eq(%w(access_token refresh_token token_type appcp apicp subdomain expires_in access_files_folders modify_files_folders admin_users admin_accounts change_my_settings web_app_login)) }
  #
  # end
  # describe 'Data' do
  #   let(:data) { SharefileConnect::Data.new }
  #   subject { data }
  #
  #   before do
  #     VCR.insert_cassette 'data', :record => :new_episodes
  #   end
  #
  #   after do
  #     VCR.eject_cassette
  #   end
  #
  #   it(:data) { expect(subject.root).to be_a_kind_of(Hash) }
  #   xit(:children) { expect(subject.root["Children"]).to be('') }
  # end
  #
  # describe 'Correspondance' do
  #   let(:data) { SharefileConnect::Data.new }
  #   subject { data }
  #
  #   before do
  #     VCR.insert_cassette 'correspondance', :record => :new_episodes
  #   end
  #
  #   after do
  #     VCR.eject_cassette
  #   end
  #
  #   it(:data) { expect(subject.root('stfobe7ba3e7-bed0-486b-a7d9-85b77179')).to be_a_kind_of(Hash) }
  #   it(:children) { expect(subject.root('stfobe7ba3e7-bed0-486b-a7d9-85b77179')["Children"].first['Name']).to eq('Otavio') }
  #   xit(:folder_access_info) { expect(subject.folder_access_info('stfobe7ba3e7-bed0-486b-a7d9-85b77179')).to be_a_kind_of(NilClass) }
  #
  # end
  # describe 'items_by_path' do
  #   let(:data) { SharefileConnect::Data.new }
  #   let(:paths) { ["Correspondences with LPs"] }
  #   subject { data }
  #
  #   before do
  #     VCR.insert_cassette 'items_by_path', :record => :new_episodes
  #   end
  #
  #   after do
  #     VCR.eject_cassette
  #   end
  #
  #   it(:data) { expect(subject.items_by_path(paths)).to be_a_kind_of(Hash) }
  #   it(:children) { expect(subject.items_by_path(paths)['Id']).to eq('') }
  #   xit(:folder_access_info) { expect(subject.folder_access_info('')).to be_a_kind_of(NilClass) }
  #
  # end
  #
  # describe 'upload' do
  #   let(:data) { SharefileConnect::Data.new }
  #   let(:paths) { ["Correspondences with LPs"] }
  #   let(:folder_id) { data.items_by_path(paths)['Id'] }
  #
  #   subject { data }
  #
  #   # before do
  #   #   VCR.insert_cassette 'upload', :record => :none
  #   # end
  #   #
  #   # after do
  #   #   VCR.eject_cassette
  #   # end
  #
  #   it(:uploads) { expect(subject.upload_file(folder_id, 'sharefile.rb')).to be('x') }
  # end

end

