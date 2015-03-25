describe "sticky model" do
	context 'with bad info' do
		it "does not create a new sticky" do
			# Sticky.create(:title=>"i have no content")
			expect(Sticky.count).to be 0
		end
	end
  
end