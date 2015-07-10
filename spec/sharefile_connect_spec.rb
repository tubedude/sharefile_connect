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
#   describe 'upload' do
#     let(:data) { SharefileConnect::Data.new }
#     let(:paths) { ["Correspondences with LPs"] }
#     let(:folder_id) { data.items_by_path_id(paths) }
#
#     subject { data }
#
#     # before do
#     #   VCR.insert_cassette 'upload', :record => :none
#     # end
#     #
#     # after do
#     #   VCR.eject_cassette
#     # end
#
#     xit(:uploads) { expect(subject.upload_file(folder_id, 'sharefile.rb').response).to be_kind_of(Net::HTTPOK)}
#     xit(:zones_body) { expect(JSON.parse(subject.zones.response.body)).to be('') }
#     it(:root) { expect(JSON.parse(subject.root)['Children'].any?).to be_truthy }
#     it(:zones_id) { expect(subject.zone_id).to eq("zpfed2b3f5-fbbf-4ed5-9a58-f1bd888f01") }
#     it(:zones) { expect(subject.zones.response).to be_kind_of(Net::HTTPOK) }
#     it(:existant_folder) { expect(subject.items_by_path(paths).response).to be_kind_of(Net::HTTPOK) }
#     it(:folder_exists?) { expect(subject.folder_exists?("Correspondences with LPs")).to be_truthy }
#     it(:folder_exists_false) { expect(subject.folder_exists?("NONON", folder_id)).to be_falsey }
#     it(:folder_exists_true) { expect(subject.folder_exists?("Green", folder_id)).to be_truthy }
#     it(:existant_folder_id) { expect(subject.items_by_path_id(paths)).to eq('fo0a1e12-b2b9-4d62-9482-d149da647164') }
#     it(:non_existant_folder) { expect(subject.items_by_path(["Correspondences with LPs", 'NoNON']).response).to be_a_kind_of(Net::HTTPNotFound) }
#
#     # it(:create_folder) { expect(subject.create_folder('fo0a1e12-b2b9-4d62-9482-d149da647164', "New_New")).to be('')}
#   end
#
# end

